package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import chisel3.experimental.ChiselEnum
import os.stat

class MissReq()(implicit val p: Parameters) extends MyBundle {
    val addr = UInt(xlen.W)
    val dirInfo = new DirectoryInfo
    val dirtyTag = UInt(dcacheTagBits.W)
    val data = Vec(dcacheBlockSize, UInt((dcacheBlockBytes*8).W))
    val isStore = Bool()
    val storeData = UInt((dcacheBlockBytes*8).W)
    val storeMask = UInt(dcacheBlockBytes.W)
}

class MissResp()(implicit val p: Parameters) extends MyBundle {
    val load = Decoupled(new CacheReadResp)
    val store = Decoupled(new CacheWriteResp)
}

class MSHRTasks()(implicit val p: Parameters) extends MyBundle {
    val refill = new Bundle{
                    val req = Decoupled(new RefillReqBundle)
                    val resp = Flipped(Decoupled(new RefillRespBundle))
                }
    val writeback = new Bundle{
                        val req = Decoupled(new WritebackReqBundle)
                        val resp = Flipped(Decoupled(new WritebackRespBundle))
                    }
}

class MSHRIO()(implicit val p: Parameters) extends MyBundle {
    val req = Flipped(Decoupled((new MissReq)))
    val resp = new MissResp
    val tasks = new MSHRTasks 
    val busy = Output(Bool())
    val dirWrite = Flipped(new DirectoryWriteBus)
    val dataWrite = Flipped(new DataBankArrayWrite)
}

object MSHR {
    object State extends ChiselEnum {
        val sIdle, sWriteback, sRefill, sWriteData, sResp = Value
    }
}
class MSHR()(implicit val p: Parameters) extends MyModule {
    import MSHR.State
    import MSHR.State._ 

    val io = IO(new MSHRIO)
    io <> DontCare

    val reqReg = RegEnable(io.req.bits, io.req.fire)
    val req = Mux(io.req.fire, io.req.bits, reqReg)
    val reqValidReg = RegEnable(true.B, io.req.fire)
    val reqValid = Mux(io.req.fire, true.B, reqValidReg)

    val state = RegInit(sIdle)
    val nextState = WireInit(sIdle)

    io.busy := state === sIdle
    io.req.ready := state === sIdle

    // 000
    when(state === sIdle) {
        nextState := sIdle
        when(io.req.fire) {
            when(io.req.bits.dirInfo.isDirtyWay) {
                nextState := sWriteback
            }.otherwise{
                nextState := sRefill
            }
        }
    }

    // 001
    when(state === sWriteback) {
        nextState := sWriteback
        when(io.tasks.writeback.resp.fire) {
            nextState := sRefill
        }
    }

    // 010
    when(state === sRefill) {
        nextState := sRefill
        when(io.tasks.refill.resp.fire && req.isStore) {
            nextState := sWriteData
        }.elsewhen(io.tasks.refill.resp.fire) {
            nextState := sResp
        }

        when(io.resp.load.fire) {
            nextState := sIdle
        }
    }

    // 011
    when(state === sWriteData) {
        nextState := sWriteData
        when(io.dirWrite.req.fire && io.dataWrite.req.fire) {
            nextState := sResp
        }

        when(io.resp.store.fire) {
            nextState := sIdle
        }
    }

    // 100
    when(state === sResp) {
        nextState := sResp
        when(io.resp.load.fire || io.resp.store.fire) {
            nextState := sIdle
        }
    }

    state := nextState

    val willRefill       = !io.req.bits.dirInfo.isDirtyWay && !io.req.bits.dirInfo.hit && io.req.fire
    val willWriteback    = io.req.bits.dirInfo.isDirtyWay && !io.req.bits.dirInfo.hit && io.req.fire
    val willWriteStore   = state === sRefill && req.isStore && io.tasks.refill.resp.fire
    val willRespLoad     = state === sRefill && !req.isStore && io.tasks.refill.resp.fire
    val willRespStore    = state === sWriteData && io.dirWrite.req.fire && io.dataWrite.req.fire

    io.tasks.refill.req.valid := state === sRefill || willRefill
    io.tasks.refill.req.bits.addr := req.addr
    io.tasks.refill.req.bits.chosenWay := req.dirInfo.chosenWay
    io.tasks.refill.resp.ready := true.B

    // write back dirty block data into next level memory
    io.tasks.writeback.req.valid := state === sWriteback || willWriteback
    io.tasks.writeback.req.bits.addr := req.addr
    io.tasks.writeback.req.bits.dirtyTag := req.dirtyTag //req.dirInfo.dirtyTag
    io.tasks.writeback.req.bits.data := req.data
    io.tasks.writeback.resp.ready := true.B


    io.dirWrite.req.valid := state === sWriteData || willWriteStore
    io.dirWrite.req.bits.addr := reqReg.addr
    val meta = Wire(new DCacheMeta)
    meta.dirty := true.B
    meta.valid := true.B
    io.dirWrite.req.bits.meta := meta.asUInt
    io.dirWrite.req.bits.way := reqReg.dirInfo.chosenWay

    // write store data into dataBanks
    io.dataWrite.req.valid := state === sWriteData || willWriteStore
    io.dataWrite.req.bits.blockSelOH := addrToDCacheBlockOH(reqReg.addr)
    val oldData = Mux(io.tasks.refill.resp.fire, io.tasks.refill.resp.bits.data, RegEnable(io.tasks.refill.resp.bits.data, io.tasks.refill.resp.fire))
    io.dataWrite.req.bits.data := dcacheMergeData(oldData, reqReg.storeData, reqReg.storeMask) 
    io.dataWrite.req.bits.set := addrToDCacheSet(reqReg.addr)
    io.dataWrite.req.bits.way := reqReg.dirInfo.chosenWay


    io.resp.load.valid := !req.isStore && (state === sResp || willRespLoad)
    io.resp.load.bits.data := Mux(io.tasks.refill.resp.fire, 
                                io.tasks.refill.resp.bits.data, 
                                RegEnable(io.tasks.refill.resp.bits.data, io.tasks.refill.resp.fire)
                            )

    io.resp.store.valid := req.isStore && (state === sResp || willRespStore)
}

object MSHRGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    println("Generating the MSHR hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new MSHR()(defaultConfig), Array("--target-dir", "build"))
}


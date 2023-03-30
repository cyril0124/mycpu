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

    io.tasks.refill.req.valid := state === sRefill
    io.tasks.refill.req.bits.addr := req.addr
    io.tasks.refill.req.bits.chosenWay := req.dirInfo.chosenWay
    io.tasks.refill.resp.ready := true.B


    io.tasks.writeback.req.valid := state === sWriteback
    io.tasks.writeback.req.bits.addr := req.addr
    io.tasks.writeback.req.bits.dirtyTag := req.dirInfo.dirtyTag
    io.tasks.writeback.req.bits.data := req.data
    io.tasks.writeback.resp.ready := true.B


    io.dirWrite.req.valid := state === sWriteData
    io.dirWrite.req.bits.addr := req.addr
    val meta = Wire(new DCacheMeta)
    meta.dirty := true.B
    meta.valid := true.B
    io.dirWrite.req.bits.meta := meta.asUInt
    io.dirWrite.req.bits.way := req.dirInfo.chosenWay


    io.dataWrite.req.valid := state === sWriteData
    io.dataWrite.req.bits.blockSelOH := addrToDCacheBlockOH(req.addr)
    io.dataWrite.req.bits.data := req.storeData
    io.dataWrite.req.bits.set := addrToDCacheSet(req.addr)
    io.dataWrite.req.bits.mask := req.storeMask
    io.dataWrite.req.bits.way := req.dirInfo.chosenWay


    io.resp.load.valid := !req.isStore && state === sResp
    io.resp.load.bits.data := Mux(io.tasks.refill.resp.fire, io.tasks.refill.resp.bits.data, RegEnable(io.tasks.refill.resp.bits.data, io.tasks.refill.resp.fire))

    io.resp.store.valid := req.isStore && state === sResp
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


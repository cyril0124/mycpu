package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import chisel3.experimental.ChiselEnum

class RefillReqBundle()(implicit val p: Parameters) extends MyBundle {
    val addr = UInt(xlen.W)
    val chosenWay = UInt(dcacheWays.W)
}

class RefillRespBundle()(implicit val p: Parameters) extends MyBundle {
    val data = UInt((dcacheBlockBytes*8).W)
    val blockData = Vec(dcacheBlockSize, UInt((dcacheBlockBytes*8).W))
}

class RefillPipeIO()(implicit val p: Parameters) extends MyBundle {
    val req = Flipped(Decoupled( new RefillReqBundle))
    val resp = Decoupled(new RefillRespBundle)
    val tlbus = new TLMasterBusUL
    val dirWrite = Flipped(new DirectoryWriteBus)
    val dataWrite = Flipped(new DataBankArrayWrite)
}

object RefillPipe {
    object State extends ChiselEnum {
        val sIdle, sGet, sRefillData, sResp = Value
    }
}

class RefillPipe()(implicit val p: Parameters) extends MyModule {
    import RefillPipe.State
    import RefillPipe.State._ 

    val io = IO(new RefillPipeIO)
    io <> DontCare

    val state = RegInit(sIdle)
    val nextState = WireInit(sIdle)

    io.req.ready := state === sIdle

    val reqReg = RegEnable(io.req.bits, io.req.fire)
    val req = Mux(io.req.fire, io.req.bits, reqReg)
    val reqValidReg = RegEnable(true.B, io.req.fire)
    val reqValid = Mux(io.req.fire, true.B, reqValidReg)
    val dataBlockSelOH = addrToDCacheBlockOH(reqReg.addr)

    val beatCounter = Counter(dcacheBlockSize)
    val beatOH = UIntToOH(beatCounter.value)
    val lastBeat = beatCounter.value === (dcacheBlockSize-1).U
    val refillFire = io.tlbus.resp.fire && io.tlbus.resp.bits.opcode === BusReq.AccessAckData
    val refillLastBeat = refillFire && lastBeat
    val refillResp = io.tlbus.resp.bits
    io.tlbus.resp.ready := io.dataWrite.req.ready && io.dirWrite.req.ready

    // refill data
    val refillBlockDataArray = RegInit(VecInit((0 until dcacheBlockSize).map{i => 0.U((dcacheBlockBytes*8).W)}))
    when(refillFire) { refillBlockDataArray(beatCounter.value) := refillResp.data }
    val refillBlockData = WireInit(VecInit((0 until dcacheBlockSize).map{ i => if(i != dcacheBlockSize-1) refillBlockDataArray(i) else refillResp.data }))
    // val readRespData = Mux1H(dataBlockSelOH, refillBlockData)


    // send Get
    // 00
    when(state === sIdle) {
        nextState := sIdle
        when(io.req.fire) {
            nextState := sGet
        }
        when(io.tlbus.req.fire) {
            nextState := sRefillData
            reqValidReg := false.B
        }
    }

    // send Get while tlbus req channel did not ready when refill request is fired
    // 01
    when(state === sGet) {
        nextState := sGet
        when(io.tlbus.req.fire) {
            nextState := sRefillData
            reqValidReg := false.B
        }
    }

    // refill data
    // 10
    when(state === sRefillData) {
        nextState := sRefillData
        when(refillLastBeat) {
            nextState := sResp
            when(io.resp.fire) {
                nextState := sIdle
            }
            beatCounter.reset()
        }.elsewhen(refillFire) {
            nextState := sRefillData
            beatCounter.inc()
        }
    }

    // waitting for tlbus refill data complete
    // 11
    when(state === sResp) {
        nextState := sResp
        when(io.resp.fire) {
            nextState := sIdle
        }
    }

    state := nextState

    // writeback directory
    val refillSafe = refillFire && state === sRefillData
    io.dirWrite.req.valid := refillSafe && lastBeat
    io.dirWrite.req.bits.addr := reqReg.addr
    val meta = Wire(new DCacheMeta)
    meta.valid := true.B 
    meta.dirty := false.B
    io.dirWrite.req.bits.meta := meta.asUInt
    io.dirWrite.req.bits.way := reqReg.chosenWay

    // writeback databank
    io.dataWrite.req.valid := refillSafe
    io.dataWrite.req.bits.blockSelOH := beatOH
    io.dataWrite.req.bits.way := reqReg.chosenWay
    io.dataWrite.req.bits.set := addrToDCacheSet(reqReg.addr)
    io.dataWrite.req.bits.data := refillResp.data
    
    // send refill resp
    io.resp.valid := state === sResp || refillLastBeat
    io.resp.bits.data := Mux1H(dataBlockSelOH, refillBlockData) // for load
    io.resp.bits.blockData := refillBlockData

    // send Get request
    val blockAddr = Cat(req.addr(xlen-1, dcacheByteOffsetBits + dcacheBlockBits), Fill(dcacheByteOffsetBits + dcacheBlockBits, 0.U))
    io.tlbus.req.valid := reqValid
    io.tlbus.req.bits <> DontCare
    io.tlbus.req.bits.opcode := BusReq.Get
    io.tlbus.req.bits.address := blockAddr
    io.tlbus.req.bits.size := (dcacheBlockBytes * dcacheBlockSize).U

}
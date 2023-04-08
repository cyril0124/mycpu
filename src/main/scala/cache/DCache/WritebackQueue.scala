package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import chisel3.experimental.ChiselEnum
import os.stat

class WritebackReqBundle()(implicit val p: Parameters) extends MyBundle {
    val addr = UInt(xlen.W)
    val dirtyTag = UInt(dcacheTagBits.W)
    val data = Vec(dcacheBlockSize, UInt((dcacheBlockBytes*8).W))
}

class WritebackRespBundle()(implicit val p: Parameters) extends MyBundle {
    // val opcode = UInt(3.W)
    // val source = UInt(log2Ceil(nrBusMaster).W)
    // val sink = UInt(log2Ceil(nrBusSlave).W)
}

class WritebackQueueIO()(implicit val p: Parameters) extends MyBundle {
    val req = Flipped(Decoupled(new WritebackReqBundle))
    val resp = Decoupled(new WritebackRespBundle)
    val tlbus = new TLMasterBusUL
}

object WritebackQueue {
    object State extends ChiselEnum {
        val sIdle, sPutFullData, sAccessAck, sResp = Value
    }
}

class WritebackQueue()(implicit val p: Parameters) extends MyModule {
    import WritebackQueue.State
    import WritebackQueue.State._ 

    val io = IO(new WritebackQueueIO)

    val reqReg = RegEnable(io.req.bits, io.req.fire)
    val req = Mux(io.req.fire, io.req.bits, reqReg)
    val reqValidReg = RegEnable(true.B, io.req.fire)
    val reqValid = Mux(io.req.fire, true.B, reqValidReg)

    val busBeatWrBlock = busBeatSize / dcacheBlockBytes // how many block will each bus beat write into
    val busTotalBeat = dcacheBlockSize / busBeatWrBlock // how many beat will the bus transfer in order to fullfill the whole cacheLine
    val serializer = Module(new TLSerializer(Vec(busBeatWrBlock, UInt((dcacheBlockBytes*8).W)), busTotalBeat))
    serializer.io.in.valid := reqValid
    serializer.io.in.bits := req.data.asTypeOf(Vec(busTotalBeat, Vec(busBeatWrBlock, UInt((dcacheBlockBytes*8).W))))

    val state = RegInit(sIdle)
    val nextState = WireInit(sIdle)

    io.req.ready := state === sIdle

    when(state === sIdle) {
        nextState := sIdle
        when(io.req.fire) {
            nextState := sPutFullData
        }
    }

    when(state === sPutFullData) {
        nextState := sPutFullData
        when(serializer.io.fireAll) {
            nextState := sAccessAck

            reqValidReg := false.B
        }
    }

    when(state === sAccessAck) {
        nextState := sAccessAck
        when(io.tlbus.resp.fire) {
            nextState := sResp

            when(io.resp.fire) {
                nextState := sIdle
            }
        }
    }

    when(state === sResp) {
        nextState := sResp
        when(io.resp.fire) {
            nextState := sIdle

            reqValidReg := false.B
        }
    }
    
    state := nextState

    io.resp.valid := state === sResp || io.tlbus.resp.fire && state === sAccessAck 

    io.tlbus.resp.ready := true.B

    serializer.io.out.ready := io.tlbus.req.ready
    io.tlbus.req.valid := serializer.io.out.valid
    io.tlbus.req.bits <> DontCare
    io.tlbus.req.bits.data := serializer.io.out.bits.asUInt
    io.tlbus.req.bits.opcode := BusReq.PutFullData
    val dirtyTag = req.dirtyTag
    val dirtySet = addrToDCacheSet(req.addr)
    dontTouch(dirtySet)
    dontTouch(dirtyTag)
    val writebackAddr = Cat(dirtyTag, dirtySet, Fill(dcacheByteOffsetBits + dcacheBlockBits, 0.U))
    io.tlbus.req.bits.address :=  writebackAddr + (serializer.io.beatCounter << dcacheByteOffsetBits)
    io.tlbus.req.bits.mask := Fill(dcacheWays, 1.U)
    io.tlbus.req.bits.size := (dcacheBlockBytes * dcacheBlockSize).U
}
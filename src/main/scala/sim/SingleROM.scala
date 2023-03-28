package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.util.experimental.loadMemoryFromFile

import mycpu.common._
import mycpu.util._

abstract class SingleMemBase()(implicit val p: Parameters) extends MyModule {
    val io = IO(new TLSlaveBusUL)

    val mem = SyncReadMem(romSize, UInt(xlen.W))

    val reqReg = RegEnable(io.req.bits, io.req.fire)
    val req = Mux(io.req.fire, io.req.bits, reqReg)
    val reqBeatSize = reqReg.size >> log2Ceil(busBeatSize) // byte to number
    val busy = RegInit(false.B)
    val finish = Wire(Bool())

    io.req.ready := !busy //|| finish

    val beatCounter = Counter(busMaxBeat)
    val lastBeat = beatCounter.value === reqBeatSize - 1.U
    val lastBeat_1 = beatCounter.value === reqBeatSize // for Get
    when( finish ) {
        beatCounter.reset()
    }.elsewhen(
        (io.resp.fire || io.req.fire) && req.opcode === BusReq.Get || 
        io.req.fire && req.opcode === BusReq.PutFullData
    ) {
        beatCounter.inc()
    }
    
    val getFire = io.req.fire && req.opcode === BusReq.Get
    val putFire = io.req.fire && lastBeat && req.opcode === BusReq.PutFullData // PutFullData send last beat(indicates the end of a Put transaction)
    val reqLatch = getFire || putFire
    when(reqLatch) { busy := true.B }
    .elsewhen(busy && finish) { busy := false.B }

    val ren = req.opcode === BusReq.Get && (io.req.fire || io.resp.fire) // read data when Get req fire and Get resp fire since SyncReadMem will take one cycle to read data
    val wen = io.req.fire && req.opcode === BusReq.PutFullData
    dontTouch(ren)
    dontTouch(wen)

    val addrOff = beatCounter.value << log2Ceil(xlen / 8)
    val rdAddr = (req.address + addrOff) >> log2Ceil(xlen / 8) // divide by 4 (beatSize == 4 Byte)
    dontTouch(rdAddr)
    val rdata = mem.read(rdAddr, ren)

    val wrAddr = req.address >> log2Ceil(xlen / 8)
    dontTouch(wrAddr)
    when(wen) {
        mem.write(wrAddr, req.data)
    }
    
    io.resp.valid := busy
    io.resp.bits <> DontCare
    io.resp.bits.data := rdata
    io.resp.bits.opcode := Mux(reqReg.opcode === BusReq.Get, BusReq.AccessAckData, BusReq.AccessAck)
    io.resp.bits.source := reqReg.source
    
    finish := io.resp.fire && (reqReg.opcode === BusReq.PutFullData || reqReg.opcode === BusReq.Get && lastBeat_1)
}

class SingleROM()(override implicit val p: Parameters) extends SingleMemBase{
    loadMemoryFromFile(mem, "/home/cyril/workspace/riscv/mycpu/src/main/resources/Imem.hex")
}

class SingleRAM()(override implicit val p: Parameters) extends SingleMemBase{
    loadMemoryFromFile(mem, "/home/cyril/workspace/riscv/mycpu/src/main/resources/Dmem.hex")
}


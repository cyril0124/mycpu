package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.util.experimental.loadMemoryFromFile

import mycpu.common._
import mycpu.util._

class SingleROM()(implicit val p: Parameters) extends MyModule{
    val io = IO(new TLSlaveBusUL)

    val req = Mux(io.req.fire, io.req.bits, RegEnable(io.req.bits, io.req.fire))
    val reqBeatSize = req.size >> log2Ceil(busBeatSize) // byte to number
    val busy = RegInit(false.B)

    io.req.ready := !busy

    when(io.req.fire) {
        busy := true.B
    }

    val rom = SyncReadMem(romSize, UInt(xlen.W))
    loadMemoryFromFile(rom, "/home/cyril/workspace/riscv/mycpu/src/main/resources/Imem.hex")

    val ren = req.opcode === BusReq.Get && (io.req.fire || busy)
    val wen = io.req.fire && req.opcode === BusReq.PutFullData

    val beatCounter = Counter(10)
    val lastBeat = beatCounter.value === reqBeatSize
    when(io.req.fire && lastBeat && req.opcode === BusReq.Get) {
        beatCounter.reset()
    }.elsewhen((io.req.fire || io.resp.fire) && req.opcode === BusReq.Get) {
        beatCounter.inc()
    }

    val addrOff = beatCounter.value << log2Ceil(xlen / 8)
    val rdAddr = (req.address + addrOff) >> 2 // divide by 4
    val rdata_1 = rom.read(rdAddr)
    val rdata = Mux(ren, rdata_1, RegEnable(rdata_1, RegNext(ren)))
    when(wen) {
        rom.write(req.address, req.data)
    }
    
    io.resp.valid := busy && (req.opcode === BusReq.Get || req.opcode === BusReq.PutFullData)
    io.resp.bits <> DontCare
    io.resp.bits.data := rdata
    io.resp.bits.opcode := Mux(req.opcode === BusReq.Get, BusReq.AccessAckData, BusReq.AccessAck)
    io.resp.bits.source := req.source

    when(io.resp.fire && (req.opcode === BusReq.PutFullData || req.opcode === BusReq.Get && lastBeat)) {
        busy := false.B
        beatCounter.reset()
    }
}

class SingleRAM()(implicit val p: Parameters) extends MyModule{
    val io = IO(new TLSlaveBusUL)

    val req = Mux(io.req.fire, io.req.bits, RegEnable(io.req.bits, io.req.fire))
    val reqBeatSize = req.size >> log2Ceil(busBeatSize) // byte to number
    val busy = RegInit(false.B)

    io.req.ready := !busy

    when(io.req.fire) {
        busy := true.B
    }

    val rom = SyncReadMem(romSize, UInt(xlen.W))
    loadMemoryFromFile(rom, "/home/cyril/workspace/riscv/mycpu/src/main/resources/Dmem.hex")

    val ren = req.opcode === BusReq.Get && (io.req.fire || busy)
    val wen = io.req.fire && req.opcode === BusReq.PutFullData

    val beatCounter = Counter(10)
    val lastBeat = beatCounter.value === reqBeatSize
    when(io.req.fire && lastBeat && req.opcode === BusReq.Get) {
        beatCounter.reset()
    }.elsewhen((io.req.fire || io.resp.fire) && req.opcode === BusReq.Get) {
        beatCounter.inc()
    }

    val addrOff = beatCounter.value << log2Ceil(xlen / 8)
    val rdAddr = (req.address + addrOff) >> 2 // divide by 4
    val rdata_1 = rom.read(rdAddr - memRamBegin.U)
    val rdata = Mux(ren, rdata_1, RegEnable(rdata_1, RegNext(ren)))
    when(wen) {
        rom.write(req.address, req.data)
    }
    
    io.resp.valid := busy && (req.opcode === BusReq.Get || req.opcode === BusReq.PutFullData)
    io.resp.bits <> DontCare
    io.resp.bits.data := rdata
    io.resp.bits.opcode := Mux(req.opcode === BusReq.Get, BusReq.AccessAckData, BusReq.AccessAck)
    io.resp.bits.source := req.source

    when(io.resp.fire && (req.opcode === BusReq.PutFullData || req.opcode === BusReq.Get && lastBeat)) {
        busy := false.B
        beatCounter.reset()
    }
}


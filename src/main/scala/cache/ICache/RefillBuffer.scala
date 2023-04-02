package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class RefillBuffer(entries: Int = 2)(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val write = Flipped(ValidIO(new Bundle{
            val cacheLineAddr = UInt(xlen.W)
            val data = UInt((dcacheBlockBytes*8).W)
        }))
        val read = Output(new Bundle{
            val cacheLineAddr = Vec(entries, UInt(xlen.W))
            val cacheLineData = Vec(entries, Vec(dcacheBlockSize, UInt((dcacheBlockBytes*8).W)))
            val valids = Vec(entries, Bool())
        })
    })

    val buf = Reg(Vec(entries, Vec(dcacheBlockSize, UInt((dcacheBlockBytes*8).W))))
    val addr = Reg(Vec(entries, UInt(xlen.W)))
    val valids = Reg(Vec(entries, Bool()))

    val wrPtr = Counter(entries)
    val beatCounter = Counter(dcacheBlockSize)
    val lastBeat = beatCounter.value === (dcacheBlockSize - 1).U

    when(io.write.fire && lastBeat) {
        beatCounter.reset()
        wrPtr.inc()
        addr(wrPtr.value) := Cat(io.write.bits.cacheLineAddr(xlen-1, dcacheBlockBits + dcacheByteOffsetBits), Fill(dcacheBlockBits + dcacheByteOffsetBits, 0.U))
    }.elsewhen(io.write.fire) {
        beatCounter.inc()
    }

    when(io.write.fire) {
        buf(wrPtr.value)(beatCounter.value) := io.write.bits.data
    }

    io.read.cacheLineAddr <> addr
    io.read.cacheLineData <> buf
    io.read.valids <> valids
}
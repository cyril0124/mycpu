package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.common.Parameters._

class BTBEntry(xlen: Int) extends Bundle {
    val valid = Bool()
    val target = UInt(xlen.W)
    val pc = UInt(xlen.W)
    val jump = Bool()
}

class BTBResp(xlen: Int) extends Bundle{
    val hit = Bool()
    val target = UInt(XLEN.W)
    val jump = Bool()
}

// Branch Target Buffer
class BTB extends Module {
    val io = IO(new Bundle{
        val write = Flipped(Valid(new Bundle{
            val pc = UInt(XLEN.W)
            val jump = Bool()
            val target = UInt(XLEN.W)
        }))
        val read = new Bundle{
            val req = Flipped(Valid(new Bundle{
                val pc = UInt(XLEN.W)
            }))
            val resp = Output(new BTBResp(XLEN))
        }
    })

    val entries = SRAM_1((new BTBEntry(XLEN)).getWidth, BTB_SIZE, ways = 1, singlePort = true)

    val wrIdx = io.write.bits.pc(BTB_INDEX_WIDTH + ADDR_ALIGN_WIDTH - 1, ADDR_ALIGN_WIDTH)
    val wrPc = io.write.bits.pc(ADDR_WIDTH - 1, BTB_INDEX_WIDTH + ADDR_ALIGN_WIDTH)

    val wrEntry = WireInit(0.U.asTypeOf(new BTBEntry(XLEN)))
    wrEntry.jump := io.write.bits.jump
    wrEntry.pc := wrPc
    wrEntry.target := io.write.bits.target
    wrEntry.valid := io.write.valid
    when(io.write.fire) {
        entries.write(wrIdx, wrEntry.asUInt, 1.U)
    }

    val rdIdx = io.read.req.bits.pc(BTB_INDEX_WIDTH + ADDR_ALIGN_WIDTH - 1, ADDR_ALIGN_WIDTH)
    val rdPc = io.read.req.bits.pc(ADDR_WIDTH - 1, BTB_INDEX_WIDTH + ADDR_ALIGN_WIDTH)
    val rdEntry_1 = entries.read(rdIdx, io.read.req.fire)
    val rdEntry = rdEntry_1.asTypeOf(new BTBEntry(XLEN))
    val rdHit = rdEntry.pc === rdPc && rdEntry.valid

    io.read.resp.hit := rdHit
    io.read.resp.target := rdEntry.target
    io.read.resp.jump := rdEntry.jump

}

object BTBGenRTL extends App {
    println("Generating the BTB hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new BTB, Array("--target-dir", "build"))
}
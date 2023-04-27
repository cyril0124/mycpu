package mycpu

import chisel3._
import chisel3.util._

import mycpu.common.Parameters._

class BTBEntry(xlen: Int) extends Bundle {
    val valid = Bool()
    val target = UInt(xlen.W)
    val pc = UInt(xlen.W)
    val jump = Bool()
}

// Branch Target Buffer
class BTB extends Module {
    val io = IO(new Bundle{
        val update = Valid(new Bundle{
            val pc = UInt(XLEN.W)
            val jump = Bool()
            val target = UInt(XLEN.W)
        })
        val pc = Input(UInt(XLEN.W))
        val target = Output(UInt(XLEN.W))
        // val jump = 
    })

    val entries = Mem(BTB_SIZE, new BTBEntry(XLEN))
    SRAMArray_1P

    val idx = io.update.bits.pc(BTB_INDEX_WIDTH + ADDR_ALIGN_WIDTH - 1, ADDR_ALIGN_WIDTH)
    val btbPc = io.update.bits.pc(ADDR_WIDTH - 1, BTB_INDEX_WIDTH + ADDR_ALIGN_WIDTH)

    val chosenEntry = entries(idx)
    when(io.update.fire) {
        chosenEntry.valid := true.B
        chosenEntry.target := io.update.bits.target
        chosenEntry.jump := io.update.bits.jump
        chosenEntry.pc := btbPc
    }


}
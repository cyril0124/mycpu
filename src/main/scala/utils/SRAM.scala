package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

abstract class BaseSRAM extends Module {
    def init(): Unit
    def write(idx: UInt, data: UInt, mask: UInt): Unit
    def write(idx: UInt, data: UInt): Unit
    def read(idx: UInt): UInt
    def read(idx: UInt, enable: Bool): UInt = {
        // var rdata = 0.U
        // when(enable) {
        //     rdata = read(idx)
        // }
        // rdata
        read(idx)
    }
}

class BankRam1P_1(width: Int = 32, depth: Int = 1024, maskSegments: Int = 4)extends BaseSRAM {
    val io = IO(new Bundle{
        val en      = Input(Bool())
        val addr    = Input(UInt(log2Ceil(depth).W))
        val rw      = Input(Bool()) // true: write   false: read
        val wdata   = Input(UInt(width.W))
        val wmask   = if(maskSegments > 1) Some(Input(UInt(maskSegments.W))) else None 
        val rdata   = Output(UInt(width.W))
    })
    assert(maskSegments >= 1, s"error maskSegments! ==> ${maskSegments}")

    val ram = SyncReadMem(depth, Vec(maskSegments, UInt( (width / maskSegments).W)))
    val wen = io.en & io.rw
    val ren = io.en & !io.rw

    // for VCS simulator
    // withReset(reset) {
    //     (0 until depth).foreach{
    //         i => ram(i.U) := 0.U.asTypeOf(Vec(maskSegments, UInt((width / maskSegments).W)))
    //     }
    // }

    // read: rdata will keep stable until the next read enable.
    // withReset(reset) {
    //     io.rdata := DontCare
    // }
    // // write with mask
    // val wmask = if(io.wmask.isDefined) io.wmask.get.asTypeOf(Vec(maskSegments, Bool())) else Fill(maskSegments, 1.U).asTypeOf(Vec(maskSegments, Bool()))
    // val wdata = io.wdata.asTypeOf(Vec(maskSegments, UInt((width / maskSegments).W)))
    // when(wen) {
    //     ram.write(io.addr, wdata, wmask)
    // }.elsewhen(ren) {
    //     io.rdata := ram.read(io.addr).asUInt
    // }


    // read: rdata will keep stable until the next read enable.
    // val rdata = WireInit(ram.read(io.addr))
    // val rdataReg = RegEnable(rdata.asUInt, ren)
    // io.rdata := Mux(ren, rdata.asUInt, rdataReg)
    // io.rdata := RegEnable(rdata.asUInt, ren)
    withReset(reset) {
        io.rdata := DontCare
    }
    // write with mask
    val wmask = if(io.wmask.isDefined) io.wmask.get.asTypeOf(Vec(maskSegments, Bool())) else Fill(maskSegments, 1.U).asTypeOf(Vec(maskSegments, Bool()))
    val wdata = io.wdata.asTypeOf(Vec(maskSegments, UInt((width / maskSegments).W)))
    when(wen) {
        ram.write(io.addr, wdata, wmask)
    }.otherwise{
        io.rdata := ram.read(io.addr).asUInt
    }

    def init(): Unit = {
        io.en := false.B
        io.rw := false.B
        io.wdata := DontCare
        io.addr := DontCare
        if(io.wmask.isDefined) io.wmask.get := DontCare
    }
    
    def write(idx: UInt, data: UInt, mask: UInt): Unit = {
        io.en := true.B
        io.rw := true.B
        io.wdata := data
        io.addr := idx
        if(io.wmask.isDefined) io.wmask.get := mask
    }

    def write(idx: UInt, data: UInt): Unit = {
        val wmask = Fill(maskSegments, 1.U)
        write(idx, data, wmask)
    }

    def read(idx: UInt): UInt = {
        io.en := true.B
        io.rw := false.B
        io.addr := idx
        io.rdata
    }
}

class BankRam2P_1(width: Int = 64, depth: Int = 16, maskSegments: Int = 8)extends BaseSRAM {
    val io = IO(new Bundle{
        val r = new Bundle{
            val en = Input(Bool())
            val addr = Input(UInt(log2Ceil(depth).W))
            val data = Output(UInt(width.W))
        }
        val w = new Bundle{
            val en = Input(Bool())
            val addr = Input(UInt(log2Ceil(depth).W))
            val data = Input(UInt(width.W))
            val mask = if(maskSegments > 1) Some(Input(UInt(maskSegments.W))) else None
        }
    })

    val ram = SyncReadMem(depth, Vec(maskSegments, UInt((width / maskSegments).W)))

    val wmask = if(io.w.mask.isDefined) io.w.mask.get else Fill(maskSegments, 1.U)
    val wdata = io.w.data.asTypeOf(Vec(maskSegments,UInt((width / maskSegments).W)))
    when(io.w.en) {
        ram(io.w.addr).zip(wdata).zipWithIndex.foreach{
            case ((sink, source), i) => 
                when(wmask(i)) {
                    sink := source
                }
        }
    }

    val rdata = WireInit(0.U.asTypeOf(io.r.data)).asTypeOf(Vec(maskSegments, UInt((width / maskSegments).W)))
    rdata := ram.read(io.r.addr)

    // write has higher priority
    when(io.w.en & io.r.en) {
        when(io.w.addr === io.r.addr) {
            rdata.zip(wdata).zipWithIndex.foreach{ 
                case ((r, w), i) => 
                    when(wmask(i)) {
                        r := w
                    }
            }
            printf("[BankRam2P] bypass! \n")
        }
    }
    

    // read data will be stable until next read enable
    io.r.data := RegEnable(Cat(rdata.reverse), 0.U(width.W), io.r.en)

    def init(): Unit = {
        io.w.en := false.B
        io.w.data := DontCare
        io.w.addr := DontCare
        if(io.w.mask.isDefined) io.w.mask.get := DontCare

        io.r.en := false.B
        io.r.addr := DontCare
    }

    def write(idx: UInt, data: UInt, mask: UInt): Unit = {
        io.w.en := true.B
        io.w.data := data
        io.w.addr := idx
        if(io.w.mask.isDefined) io.w.mask.get := mask
    }

    def write(idx: UInt, data: UInt): Unit = {
        val wmask = Fill(maskSegments, 1.U)
        write(idx, data, wmask)
    }

    def read(idx: UInt): UInt = {
        io.r.en := true.B
        io.r.addr := idx
        io.r.data
    }
}

object SRAM{
    def apply(width: Int = 32, depth: Int = 1024, maskSegments: Int = 4, singlePort: Boolean = true): BaseSRAM = {
        assert(maskSegments >= 1, s"error maskSegments! ==> ${maskSegments}")
        val sram = if(singlePort == true) {
                        Module(new BankRam1P_1(width, depth, maskSegments))
                    }else {
                        Module(new BankRam2P_1(width, depth, maskSegments))
                    }
        sram.init()
        sram
    }
}

class SRAMTemplate(width: Int = 32, depth: Int = 1024, maskSegments: Int = 4, singlePort: Boolean = true) extends Module {
    val io = IO(new Bundle{
        val r = new Bundle{
            val en = Input(Bool())
            val addr = Input(UInt(log2Ceil(depth).W))
            val data = Output(UInt(width.W))
        }
        val w = new Bundle{
            val en = Input(Bool())
            val addr = Input(UInt(log2Ceil(depth).W))
            val data = Input(UInt(width.W))
            val mask = if(maskSegments > 1) Some(Input(UInt(maskSegments.W))) else None
        }
    })
    // println(s"width = ${width}")
    val sram = SRAM(width, depth, maskSegments, singlePort)

    io.r.data := sram.read(io.r.addr,io.r.en)
    // val rdData = RegEnable(sram.read(io.r.addr), io.r.en)
    // io.r.data := rdData//sram.read(io.r.addr)
    // io.r.data := Mux(io.r.en, sram.read(io.r.addr), rdData)
    
    when(io.w.en) {
        sram.write(io.w.addr,io.w.data,io.w.mask.getOrElse(false.B))
    }

}


object BankRam1PGenRTL extends App {

    println("Generating the BankRam1P hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new BankRam1P_1(), Array("--target-dir", "build"))
}

object BankRam2PGenRTL extends App {

    println("Generating the BankRam2P hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new BankRam2P_1(), Array("--target-dir", "build"))
}


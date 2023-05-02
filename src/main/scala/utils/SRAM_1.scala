package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class BankRAM_1P(width: Int, depth: Int, bramPolicy: String = "write_first", resetMem: Boolean = false) extends Module {
    val io = IO(new Bundle{
        val en      = Input(Bool())
        val addr    = Input(UInt(log2Ceil(depth).W))
        val rw      = Input(Bool()) // true: write   false: read
        val wdata   = Input(UInt(width.W))
        val rdata   = Output(UInt(width.W))
    })

    val mem = SyncReadMem(depth, UInt(width.W))

    if(resetMem) {
        when(reset.asBool) {
            for(i <- 0 until depth) {
                mem.write(i.U, 0.U)
            }
        }
    }

    val wen = io.en && io.rw
    val ren = io.en && !io.rw

    when(wen) {
        mem.write(io.addr, io.wdata)
    }


    if(bramPolicy == "write_first") {
        io.rdata := Mux(wen, io.wdata, mem.read(io.addr))
    } else if(bramPolicy == "read_first") {
        io.rdata := mem.read(io.addr)
    } else if(bramPolicy == "no_change") {
        io.rdata := mem.read(io.addr, ren)
    } else {
        assert(false, s"invalid bram policy ==>${bramPolicy}")
        io.rdata := DontCare
    }
}

class BankRAM_2P(width: Int, depth: Int, bramPolicy: String = "write_first", resetMem: Boolean = false) extends Module {
    val io = IO(new Bundle{
        val r = new Bundle{
            val en      = Input(Bool())
            val addr    = Input(UInt(log2Ceil(depth).W))
            val data    = Output(UInt(width.W))
        }
        val w = new Bundle{
            val en      = Input(Bool())
            val addr    = Input(UInt(log2Ceil(depth).W))
            val data    = Input(UInt(width.W))
        }
    })

    val mem = SyncReadMem(depth, UInt(width.W))

    if(resetMem) {
        when(reset.asBool) {
            for(i <- 0 until depth) {
                mem.write(i.U, 0.U)
            }
        }
    }

    val wen = io.w.en
    val ren = io.r.en

    when(wen) {
        mem.write(io.w.addr, io.w.data)
    }


    val readConflict = io.w.addr === io.r.addr
    if(bramPolicy == "write_first") {
        io.r.data := Mux(wen && readConflict, io.w.data, mem.read(io.r.addr))
    } else if(bramPolicy == "read_first") {
        io.r.data := mem.read(io.r.addr)
    } else if(bramPolicy == "no_change") {
        io.r.data := mem.read(io.r.addr, ren)
    } else {
        assert(false, s"invalid bram policy ==>${bramPolicy}")
        io.r.data := DontCare
    }
}

abstract class SRAMBase extends Module {
    def init(): Unit
    def write(addr: UInt, data: Vec[UInt], mask: UInt): Unit
    def write(addr: UInt, data: UInt, mask: UInt): Unit // write OneHot
    def write(addr: UInt, data: Vec[UInt]): Unit
    def read(addr: UInt): Vec[UInt]
    def read(addr: UInt, enable: Bool): Vec[UInt] = {
        // val rdata = WireInit(0.U.asTypeOf(chiselTypeOf(read(addr))))
        // when(enable) {
        //     rdata := read(addr)
        // }
        // rdata
        read(addr)
    }
}

abstract class SRAMBaseWithClock extends RawModule {
    def init(clock: Clock, writeClock: Option[Clock]): Unit
    def write(addr: UInt, data: Vec[UInt], mask: UInt): Unit
    def write(addr: UInt, data: UInt, mask: UInt): Unit // write OneHot
    def write(addr: UInt, data: Vec[UInt]): Unit
    def read(addr: UInt): Vec[UInt]
    def read(addr: UInt, enable: Bool): Vec[UInt] = {
        val rdata = Wire(0.U.asTypeOf(read(addr)))
        when(enable) {
            rdata := read(addr)
        }
        rdata
    }
}

class SRAMArray_1P(width: Int, depth: Int, ways: Int, bramPolicy: String = "write_first", resetMem: Boolean = false) extends SRAMBase {
    val io = IO(new Bundle{
        val en      = Input(Bool())
        val addr    = Input(UInt(log2Ceil(depth).W))
        val rw      = Input(Bool()) // true: write   false: read
        val wdata   = Input(Vec(ways, UInt(width.W)))
        val wmaskOH = Input(UInt(ways.W))
        val rdata   = Output(Vec(ways, UInt(width.W)))
    })

    val brams = Seq.fill(ways)(Module(new BankRAM_1P(width, depth, bramPolicy, resetMem)))

    for(i <- 0 until ways) {
        brams(i).io.en := io.en 
        brams(i).io.addr := io.addr
        brams(i).io.rw := io.rw && io.wmaskOH(i)
        brams(i).io.wdata := io.wdata(i)
        io.rdata(i) := brams(i).io.rdata
    }

    def init(): Unit = {
        io <> DontCare
        io.en := false.B
        io.rw := DontCare
        io.wdata := DontCare
        io.wmaskOH := DontCare
    }

    def write(addr: UInt, data: Vec[UInt], mask: UInt): Unit = {
        io.en := true.B
        io.addr := addr
        io.rw := true.B
        io.wdata := data
        io.wmaskOH := mask
    }

    def write(addr: UInt, data: Vec[UInt]): Unit = {
        io.en := true.B
        io.addr := addr
        io.rw := true.B
        io.wdata := data
        io.wmaskOH := Fill(ways, 1.U)
    }

    def write(addr: UInt, data: UInt, mask: UInt): Unit = {
        assert(PopCount(mask) <= 1.U, "write error, tring to write multiple ways")
        io.en := true.B
        io.addr := addr
        io.rw := true.B
        io.wdata.foreach( w => w := data)
        io.wmaskOH := mask
    }

    def read(addr: UInt): Vec[UInt] = {
        io.en := true.B
        io.rw := false.B
        io.addr := addr
        io.rdata
    }
    
}

class SRAMArray_2P(width: Int, depth: Int, ways: Int, bramPolicy: String = "write_first", resetMem: Boolean = false) extends SRAMBase {
    val io = IO(new Bundle{
        val r = new Bundle {
            val en      = Input(Bool())
            val addr    = Input(UInt(log2Ceil(depth).W))
            val data   = Output(Vec(ways, UInt(width.W))) // read all ways of data
        }
        val w = new Bundle {
            val en      = Input(Bool())
            val addr    = Input(UInt(log2Ceil(depth).W))
            val data    = Input(Vec(ways, UInt(width.W))) // write data into a specific way 
            val maskOH = Input(UInt(ways.W))
        }
    })

    val brams = Seq.fill(ways)(Module(new BankRAM_2P(width, depth, bramPolicy, resetMem)))

    for(i <- 0 until ways) {
        brams(i).io.r.en := io.r.en
        brams(i).io.r.addr := io.r.addr
        io.r.data(i) := brams(i).io.r.data

        brams(i).io.w.en := io.w.en && io.w.maskOH(i)
        brams(i).io.w.addr := io.w.addr
        brams(i).io.w.data := io.w.data(i)
    }


    def init(): Unit = {
        io <> DontCare
        io.w.en := false.B
        io.r.en := false.B
    }

    def write(addr: UInt, data: Vec[UInt], mask: UInt): Unit = {
        io.w.en := true.B
        io.w.addr := addr
        io.w.data := data
        io.w.maskOH := mask
    }

    def write(addr: UInt, data: Vec[UInt]): Unit = {
        io.w.en := true.B
        io.w.addr := addr
        io.w.data := data
        io.w.maskOH := Fill(ways, 1.U)
    }

    def write(addr: UInt, data: UInt, mask: UInt): Unit = {
        assert(PopCount(mask) <= 1.U, "write error, tring to write multiple ways")
        io.w.en := true.B
        io.w.addr := addr
        io.w.data.foreach( w => w := data)
        io.w.maskOH := mask
    }

    def read(addr: UInt): Vec[UInt] = {
        io.r.en := true.B
        io.r.addr := addr
        io.r.data
    }
}

object SRAM_1{
    def apply(width: Int = 32, depth: Int = 1024, ways: Int = 4, singlePort: Boolean = true, bramPolicy: String = "write_first", resetMem: Boolean = false): SRAMBase = {
        assert(ways >= 1, s"error ways! ==> ${ways}")
        val sram = if(singlePort == true) {
                        Module(new SRAMArray_1P(width, depth, ways, bramPolicy, resetMem))
                    }else {
                        Module(new SRAMArray_2P(width, depth, ways, bramPolicy, resetMem))
                    }
        sram.init()
        sram
    }
}
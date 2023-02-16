package mycpu

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class DMemReadPort(implicit val p: Parameters) extends MyBundle{
    val addr = Input(UInt(addrWidth.W))
    val data = ValidIO(UInt(xlen.W)) 
    val dataType = Input(UInt(3.W)) // 000: 8-bit  001: 16-bit  010: 32-bit  011: 64-bit
    val sign = Input(Bool()) // 0: unsigned  1:signed(fill mem[0..23] with sign-bit)
    val en = Input(Bool())
}

class DMemWritePort(implicit val p: Parameters) extends MyBundle{
    val addr = Input(UInt(addrWidth.W))
    val data = Input(UInt(xlen.W))
    val dataType = Input(UInt(3.W))
    val en = Input(Bool())
}

class DMem(debug:Boolean = true)(implicit val p: Parameters) extends MyModule{
    val io = IO(new Bundle{
        val read = new DMemReadPort
        val write = new DMemWritePort
    })

    io.write <> DontCare
    io.read <> DontCare

    assert(addrWidth % 8 == 0, "addrWidth ERROR, should be mod of 8")
    assert( xlen % 8 == 0, "xlen ERROR, should be mod of 8")
    
    val mem = Mem(1024, UInt(8.W))
    loadMemoryFromFile(mem, "/home/cyril/workspace/riscv/mycpu/src/main/resources/Dmem.hex.txt")
    
    val byteNum = xlen / 8
    val rdAddr = io.read.addr
    val rdType = io.read.dataType
    val rdData = io.read.data.bits
    // Notice that RISC-V is a Little-endian memory store/read system, so we need to add a ".reverse" behind "Cat(xxx)"
    when(io.read.en) {
        val signBit = mem(rdAddr)(7) & io.read.sign
        val memMask = FillInterleaved(8,VecInit.tabulate(byteNum)(_ => signBit))
        switch(rdType) {
            is("b000".U) { rdData := (memMask << 8)  | mem(rdAddr)                                          }
            is("b001".U) { rdData := (memMask << 16) | Cat( (0 until 2).map(i => mem(rdAddr+i.U)).reverse ) }
            is("b010".U) { rdData := (memMask << 32) | Cat( (0 until 4).map(i => mem(rdAddr+i.U)).reverse ) }
            is("b011".U) { rdData := (memMask << 64) | Cat( (0 until 8).map(i => mem(rdAddr+i.U)).reverse ) }
            // is("b001".U) { rdData := FillInterleaved(8,0.U(byteNum.W)) | Cat( (0 until 2).map(i => mem(rdAddr+i.U)).reverse ) }
            // is("b010".U) { rdData := FillInterleaved(8,0.U(byteNum.W)) | Cat( (0 until 4).map(i => mem(rdAddr+i.U)).reverse ) }
            // is("b011".U) { rdData := FillInterleaved(8,0.U(byteNum.W)) | Cat( (0 until 8).map(i => mem(rdAddr+i.U)).reverse ) }
        }
        io.read.data.valid := true.B
    }.otherwise{
        io.read.data.valid := false.B
    }

    val wrAddr = io.write.addr
    val wrType = io.write.dataType
    val wrData = io.write.data

    assert(!((wrType === "b011".U) && (wrData.getWidth < 64).asBool), "xlen is less than 64-bit and write data bit is 64-bit !!")
    when(io.write.en) {
        switch(wrType) { 
            is("b000".U) { mem.write(wrAddr, wrData(7,0)) }
            is("b001".U) { (0 until 2).foreach{ i => mem.write(wrAddr+i.U, wrData(7+i*8, i*8)) } }
            is("b010".U) { (0 until 4).foreach{ i => mem.write(wrAddr+i.U, wrData(7+i*8, i*8)) } }
        }
    }
    if(xlen >= 64) {
        when(io.write.en && wrType === "b011".U) {
            (0 until 8).foreach{ i => mem.write(wrAddr+i.U, wrData(7+i*8, i*8)) } 
        }
    }

    if(debug) {
        when(io.read.data.valid) { 
            DebugLog(myCpuParams,DebugLevel.DBG_HIGH,"[DMem] read mem(%d) => 0x%x\n",rdAddr,rdData) 
        }
        when(io.write.en) { 
            DebugLog(myCpuParams,DebugLevel.DBG_HIGH,"[DMem] write mem(%d) => 0x%x\n",wrAddr,wrData) 
        }
    }

}


object DMemGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the DMem hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new DMem()(defaultConfig), Array("--target-dir", "build"))
}

import chiseltest._

object DMemRawTest extends App{
    // chiseltest.RawTester.test(new DMem(debug = true)) { c =>
    //     c.io.read.sign.poke(0.U)
    //     c.io.read.addr.poke(0.U)
    //     c.io.read.en.poke(1.U)

    //     c.io.read.dataType.poke("b000".U) // read 8-bit data
    //     c.clock.step()
    //     // println(f"read 8-bit data from mem[0] => 0x${c.io.read.data.bits.peek().litValue}%8h")
        
    //     // println(f"${c.io.read.data.valid.peek()}")
    //     c.io.read.en.poke(0.U)
    //     c.clock.step()
    //     // println(f"${c.io.read.data.valid.peek()}")

    //     c.io.read.en.poke(1.U)
    //     c.io.read.dataType.poke("b001".U) // read 16-bit data
    //     c.clock.step()
    //     // println(f"read 16-bit data from mem[0] => 0x${c.io.read.data.bits.peek().litValue}%8h")

    //     c.io.read.dataType.poke("b010".U) // read 32-bit data
    //     c.clock.step()
    //     // println(f"read 32-bit data from mem[0] => 0x${c.io.read.data.bits.peek().litValue}%8h")
    //     c.io.read.en.poke(0.U)
    //     c.clock.step()

    //     c.io.write.en.poke(1.U)
    //     c.io.write.dataType.poke("b010".U)
    //     c.io.write.data.poke("h1234".U)
    //     c.io.write.addr.poke(0.U)
    //     c.clock.step()
    //     c.io.write.en.poke(0.U)

    //     c.io.read.en.poke(1.U)
    //     c.io.read.dataType.poke("b010".U)
    //     c.io.read.addr.poke(0.U)
    //     c.clock.step()
    //     c.io.read.en.poke(0.U)
    //     // println(f"read n-bit data from mem[0] => 0x${c.io.read.data.bits.peek().litValue}%16h")
    //     // println(f"${c.io.read.data.valid.peek()}")
    // }
}


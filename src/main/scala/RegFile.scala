package mycpu

import chisel3._
import chisel3.util._
import chisel3.util.experimental.BoringUtils
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import firrtl.Utils

sealed class ReadPort[T <: Data](gen:T)(implicit val p: Parameters) extends MyBundle {
  val addr = Input(UInt(rfAddrWidth.W))
  val en = Input(Bool())
  val data = Output(gen)
}

sealed class WritePort[T <: Data](gen:T)(implicit val p: Parameters) extends MyBundle {
  val addr = Input(UInt(rfAddrWidth.W))
  val en = Input(Bool())
  val data = Input(gen)
}


class RegFile[T <: Data](gen:T = UInt(32.W))(implicit val p: Parameters) extends MyModule {
  val io = IO(new Bundle{
    val r = Vec(rfRdPort, new ReadPort(gen))
    val w = Vec(rfWrPort, new WritePort(gen))
    // val state = if(rfStateOut) Some(Output(new RegFileState)) else None
  })

  val regs = Reg(Vec(rfSets,gen))
  when(reset.asBool) {
    regs.zipWithIndex.foreach { case (r,i) =>
      r := 0.U
      if(i ==  2) 
        // r := "h407ffac0".U // qemu-riscv32 will set this reg to this val before start the whole grogram
        r := 0.U
    }
  }
  regs(0) := 0.U
  assert(regs(0).asUInt === 0.U, "zero reg must be 0 !")
  
  // !! cannot write zero reg, because it is hardwired to 0.
  val writeBypassVec = (0 until rfRdPort).map{ i => 
      io.w(0).en && io.r(i).addr === io.w(0).addr && io.w(0).addr =/= 0.U } 
  
  (0 until rfRdPort).foreach{ i =>
    when(io.r(i).en) {
      // write operation has higher priority
      when(writeBypassVec(i)) { 
        io.r(i).data := io.w(0).data
      }.otherwise{
        io.r(i).data := regs(io.r(i).addr)
      }
    }.otherwise {
      io.r(i).data := DontCare
    }
  }

  when(io.w(0).en && io.w(0).addr =/= 0.U) {
    regs(io.w(0).addr) := io.w(0).data
  }


  // if(rfStateOut) {
  //   io.state.get.regState.zip(regs).foreach{ case(s,r) => s := r }
  // }
  
  // ! sync read, output data will generated with delay of one cycle(sync time) after read request
  // val rportValids = RegInit(VecInit(Array.fill(readPort)(false.B)))
  // val rportAddr = RegInit(VecInit(Array.fill(readPort)(0.U(log2Up(set).W))))
  
  // io.r.zipWithIndex.foreach { case(r,i) => 
  //   rportValids(i) := r.en
  //   when( r.en === true.B ) {
  //     rportAddr(i) := r.addr
  //   }.otherwise{
  //     rportAddr(i) := 0.U 
  //   }
  // }

  // io.r.zipWithIndex.foreach { case(r,i) =>
  //   when( rportValids(i) === true.B ) {

  //     r.data := regs(rportAddr(i))
      
  //     val writeVec = Cat(io.w.map( w => w.en && w.addr === rportAddr(i)))
  //     val hasWrite = writeVec.orR
  //     when( hasWrite === true.B ) {
  //       if(rfDebug) printf(p"READ regs[${rportAddr(i)}] => ${regs(rportAddr(i))}\n")
  //     }.otherwise{
  //       if(rfDebug) printf(p"BYPASS regs[${rportAddr(i)}] => ${regs(rportAddr(i))}\n")
  //     }
      
  //   }.otherwise{
  //     r.data := 0.U
  //   }
  // }

  // io.w.foreach { w =>
  //   when( w.en === true.B ){
  //     regs(w.addr) := w.data
  //     if(rfDebug) printf(p"WRITE regs[${w.addr}] => ${w.data}\n")
  //   }
  // }

  // if(simulation){
    val regState = Wire(new RegFileState)
    regState.regState.zip(regs).foreach{ case (s, r) => 
      s := r
    }
    BoringUtils.addSource(regState,"regState")
  //   // dontTouch(regStatus)
  // }
}

// for single cycle
class RegFile2[T <: Data](gen:T = UInt(32.W))(implicit val p: Parameters) extends MyModule {
  val io = IO(new Bundle{
    val r = Vec(rfRdPort, new ReadPort(gen))
    val w = Vec(rfWrPort, new WritePort(gen))
  })

  val regs = Reg(Vec(rfSets,gen))
  when(reset.asBool) {
    regs.zipWithIndex.foreach { case (r,i) =>
      r := 0.U
      // if(i ==  2) 
      //   r := "h407ffac0".U // qemu-riscv32 will set this reg to this val before start the whole grogram
    }
  }
  regs(0) := 0.U
  assert(regs(0).asUInt === 0.U, "zero reg must be 0 !")
  

  // (0 until rfRdPort).foreach{ i =>
  //   when(io.r(i).en) {
  //     // write operation has higher priority
  //     // when(io.w(0).en && io.r(i).addr === io.w(0).addr){
  //     //   io.r(i).data := io.w(0).data
  //     // }.otherwise{
  //     //   io.r(i).data := regs(io.r(i).addr)
  //     // }
  //     io.r(i).data := regs(io.r(i).addr)
  //   }.otherwise {
  //     io.r(i).data := DontCare
  //   }
  // }

  io.r.zipWithIndex.foreach{ case (r, i) =>
    val writeVec = Cat(io.w.map( w => w.addr === r.addr && w.en && w.addr =/= 0.U).reverse)
    val hasWrite = writeVec.orR
    when(r.en) {
      when(hasWrite) {
        r.data := io.w(OHToUInt(writeVec)).data
      }.otherwise{
        r.data := regs(r.addr)
      }
    }.otherwise{
      r.data := DontCare
    }
  }

  // when(io.w(0).en && io.w(0).addr =/= 0.U) {
  //   regs(io.w(0).addr) := io.w(0).data
  // }

  io.w.foreach{ w => 
    // val writeAddrVec = Cat(io.w.map( ww => w.addr === ww.addr && w.addr =/= 0.U && w.en))
    // val hasSameWrite = writeAddrVec.orR
    // assert(hasSameWrite === false.B, "Write multiple same address!")
    when(w.en && w.addr =/= 0.U){
      regs(w.addr) := w.data
    }
  }

  // if(rfStateOut) {
  //   io.state.get.regState.zip(regs).foreach{ case(s,r) => s := r }
  // }

  val regState = Wire(new RegFileState)
  regState.regState.zip(regs).foreach{ case (s, r) => 
    s := r
  }
  BoringUtils.addSource(regState,"regState")

}

object RegPrint {
  def apply(params: MyCpuParameters): Any = 
    apply(params,0,31)

  def apply(params: MyCpuParameters, num:Int): Any = 
    apply(params, num, num)
  
  def apply(params: MyCpuParameters,start:Int, end:Int): Any = {
    val regStatus = WireInit(VecInit(Array.fill(32)(0.U(32.W))))
    BoringUtils.addSink(regStatus,"regStatus")
    (start until (end+1)).foreach{ i =>
        // printf("  "+NumToRegStr(i)+" = %d\n",regStatus(i))
        DebugLog(params, DebugLevel.DBG_HIGH, "[%d]"+NumToRegStr(i)+" = 0x%x\n",i.asUInt,regStatus(i))
    }
  }
}

object RegFileGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
          simulation = false
        )
    })

    println("Generating the RegFile hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new RegFile(UInt(32.W))(defaultConfig), Array("--target-dir", "build"))
}

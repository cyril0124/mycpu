package mycpu

import chisel3._
import chisel3.util._
import chisel3.util.experimental.BoringUtils
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

sealed class ReadPort[T <: Data](gen:T)(implicit val p: Parameters) extends MyBundle {
  // val rfAddrWidth = log2Up(rfSets)
  val addr = Input(UInt(rfAddrWidth.W))
  val en = Input(Bool())
  val data = Output(gen)
}

sealed class WritePort[T <: Data](gen:T)(implicit val p: Parameters) extends MyBundle {
  // val addrWidth = log2Up(set)
  val addr = Input(UInt(rfAddrWidth.W))
  val en = Input(Bool())
  val data = Input(gen)
}

class RegFileState()(implicit val p: Parameters) extends MyBundle {
  val regState = Vec(rfSets, UInt(xlen.W))
  // val envOut = Vec(4, UInt(xlen.W))  // when there is a enviroment call, we should output 4 reg value according to <riscv-sbi>
                                     //  a7: SBI extension ID   a6: SBI function ID   a0: return error code  a1: return value 
}

class RegFile[T <: Data](gen:T = UInt(32.W))(implicit val p: Parameters) extends MyModule {
  val io = IO(new Bundle{
    val r = Vec(rfRdPort, new ReadPort(gen))
    val w = Vec(rfWrPort, new WritePort(gen))
    // val envOut = Vec(4, Output(gen)) // when there is a enviroment call, we should output 4 reg value according to <riscv-sbi>
                                     //  a7: SBI extension ID   a6: SBI function ID   a0: return error code  a1: return value 
    val state = if(rfStateOut) Some(Output(new RegFileState)) else None
  })

  val regs = Reg(Vec(rfSets,gen))
  when(reset.asBool) {
    regs.zipWithIndex.foreach { case (r,i) =>
      r := 0.U
      if(i ==  2) 
        r := "h407ffc80".U // qemu-riscv32 will set this reg to this val before start the whole grogram
    }
  }
  regs(0) := 0.U
  assert(regs(0).asUInt === 0.U, "zero reg must be 0 !")
  

  (0 until rfRdPort).foreach{ i =>
    when(io.r(i).en) {
      // write operation has higher priority
      when(io.w(0).en && io.r(i).addr === io.w(0).addr){
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

  // when(io.r(0).en & )

  // io.envOut(0) := regs(RegStrtoNum("a7"))
  // io.envOut(1) := regs(RegStrtoNum("a6"))
  // io.envOut(2) := regs(RegStrtoNum("a0"))
  // io.envOut(3) := regs(RegStrtoNum("a1"))

  if(rfStateOut) {
    io.state.get.regState.zip(regs).foreach{ case(s,r) => s := r }
  }
  
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

    // TODO: this may cause some bugs when you instantiate RegFile but you did not instantiate the Sink! (BoringUtils...)
  // if(enableDebug){
  //   val regStatus = Wire(Vec(rfSets, gen))
  //   regStatus.zip(regs).foreach{ case (s, r) => 
  //     s := r
  //   }
  //   BoringUtils.addSource(regStatus,"regStatus")
  //   // dontTouch(regStatus)
  // }
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
          enableDebug = false
        )
    })

    println("Generating the RegFile hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new RegFile(UInt(32.W))(defaultConfig), Array("--target-dir", "build"))
}

package mycpu

import chisel3._
import chisel3.util._
import chisel3.util.experimental.BoringUtils
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class EnvInfo(implicit val p: Parameters) extends MyBundle{
    val cause = UInt(1.W)
    val info = Vec(4, UInt(32.W))
}

class CpuState(implicit val p: Parameters) extends MyBundle{
    val intRegState = Output(Vec(rfSets, UInt(xlen.W)))
    val inst = Output(UInt(ilen.W))
    val instCommit = Output(Bool())
    val pc = Output(UInt(addrWidth.W))
}

class MyCpu(startAddr: Int = 0)(implicit val p: Parameters) extends MyModule {
    // val io = IO(new Bundle{
    //     val start = Input(Bool())
    //     val envOut = ValidIO(new EnvInfo)
    //     val cpuState = new CpuState
    // })

    // val pcReg = RegInit(startAddr.U(addrWidth.W))
    // val pcNext4 = WireInit((startAddr).U(addrWidth.W))
    // val pcNext = WireInit(pcNext4)    
    // val pcTarget = WireInit(0.U(ilen.W))

    // val inst = WireInit(0.U(ilen.W))
    // val imm = WireInit(0.U(xlen.W))

    // val rs1 = inst(19,15)
    // val rs2 = inst(24,20)
    // val rd = inst(11,7)

    // val aluZero = WireInit(false.B)
    
    // val ctrlUnit = Module(new CtrlUnit())
    // val isBranch = ctrlUnit.io.out.isBranch
    // val immSrc = ctrlUnit.io.out.immSrc
    // val immSign = ctrlUnit.io.out.immSign
    // val aluOpSel = ctrlUnit.io.out.aluOpSel
    // // val aluSrc = ctrlUnit.io.out.aluSrc
    // // val memRdEn = ctrlUnit.io.out.memRdEn
    // val memWrEn = ctrlUnit.io.out.memWrEn
    // val memType = ctrlUnit.io.out.memType
    // val memSign = ctrlUnit.io.out.memSign
    // val regWrEn = ctrlUnit.io.out.regWrEn
    // val resultSrc = ctrlUnit.io.out.resultSrc
    // val pcAddReg = ctrlUnit.io.out.pcAddReg
    // val isJump = ctrlUnit.io.out.isJump
    // val ecall = ctrlUnit.io.out.ecall
    // val ebreak = ctrlUnit.io.out.ebreak
    // ctrlUnit.io.in.start := io.start
    // // ctrlUnit.io.in.zero := aluZero
    // ctrlUnit.io.in.inst := inst

    // val instMem = Module(new ROM())
    // instMem.io <> DontCare
    // instMem.io.raddr := pcReg
    // inst := instMem.io.rdata
    // // val instMem = Module(new IMem())
    // // instMem.io.addr := pcReg
    // // inst := instMem.io.inst

    // val regFile = Module(new RegFile2(UInt(32.W)))
    // val regFileRdAddr = VecInit(rs1, rs2)
    // val regFileRdData = Wire(Vec(regFile.io.r.length, chiselTypeOf(regFile.io.r(0).data)))
    // regFile.io.r.zip(regFileRdAddr).zip(regFileRdData).foreach{ case ((r, s), d) => 
    //     r.addr := s
    //     r.en := true.B // for current design(single cycle), this should always be true.B
    //     d := r.data
    // }
    // val regFileWrAddr = VecInit(rd)
    // val regFileWrEn = VecInit(regWrEn)
    // val regFileWrData = Wire(Vec(regFile.io.w.length, chiselTypeOf(regFile.io.w(0).data)))
    // regFile.io.w.zipWithIndex.foreach{ case (w,i) => 
    //     w.en := regFileWrEn(i)
    //     w.data := regFileWrData(i)
    //     w.addr := regFileWrAddr(i)
    // }
    // // regFileWrData(0) := DontCare
    // val rfState = regFile.io.state.get.regState
    // val regFileEnvOut =  VecInit(Seq(rfState(RegStrtoNum("a7")), rfState(RegStrtoNum("a6")), rfState(RegStrtoNum("a0")), rfState(RegStrtoNum("a1"))))//  a7: SBI extension ID   a6: SBI function ID   a0: return error code  a1: return value 
    
    // val alu = Module(new ALU())
    // val aluOut = alu.io.out
    // alu.io.in1 := regFileRdData(0)
    // // alu.io.in2 := Mux(aluSrc, imm, regFileRdData(1))
    // alu.io.in2 <> DontCare
    // alu.io.opSel := aluOpSel
    // aluZero := alu.io.zero

    // val dataMem = Module(new RAM())
    // val dataMemRdData = ReadMask(dataMem.io.rdata, memSign, memType, xlen)
    // dataMem.io.raddr := aluOut
    // dataMem.io.waddr := aluOut
    // dataMem.io.wen := memWrEn
    // dataMem.io.wdata := WriteMask(regFileRdData(1), memType, xlen)

    // regFileWrData(0) := MuxLookup(resultSrc, dataMemRdData, Seq(
    //                         "b00".U -> aluOut,
    //                         "b01".U -> dataMemRdData,
    //                         "b10".U -> pcNext4
    //                     ))

    // val immGen = Module(new ImmGen())
    // immGen.io.inst := inst
    // immGen.io.immSrc := immSrc
    // immGen.io.immSign := immSign
    // imm := immGen.io.imm
    
    // pcNext4 := pcReg + 4.U
    // pcTarget := Mux(pcAddReg, aluOut, Mux(immSign, (pcReg.asSInt + imm.asSInt).asUInt, pcReg + imm))
    // pcNext := Mux((isBranch && aluZero) || isJump, pcTarget, pcNext4)

    // val envStop = ecall | ebreak
    // val isEcall = ecall === true.B
    // val cpuStop = envStop | ~io.start
    // pcReg := Mux(cpuStop, pcReg, pcNext)
    // DebugLog(myCpuParams, DebugLevel.DBG_HIGH, "pcReg=%x\tinst=%x\n",pcReg,inst)

    // io.envOut.valid := envStop
    // io.envOut.bits.cause := isEcall // 0: ebreak   1:ecall
    // io.envOut.bits.info.zip(regFileEnvOut).foreach{
    //     case (info, reg) => info := reg
    // }

    // if(enableDebug){
    //     when(io.envOut.valid) {
    //         when(io.envOut.bits.cause.asBool){
    //             DebugLog(myCpuParams, DebugLevel.DBG_HIGH, "ECALL stop cpu! at pc=0x%x\tERROR_CODE=%d\tRET_VAL=%d\tEID=%d\tFID=%d\n"
    //                                                     ,pcReg, io.envOut.bits.info(2), io.envOut.bits.info(3),io.envOut.bits.info(0),io.envOut.bits.info(1))
    //         }.otherwise{
    //             DebugLog(myCpuParams, DebugLevel.DBG_HIGH, "EBREAK stop cpu! at pc=0x%x\tERROR_CODE=%d\tRET_VAL=%d\tEID=%d\tFID=%d\n"
    //                                                     ,pcReg, io.envOut.bits.info(2), io.envOut.bits.info(3),io.envOut.bits.info(0),io.envOut.bits.info(1))
    //         }
    //     }
    // }
    
    // if(enableDebug & rfStateOut) {
    //     io.cpuState.inst := inst
    //     io.cpuState.instCommit := RegNext(clock.asBool)
    //     io.cpuState.pc := pcReg
    //     io.cpuState.intRegState.zip(regFile.io.state.get.regState).foreach { case(s, r) => s := r }
    // }else{
    //     io.cpuState <> DontCare
    // }

}

object MyCpuGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the MyCpu hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new MyCpu()(defaultConfig), Array("--target-dir", "build"))
}

import chiseltest._

object MyCpuRawTest extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    chiseltest.RawTester.test(new MyCpu()(defaultConfig)) { c =>
        // c.io.start.poke(1.U)
        // c.clock.step(20)
    }
}
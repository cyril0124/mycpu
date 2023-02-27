package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._


class DecodeHazardOutBundle()(implicit val p: Parameters) extends MyBundle{
    val rs1 = UInt(5.W)
    val rs2 = UInt(5.W)
}

// TODO: aluOpWidth...
class DecodeOut(aluOpWidth: Int = 4)(implicit val p: Parameters) extends MyBundle{
    val isBranch = Bool()
    val isJump = Bool()
    val resultSrc = UInt(2.W)
    val memWrEn = Bool()
    val memRdEn = Bool()
    val memType = UInt(3.W)
    val memSign = Bool()
    val aluOpSel = UInt(aluOpWidth.W)
    val immSign = Bool()
    val regWrEn = Bool()
    val pcAddReg = Bool()
    val aluSrc = Bool()

    val pcNext4 = UInt(xlen.W)
    val data1 = UInt(xlen.W)
    val data2 = UInt(xlen.W)
    val imm = UInt(xlen.W)

    val instState = new InstState
}

class DecodeIO()(implicit val p: Parameters) extends MyBundle{
    val in = Flipped(new Bundle{
                val fetch = Decoupled(new FetchOut)
                val writeback = Decoupled(new WritebackOut)
            })
    val out = Decoupled(new DecodeOut)
    val hazard = Output(new DecodeHazardOutBundle)
    val regState = Output(new RegFileState)
    val ctrl = Input(new PipelineCtrlBundle)
}

class Decode()(implicit val p: Parameters) extends MyModule{
    val io = IO(new DecodeIO)
    
    val stall = io.ctrl.stall
    val flush = io.ctrl.flush

    io.in.fetch.ready := io.out.ready && ~stall
    io.in.writeback.ready :=  ~stall // io.out.ready

    val decodeLatch = io.out.ready && io.in.fetch.valid && io.in.writeback.valid
    val stageReg = RegEnable(io.in.fetch.bits, 0.U.asTypeOf(io.in.fetch.bits), decodeLatch)
    
    when(flush) {
        stageReg := 0.U.asTypeOf(io.in.fetch.bits)
    }


    val inst = stageReg.instState.inst
    val rs1 = InstField(inst, "rs1")
    val rs2 = InstField(inst, "rs2")
    val rd = InstField(inst,"rd")
    val imm = Wire(UInt(xlen.W))


    val ctrlUnit = Module(new CtrlUnit())
    val isBranch = ctrlUnit.io.out.isBranch
    val immSrc = ctrlUnit.io.out.immSrc
    val immSign = ctrlUnit.io.out.immSign
    val aluOpSel = ctrlUnit.io.out.aluOpSel
    val aluSrc = ctrlUnit.io.out.aluSrc
    val memRdEn = ctrlUnit.io.out.memRdEn
    val memWrEn = ctrlUnit.io.out.memWrEn
    val memType = ctrlUnit.io.out.memType
    val memSign = ctrlUnit.io.out.memSign
    val regWrEn = ctrlUnit.io.out.regWrEn
    val resultSrc = ctrlUnit.io.out.resultSrc
    val pcAddReg = ctrlUnit.io.out.pcAddReg
    val isJump = ctrlUnit.io.out.isJump
    // TODO: consider ecall and ebreak
    // val ecall = ctrlUnit.io.out.ecall
    // val ebreak = ctrlUnit.io.out.ebreak
    ctrlUnit.io.in.start := true.B
    ctrlUnit.io.in.inst := inst


    val regFile = Module(new RegFile(UInt(xlen.W)))
    val data1 = regFile.io.r(0).data
    val data2 = regFile.io.r(1).data // Mux(aluSrc, imm, regFile.io.r(1).data)
    regFile.io.r(0).en := true.B
    regFile.io.r(0).addr := rs1
    regFile.io.r(1).en := true.B
    regFile.io.r(1).addr := rs2
    regFile.io.w(0).en := io.in.writeback.bits.regWrEn & io.in.writeback.valid
    regFile.io.w(0).addr := io.in.writeback.bits.rd
    regFile.io.w(0).data := io.in.writeback.bits.regWrData

    val immGen = Module(new ImmGen())
    immGen.io.inst := inst
    immGen.io.immSrc := immSrc
    immGen.io.immSign := immSign
    imm := immGen.io.imm


    // control signals
    io.out.bits.isBranch := isBranch
    io.out.bits.isJump := isJump
    io.out.bits.resultSrc := resultSrc
    io.out.bits.memWrEn := memWrEn
    io.out.bits.memRdEn := memRdEn
    io.out.bits.memType := memType
    io.out.bits.memSign := memSign
    io.out.bits.aluOpSel := aluOpSel
    io.out.bits.pcAddReg := pcAddReg
    io.out.bits.regWrEn := regWrEn
    io.out.bits.immSign := immSign
    io.out.bits.aluSrc := aluSrc

    io.out.bits.data1 := data1
    io.out.bits.data2 := data2
    io.out.bits.imm := imm
    io.out.bits.pcNext4 := stageReg.pcNext4

    io.out.bits.instState <> stageReg.instState
    io.regState <> regFile.io.state.getOrElse(DontCare)

    // hazard detection
    io.hazard.rs1 := rs1
    io.hazard.rs2 := rs2

    io.out.valid := io.out.ready && ~stall
}
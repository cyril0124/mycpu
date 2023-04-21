package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.experimental.ChiselEnum

import mycpu.common._
import mycpu.util._

import mycpu.common.consts.AluOp._
import mycpu.common.consts.Control._
import FUType._
import scala.annotation.bridge

// Branch Unit
class BRU()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val in1 = Input(UInt(xlen.W))
        val in2 = Input(UInt(xlen.W))
        val offset = Input(UInt(xlen.W))
        val pc = Input(UInt(xlen.W))
        val opSel = Input(UInt(BR_WIDTH.W))

        val brAddr = Output(UInt(xlen.W))
        val brTaken = Output(Bool())
    })

    // compare operation
    val cmp = MuxLookup(io.opSel, 0.U, Seq(
                    BR_LT   -> (io.in1.asSInt < io.in2.asSInt).asUInt,
                    BR_LTU  -> (io.in1 < io.in2),
                    BR_EQ   -> (io.in1 === io.in2),
                    BR_NE   -> (io.in1 =/= io.in2),
                    BR_GE   -> (io.in1.asSInt >= io.in2.asSInt),
                    BR_GEU  -> (io.in1 >= io.in2)
            ))

    val brAddr = Wire(UInt(xlen.W))
    when(io.opSel === BR_JAL) {
        brAddr := io.pc + io.offset // pc += sext(offset)
    }.elsewhen(io.opSel === BR_JALR) {
        brAddr := io.in1 + io.offset
    }.elsewhen(cmp === true.B) {
        brAddr := io.pc + io.offset
    }.otherwise{
        brAddr := io.pc + io.offset
    }


    io.brTaken := cmp | io.opSel === BR_JAL | io.opSel === BR_JALR
    io.brAddr := brAddr
}

class BRUStageIO()(implicit val p: Parameters) extends MyBundle {
    val in = Flipped(Decoupled(new Bundle{
        val opr1 = UInt(OPR_WIDTH.W)
        val opr2 = UInt(OPR_WIDTH.W)
        val bruOp = UInt(BR_WIDTH.W)
        val immSrc = UInt(IMM_TYP_WIDTH.W)

        val inst = UInt(ilen.W)
        val pc = UInt(xlen.W)
    }))
    val out = Decoupled(new Bundle{
        val brTaken = Bool()
        val brAddr = UInt(xlen.W)

        val data = UInt(xlen.W)
        val rd = UInt(5.W)
        val wrEn = Bool()

        val inst = UInt(ilen.W)
        val pc = UInt(xlen.W) 
    })
    val rfRd = Vec(2, Flipped(new ReadPort(UInt(xlen.W))))
    val rfRdReady = Input(Bool())
}

class BRUStage()(implicit val p: Parameters) extends MyModule {
    val io = IO(new BRUStageIO)

    val s0_valid, s0_ready = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool()) 

    io.in.ready := s0_ready
    // --------------------------------------------------------------------------------
    // Stage 0
    // --------------------------------------------------------------------------------
    // Read oprand & Generate imm
    val s0_latch = io.in.valid && s0_ready
    val s0_full = RegInit(false.B)
    val s0_fire = s0_valid & s1_ready
    val s0_info = RegEnable(io.in.bits, s0_latch)
    s0_ready := !s0_full || s0_fire

    when(s0_latch) { s0_full := true.B }
    .elsewhen(s0_fire && s0_full) { s0_full := false.B }

    val s0_rs1 = InstField(s0_info.inst, "rs1")
    val s0_rs2 = InstField(s0_info.inst, "rs2")
    val s0_rd = InstField(s0_info.inst, "rd")
    val rf_rs1 = Mux(s0_info.opr1 === OPR_REG1, s0_rs1, 0.U) 
    val rf_rs2 = Mux(s0_info.opr2 === OPR_REG2, s0_rs2, 0.U) 

    val nBRU = BRU.litValue.toInt
    val s0_rsVec = VecInit(rf_rs1, rf_rs2)
    val s0_rsValVec = VecInit(Seq.fill(2)(WireInit(0.U(xlen.W)))) 
    (0 to 1).foreach{ i => 
        io.rfRd(i).en := s0_full
        io.rfRd(i).addr := s0_rsVec(i)
        s0_rsValVec(i) := io.rfRd(i).data
    }

    val immGen = Module(new ImmGen)
    val s0_imm = immGen.io.imm
    immGen.io.immSrc := s0_info.immSrc
    immGen.io.immSign := IMM_SE
    immGen.io.inst := s0_info.inst

    val s0_bruInVec = VecInit(Seq.fill(2)(WireInit(0.U(xlen.W))))
    s0_bruInVec(0) := MuxLookup( s0_info.opr1, 0.U, Seq(
                        OPR_ZERO -> 0.U, 
                        OPR_REG1 -> s0_rsValVec(0),
                    ))
    s0_bruInVec(1) := MuxLookup( s0_info.opr2, 0.U, Seq(
                        OPR_ZERO -> 0.U, 
                        OPR_REG2 -> s0_rsValVec(1),
                    ))
    
    s0_valid := io.rfRdReady && s0_full
    // --------------------------------------------------------------------------------
    // Stage 1
    // --------------------------------------------------------------------------------
    // Bru operation
    val s1_latch = s0_valid && s1_ready
    val s1_full = RegInit(false.B)
    val s1_fire = s1_valid
    val s1_bruOp = RegEnable(s0_info.bruOp, s1_latch)
    val s1_rd = RegEnable(s0_rd, s1_latch)
    val s1_bruInVec = RegEnable(s0_bruInVec, s1_latch)
    val s1_imm = RegEnable(s0_imm, s1_latch)
    val s1_pc = RegEnable(s0_info.pc, s1_latch)
    val s1_inst = RegEnable(s0_info.inst, s1_latch)
    s1_ready := !s1_full || s1_fire

    when(s1_latch) { s1_full := true.B }
    .elsewhen(s1_fire && s1_full) { s1_full := false.B }

    val bru = Module(new BRU)
    bru.io.in1 := s1_bruInVec(0)
    bru.io.in2 := s1_bruInVec(1)
    bru.io.offset := s1_imm
    bru.io.pc := s1_pc
    bru.io.opSel := s1_bruOp

    io.out.bits.brTaken := bru.io.brTaken
    io.out.bits.brAddr := bru.io.brAddr
    io.out.bits.wrEn := s1_bruOp === BR_JAL | s1_bruOp === BR_JALR
    io.out.bits.data := s1_pc + 4.U
    io.out.bits.rd := s1_rd
    io.out.bits.pc := s1_pc
    io.out.bits.inst := s1_inst
    io.out.valid := s1_full

    s1_valid := io.out.fire
}
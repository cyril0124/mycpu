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

class ALU_1()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val in1 = Input(UInt(xlen.W))
        val in2 = Input(UInt(xlen.W))
        val opSel = Input(UInt(aluOpWidth.W))

        val out = Output(UInt(xlen.W))

        // status output
        val zero = Output(Bool())
    })

    // add & sub operation
    val sum = io.in1 + Mux(io.opSel(0), -io.in2, io.in2)
    
    // shift operation
    val shamt = io.in2(4,0).asUInt // shift amount
    val shiftr = Mux( io.opSel(1), 
                        io.in1 >> shamt,  // logical shift
                        (io.in1.asSInt >> shamt)(xlen-1,0) // arithmetic shift
                    )
    val shiftl = io.in1 << shamt
    val shout = Mux(io.opSel === ALU_SRL || io.opSel === ALU_SRA, shiftr, 0.U) |
                Mux(io.opSel === ALU_SLL,                     shiftl, 0.U)

    // logical operation
    val logic = MuxLookup(io.opSel, 0.U, Seq(
                    ALU_AND -> (io.in1 & io.in2),
                    ALU_OR  -> (io.in1 | io.in2),
                    ALU_XOR -> (io.in1 ^ io.in2)
                ))

    // compare operation
    val cmp = MuxLookup(io.opSel, 0.U, Seq(
                    ALU_SLT  -> (io.in1.asSInt < io.in2.asSInt).asUInt,
                    ALU_SLTU -> (io.in1 < io.in2),
                    ALU_EQU  -> (io.in1 === io.in2),
                    ALU_NE   -> (io.in1 =/= io.in2),
                    ALU_GEQ  -> (io.in1.asSInt >= io.in2.asSInt),
                    ALU_GEQU  -> (io.in1 >= io.in2)
            ))

    val op = io.opSel
    when(op === ALU_BYPA) {
        io.out := io.in1
    }.elsewhen(op === ALU_BYPB) {
        io.out := io.in2
    }.otherwise {
        io.out := Mux(op === ALU_ADD || op === ALU_SUB, sum, logic | shout)
    }


    io.zero := cmp === true.B
}


class ALUStageIO()(implicit val p: Parameters) extends MyBundle {
    val in = Flipped(Decoupled(new Bundle{
        val opr1 = UInt(OPR_WIDTH.W)
        val opr2 = UInt(OPR_WIDTH.W)
        val aluOp = UInt(aluOpWidth.W)
        val immSign = UInt(1.W)

        val inst = UInt(ilen.W)
        val pc = UInt(xlen.W)

        val id = UInt(3.W)
    }))
    val out = Decoupled(new Bundle{
        val data = UInt(xlen.W)
        val rd = UInt(5.W)

        val inst = UInt(ilen.W)
        val pc = UInt(xlen.W)

        val id = UInt(3.W)
    })
    val rfRd = Vec(2, Flipped(new ReadPort(UInt(xlen.W))))
    val rfRdReady = Input(Bool())
    val flush = Input(Bool())
}

class ALUStage()(implicit val p: Parameters) extends MyModule {
    val io = IO(new ALUStageIO)

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
    val rf_rs2 = Mux(s0_info.opr2 === OPR_REG2, s0_rs1, 0.U)

    val nALU = ALU.litValue.toInt
    val s0_rsVec = VecInit(rf_rs1, rf_rs2)
    val s0_rsValVec = VecInit(Seq.fill(2)(WireInit(0.U(xlen.W)))) 
    (0 to 1).foreach{ i => 
        io.rfRd(i).en := s0_full
        io.rfRd(i).addr := s0_rsVec(i)
        s0_rsValVec(i) := io.rfRd(i).data
    }

    val immGen = Module(new ImmGen)
    val s0_imm = immGen.io.imm
    immGen.io.immSrc := IMM_I // s0_info.immSrc
    immGen.io.immSign := s0_info.immSign
    immGen.io.inst := s0_info.inst

    val s0_aluInVec = VecInit(Seq.fill(2)(WireInit(0.U(xlen.W))))
    s0_aluInVec(0) := Mux(s0_info.opr1 === OPR_ZERO, 0.U, s0_rsValVec(0))
    s0_aluInVec(1) := Mux(s0_info.opr2 === OPR_ZERO, 0.U, Mux(s0_info.opr2 === OPR_IMM, s0_imm, s0_rsValVec(1)))

    s0_valid := io.rfRdReady && s0_full

    // --------------------------------------------------------------------------------
    // Stage 1
    // --------------------------------------------------------------------------------
    // Alu operation
    val s1_latch = s0_valid && s1_ready
    val s1_full = RegInit(false.B)
    val s1_fire = s1_valid
    val s1_aluOp = RegEnable(s0_info.aluOp, s1_latch)
    val s1_rd = RegEnable(s0_rd, s1_latch)
    val s1_aluInVec = RegEnable(s0_aluInVec, s1_latch)
    val s1_pc = RegEnable(s0_info.pc, s1_latch)
    val s1_inst = RegEnable(s0_info.inst, s1_latch)
    val s1_id = RegEnable(s0_info.id, s1_latch)
    s1_ready := !s1_full || s1_fire

    when(s1_latch) { s1_full := true.B }
    .elsewhen(s1_fire && s1_full) { s1_full := false.B }

    val alu = Module(new ALU_1)
    alu.io.in1 := s1_aluInVec(0)
    alu.io.in2 := s1_aluInVec(1)
    alu.io.opSel := s1_aluOp

    io.out.bits.data := alu.io.out
    io.out.bits.rd := s1_rd
    io.out.bits.pc := s1_pc
    io.out.bits.inst := s1_inst
    io.out.bits.id := s1_id
    io.out.valid := s1_full

    s1_valid := io.out.fire



    when(io.flush) {
        s0_full := false.B
        s1_full := false.B
    }
}
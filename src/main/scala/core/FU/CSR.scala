package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.CsrOp._
import mycpu.csr._
import mycpu.common.consts.Control._
import mycpu.common.consts.CSR._
import mycpu.common.consts.ExceptType._

import FUType._

class CSRStageIO()(implicit val p: Parameters) extends MyBundle {
    val in = Flipped(Decoupled(new Bundle{
        val csrOp = UInt(CSR_OP_WIDTH.W)
        val excpType = UInt(EXC_TYPE_WIDTH.W)

        val inst = UInt(ilen.W)
        val pc = UInt(xlen.W)

        val id = UInt(8.W)
    }))
    val out = Decoupled(new Bundle{
        val data = UInt(xlen.W)
        val rd = UInt(5.W)
        val wrEn = Bool()

        val excpAddr = UInt(xlen.W)
        val excpValid = Bool()

        val inst = UInt(ilen.W)
        val pc = UInt(xlen.W) 

        val id = UInt(8.W)
    })
    val rfRd = Vec(2, Flipped(new ReadPort(UInt(xlen.W))))
    val rfRdReady = Input(Bool())
    val flush = Input(Bool())
    val csr = Output(new Bundle{
        val mode    = Output(UInt(CSR_MODE_WIDTH.W))
        val busy    = Output(Bool())
        val mepc    = Output(UInt(xlen.W))
        val trapVec = Output(UInt(xlen.W))
    })
}

class CSRStage()(implicit val p: Parameters) extends MyModule {
    val io = IO(new CSRStageIO)

    val csrFile = Module(new CsrFile)
    csrFile.io <> DontCare
    io.csr.busy := csrFile.io.busy
    io.csr.mepc := csrFile.io.mepc
    io.csr.mode := csrFile.io.mode
    io.csr.trapVec := csrFile.io.trapVec

    val s0_valid, s0_ready = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool()) 
    
    io.in.ready := s0_ready
    // --------------------------------------------------------------------------------
    // Stage 0
    // --------------------------------------------------------------------------------
    // CSR read & Read regfile
    val s0_latch = io.in.valid && s0_ready
    val s0_full = RegInit(false.B)
    val s0_fire = s0_valid & s1_ready
    val s0_info = RegEnable(io.in.bits, s0_latch)
    s0_ready := !s0_full || s0_fire

    when(s0_latch) { s0_full := true.B }
    .elsewhen(s0_fire && s0_full) { s0_full := false.B }

    val immGen = Module(new ImmGen)
    val s0_imm = immGen.io.imm
    immGen.io.immSrc := IMM_CSR
    immGen.io.immSign := IMM_ZE
    immGen.io.inst := s0_info.inst

    val s0_rs1 = InstField(s0_info.inst, "rs1")
    val s0_rs2 = 0.U(5.W)
    val s0_rd = InstField(s0_info.inst, "rd")
    val s0_csrAddr = InstField(s0_info.inst, "csr_dest")
    val s0_csrOp = s0_info.csrOp
    val s0_excpType = s0_info.excpType

    val nCSR = CSR.litValue.toInt
    val s0_rsVec = VecInit(s0_rs1, s0_rs2)
    val s0_rsValVec = VecInit(Seq.fill(2)(WireInit(0.U(xlen.W)))) 
    (0 to 1).foreach{ i => 
        io.rfRd(i).en := s0_full
        io.rfRd(i).addr := s0_rsVec(i)
        s0_rsValVec(i) := io.rfRd(i).data
    }

    
    val s0_csrRdData = csrFile.io.read.data
    csrFile.io.read.addr := s0_csrAddr
    csrFile.io.read.op := s0_csrOp
    
    
    val s0_csrWrEn = s0_csrOp =/= CSR_NOP && csrFile.io.read.valid
    dontTouch(s0_csrWrEn)

    // s0_valid := (s0_csrWrEn || s0_excpType === EXC_NONE) && io.rfRdReady && s0_full
    s0_valid := io.rfRdReady && s0_full

    // --------------------------------------------------------------------------------
    // Stage 1
    // --------------------------------------------------------------------------------
    // CSR write
    val s1_latch = s0_valid && s1_ready
    val s1_full = RegInit(false.B)
    val s1_fire = s1_valid
    val s1_csrOp = RegEnable(s0_csrOp, s1_latch)
    val s1_excpType = RegEnable(s0_excpType, s1_latch)
    val s1_rd = RegEnable(s0_rd, s1_latch)
    val s1_csrAddr = RegEnable(s0_csrAddr, s1_latch)
    val s1_csrWrEn = RegEnable(s0_csrWrEn, s1_latch)
    val s1_csrWrData = RegEnable(s0_rsValVec(0), s1_latch)
    val s1_csrRdData = RegEnable(s0_csrRdData, s1_latch)
    val s1_pc = RegEnable(s0_info.pc, s1_latch)
    val s1_inst = RegEnable(s0_info.inst, s1_latch)
    val s1_id = RegEnable(s0_info.id, s1_latch)
    s1_ready := !s1_full || s1_fire

    when(s1_latch) { s1_full := true.B }
    .elsewhen(s1_fire && s1_full) { s1_full := false.B }

    csrFile.io.write.addr := s1_csrAddr
    csrFile.io.write.data := s1_csrWrData
    csrFile.io.write.op := Mux(s1_csrWrEn, s1_csrOp, CSR_R)

    io.out.bits.excpValid := s1_excpType =/= EXC_NONE
    io.out.bits.excpAddr := MuxLookup(s1_excpType, csrFile.io.trapVec, Seq(
                            EXC_MRET -> csrFile.io.mepc,
                        ))
    io.out.bits.wrEn := s1_full
    io.out.bits.data := s1_csrRdData
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
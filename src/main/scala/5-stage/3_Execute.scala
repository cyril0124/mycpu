package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import dataclass.data
import mycpu.csr.CsrRead
import mycpu.common.consts.CsrOp._
import mycpu.common.consts.ExceptType._
import mycpu.common.consts.Control._
import mycpu.common.consts.LsuOp._

class ExecuteOut()(implicit val p: Parameters) extends MyBundle{
    val resultSrc = UInt(2.W)
    val lsuOp  = UInt(LSU_OP_WIDTH.W)
    val regWrEn = Bool()
    val aluOut = UInt(xlen.W)
    val data2 = UInt(xlen.W)
    val pcNext4 = UInt(xlen.W)
    
    val csrOp = UInt(CSR_OP_WIDTH.W)
    val csrWrEn = Bool()
    val csrValid = Bool()
    val csrRdData  = UInt(xlen.W)
    val csrWrData = UInt(xlen.W)
    val csrAddr = UInt(xlen.W)
    val excType = UInt(EXC_TYPE_WIDTH.W) 

    val instState = new InstState
}

class Execute2Fetch()(implicit val p: Parameters) extends MyBundle{
    val brTaken = Bool() // from Execute stage
    val targetAddr = UInt(xlen.W)
}

class ExecuteHazardOutBundle()(implicit val p: Parameters) extends MyBundle{
    // output for hazard unit
    val rs1 = UInt(5.W)
    val rs2 = UInt(5.W)

    val resultSrc = UInt(2.W)
    val rd = UInt(5.W)
}

class ExecuteHazardInBundle()(implicit val p: Parameters) extends MyBundle{
    // from hazard unit
    val aluSrc1 = UInt(2.W)
    val aluSrc2 = UInt(2.W)
    // from memory stage
    val rdValM = UInt(xlen.W)
    // from Writeback stage
    val rdValW = UInt(xlen.W)
}

class ExecuteHazardIO()(implicit val p: Parameters) extends MyBundle{
    val out = Output(new ExecuteHazardOutBundle)
    val in = Input(new ExecuteHazardInBundle)
}

class ExecuteIO()(implicit val p: Parameters) extends MyBundle{
    val in = Flipped(Decoupled(new DecodeOut))
    val out = new Bundle{
                val memory = Decoupled(new ExecuteOut)
                val fetch = Decoupled(new Execute2Fetch)
            }
    val hazard = new ExecuteHazardIO
    val ctrl = Input(new PipelineCtrlBundle)
    val csrRead = new CsrRead
}


class Execute()(implicit val p: Parameters) extends MyModule{
    val io = IO(new ExecuteIO)

    val stall = io.ctrl.stall || !io.out.fetch.ready || !io.out.memory.ready
    val flush = io.ctrl.flush


    io.in.ready :=  !stall 
    val executeLatch = io.in.fire
    val stageReg = RegInit(0.U.asTypeOf(io.in.bits))
    when(executeLatch) {
        stageReg := io.in.bits
    }.elsewhen(!stall){
        stageReg := 0.U.asTypeOf(io.in.bits)
    }

    when(flush && !stall) { stageReg := 0.U.asTypeOf(io.in.bits) }

    val aluZero = Wire(Bool())
    val inst = stageReg.instState.inst

    // alu 
    val alu = Module(new ALU())
    val aluOut = alu.io.out
    val hazardData1 = WireInit(0.U(xlen.W))
    hazardData1 := MuxLookup(io.hazard.in.aluSrc1, stageReg.aluIn1, Seq(
                                "b00".U -> stageReg.aluIn1, 
                                "b01".U -> io.hazard.in.rdValM, 
                                "b10".U -> io.hazard.in.rdValW)
                            )
    val aluIn1 = Mux(stageReg.aluIn1IsReg, hazardData1, stageReg.aluIn1)
    // alu.io.in1 := Mux(stageReg.aluIn1IsReg, hazardData1, stageReg.aluIn1)
    alu.io.in1 := aluIn1
    val hazardData2 = WireInit(0.U(xlen.W))
    hazardData2 := MuxLookup(io.hazard.in.aluSrc2, stageReg.aluIn2, Seq(
                            "b00".U -> stageReg.aluIn2,
                            "b01".U -> io.hazard.in.rdValM,
                            "b10".U -> io.hazard.in.rdValW
                        ))
    alu.io.in2 := Mux(stageReg.aluIn2IsReg, hazardData2, stageReg.aluIn2)
    
    // when stage stall, refill stageReg 
    when(stageReg.aluIn1IsReg && io.hazard.in.aluSrc1 =/= "b00".U && stall) {
        stageReg.aluIn1 := hazardData1
    }
    when(stageReg.aluIn2IsReg && io.hazard.in.aluSrc2 =/= "b00".U && stall) {
        stageReg.aluIn2 := hazardData2
    }
    when(io.hazard.in.aluSrc2 =/= "b00".U && stall) {
        stageReg.data2 := hazardData2
    }

    alu.io.opSel := stageReg.aluOpSel
    aluZero      := alu.io.zero

    // output for fetch stage
    io.out.fetch.bits.brTaken       := (stageReg.isBranch && aluZero) || stageReg.isJump
    io.out.fetch.bits.targetAddr    := Mux(stageReg.pcAddReg, aluOut, 
                                            Mux(stageReg.immSign, (stageReg.imm.asSInt + stageReg.instState.pc.asSInt).asUInt, 
                                                stageReg.imm + stageReg.instState.pc 
                                            )
                                        ) 
    
    // output for memory stage
    io.out.memory.bits.aluOut       := aluOut
    io.out.memory.bits.resultSrc    := stageReg.resultSrc
    io.out.memory.bits.lsuOp        := stageReg.lsuOp
    io.out.memory.bits.regWrEn      := stageReg.regWrEn
    io.out.memory.bits.data2        := Mux(io.hazard.in.aluSrc2 === 0.U, stageReg.data2, 
                                        Mux(io.hazard.in.aluSrc2 === "b01".U, io.hazard.in.rdValM, 
                                        Mux(io.hazard.in.aluSrc2 === "b10".U, io.hazard.in.rdValW, stageReg.data2))) 
    io.out.memory.bits.pcNext4      := stageReg.pcNext4



    val csrAddr = InstField(inst, "csr_dest")
    io.csrRead.addr := csrAddr
    io.csrRead.op   := stageReg.csrOp
    io.out.memory.bits.csrOp      := stageReg.csrOp
    io.out.memory.bits.csrWrEn    := stageReg.csrOp =/= CSR_NOP && io.csrRead.valid
    io.out.memory.bits.csrValid   := io.csrRead.valid
    io.out.memory.bits.csrRdData  := io.csrRead.data
    io.out.memory.bits.csrWrData  := aluIn1
    io.out.memory.bits.csrAddr    := csrAddr
    io.out.memory.bits.excType    := stageReg.excType

    // hazard control
    io.hazard.out.rs1 := InstField(inst, "rs1")
    io.hazard.out.rs2 := InstField(inst, "rs2")
    // load hazard, which happens when the instruction in execute stage is load(lw), 
    // and the subsequent instruction needs its(lw) result that is read from DataMemory.
    // we can judge by resultSrc. (resultSrc == "b00".U indicates that this is a load instructions)
    io.hazard.out.resultSrc := stageReg.resultSrc
    io.hazard.out.rd := InstField(inst, "rd")

    // instruction state flow
    io.out.memory.bits.instState <> stageReg.instState


    io.out.memory.valid :=  !stall 
    io.out.fetch.valid :=  !stall
}
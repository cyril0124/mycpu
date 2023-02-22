package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class ExecuteOut()(implicit val p: Parameters) extends MyBundle{
    val rd = UInt(5.W)
    val rs1 = UInt(5.W)
    val rs2 = UInt(5.W)
    val resultSrc = UInt(2.W)
    val memWrEn = Bool()
    val memType = UInt(3.W)
    val memRdEn = Bool()
    val memSign = Bool()
    val regWrEn = Bool()
    val aluOut = Bool()
    val data2 = UInt(xlen.W)
    val pcNext4 = UInt(xlen.W)

    val instState = new InstState
}

class Execute2Fetch()(implicit val p: Parameters) extends MyBundle{
    val brTaken = Bool() // from Execute stage
    val targetAddr = UInt(xlen.W)
}

class ExecuteHazardOutBundle()(implicit val p: Parameters) extends MyBundle{
    // output for hazard unit
    val rs1 = Output(UInt(5.W))
    val rs2 = Output(UInt(5.W))
}

class ExecuteHazardInBundle()(implicit val p: Parameters) extends MyBundle{
    // from hazard unit
    val aluSrc1 = Input(UInt(2.W)) 
    val aluSrc2 = Input(UInt(2.W))
    // from memory stage
    val rdValM = Input(UInt(xlen.W)) 
    // from Writeback stage
    val rdValW = Input(UInt(xlen.W)) 
}

class ExecuteHazardBundle()(implicit val p: Parameters) extends MyBundle{
    val out = new ExecuteHazardOutBundle
    val in = new ExecuteHazardInBundle
}

class ExecuteIO()(implicit val p: Parameters) extends MyBundle{
    val in = Flipped(Decoupled(new DecodeOut))
    val out = new Bundle{
                val memory = Decoupled(new ExecuteOut)
                val fetch = Decoupled(new Execute2Fetch)
            }
    val hazard = new ExecuteHazardBundle
}


class Execute()(implicit val p: Parameters) extends MyModule{
    val io = IO(new ExecuteIO)

    io.in.ready := io.out.memory.ready && io.out.fetch.ready
    val executeLatch = io.in.valid && io.out.memory.ready && io.out.fetch.ready
    val stageReg = RegEnable(io.in.bits, executeLatch)

    val aluZero = Wire(Bool())

    // alu 
    val alu = Module(new Alu())
    val aluOut = alu.io.out
    alu.io.in1 := MuxLookup(io.hazard.in.aluSrc1, stageReg.data1, Seq(
                                "b00".U -> stageReg.data1, 
                                "b01".U -> io.hazard.in.rdValM, 
                                "b10".U -> io.hazard.in.rdValW)
                            )
    alu.io.in2 := MuxLookup(io.hazard.in.aluSrc2, Mux(stageReg.aluSrc, stageReg.imm, stageReg.data2), Seq(
                                "b00".U -> Mux(stageReg.aluSrc, stageReg.imm, stageReg.data2), 
                                "b01".U -> io.hazard.in.rdValM, 
                                "b10".U -> io.hazard.in.rdValW)
                            )
    
    alu.io.opSel := stageReg.aluOpSel
    aluZero := alu.io.zero

    // output for fetch stage
    io.out.fetch.bits.brTaken := (stageReg.isBranch && aluZero) || stageReg.isJump
    io.out.fetch.bits.targetAddr := Mux(stageReg.pcAddReg, 
                                        aluOut, 
                                        Mux(stageReg.immSign, 
                                            (stageReg.imm.asSInt + stageReg.instState.pc.asSInt).asUInt, 
                                            stageReg.imm + stageReg.instState.pc
                                            )
                                        ) 
    
    // output for memory stage
    io.out.memory.bits.aluOut := aluOut
    io.out.memory.bits.rd := stageReg.rd
    io.out.memory.bits.rs1 := stageReg.rs1
    io.out.memory.bits.rs2 := stageReg.rs2
    io.out.memory.bits.resultSrc := stageReg.resultSrc
    io.out.memory.bits.memWrEn := stageReg.memWrEn
    io.out.memory.bits.memRdEn := stageReg.memRdEn
    io.out.memory.bits.memSign := stageReg.memSign
    io.out.memory.bits.memType := stageReg.memType
    io.out.memory.bits.regWrEn := stageReg.regWrEn
    io.out.memory.bits.data2 := stageReg.data2
    io.out.memory.bits.pcNext4 := stageReg.pcNext4

    // hazard control
    io.hazard.out.rs1 := stageReg.rs1
    io.hazard.out.rs2 := stageReg.rs2

    // instruction state flow
    io.out.memory.bits.instState <> stageReg.instState


    io.out.memory.valid := io.out.memory.ready
    io.out.fetch.valid := io.out.memory.ready
}
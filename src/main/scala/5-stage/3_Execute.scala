package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class ExecuteOut()(implicit val p: Parameters) extends MyBundle{
    val resultSrc = UInt(2.W)
    val memWrEn = Bool()
    val memType = UInt(3.W)
    val memRdEn = Bool()
    val memSign = Bool()
    val regWrEn = Bool()
    val aluOut = UInt(xlen.W)
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
}


class Execute()(implicit val p: Parameters) extends MyModule{
    val io = IO(new ExecuteIO)

    val stall = io.ctrl.stall
    val flush = io.ctrl.flush

    io.in.ready := io.out.memory.ready && io.out.fetch.ready && ~stall
    val executeLatch = io.in.valid && io.out.memory.ready && io.out.fetch.ready
    val stageReg = RegEnable(io.in.bits, 0.U.asTypeOf(io.in.bits), executeLatch)

    when(flush) {
        stageReg := 0.U.asTypeOf(io.in.bits)
    }

    val aluZero = Wire(Bool())

    // alu 
    val alu = Module(new Alu())
    val aluOut = alu.io.out
    alu.io.in1 := MuxLookup(io.hazard.in.aluSrc1, stageReg.data1, Seq(
                                "b00".U -> stageReg.data1, 
                                "b01".U -> io.hazard.in.rdValM, 
                                "b10".U -> io.hazard.in.rdValW)
                            )
    
    // check regfile data2 sources for hazard
    val data2 = WireInit(0.U(xlen.W))
    data2 := MuxLookup(io.hazard.in.aluSrc2, stageReg.data2, Seq(
                            "b00".U -> stageReg.data2,
                            "b01".U -> io.hazard.in.rdValM,
                            "b10".U -> io.hazard.in.rdValW
                        ))
    alu.io.in2 := Mux(stageReg.aluSrc, stageReg.imm, data2)

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
    io.out.memory.bits.resultSrc := stageReg.resultSrc
    io.out.memory.bits.memWrEn := stageReg.memWrEn
    io.out.memory.bits.memRdEn := stageReg.memRdEn
    io.out.memory.bits.memSign := stageReg.memSign
    io.out.memory.bits.memType := stageReg.memType
    io.out.memory.bits.regWrEn := stageReg.regWrEn
    io.out.memory.bits.data2 := data2 // stageReg.data2
    io.out.memory.bits.pcNext4 := stageReg.pcNext4

    when(flush){
        io.out.memory.bits <> DontCare
    }

    // hazard control
    val inst = stageReg.instState.inst
    io.hazard.out.rs1 := InstField(inst, "rs1")
    io.hazard.out.rs2 := InstField(inst, "rs2")
    // load hazard, which happens when the instruction in execute stage is load(lw), 
    // and the subsequent instruction needs its(lw) result that is read from DataMemory.
    // we can judge by resultSrc. (resultSrc == "b00".U indicates that this is a load instructions)
    io.hazard.out.resultSrc := stageReg.resultSrc
    io.hazard.out.rd := InstField(inst, "rd")

    // instruction state flow
    io.out.memory.bits.instState <> stageReg.instState


    io.out.memory.valid := io.out.memory.ready
    io.out.fetch.valid := io.out.memory.ready
}
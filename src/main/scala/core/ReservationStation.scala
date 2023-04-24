package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.Control._
import mycpu.FUType._
import mycpu.common.consts.ExceptType._

class RSEntry()(implicit val p: Parameters) extends MyBundle {
    val busy = Bool()
    val op = UInt(8.W) // operation that will perform in Functional Unit
    val ROBId = UInt(8.W) // indicate that which ROB entry does this instruction store
    val opr1 = UInt(OPR_WIDTH.W)
    val opr2 = UInt(OPR_WIDTH.W)
    val rs1 = UInt(5.W)
    val rs2 = UInt(5.W)
    val rs1Val = UInt(xlen.W)
    val rs2Val = UInt(xlen.W)
    val rs1ROBId = UInt(8.W)
    val rs2ROBId = UInt(8.W) // rs1ROBId == 0 && rs2ROBId == 0 ==> operand ready => ready to issue this instruction into Functional Unit
    val immSrc = UInt(IMM_TYP_WIDTH.W)
    val immSign = UInt(1.W)
    val excpType = UInt(EXC_TYPE_WIDTH.W)
    // val tempData = UInt(xlen.W) // store imm or other address data depending on what type of instruction it is
    //                             // for ALU    tempData <==>  imm
    //                             // for BRU    tempData <==>  imm
    //                             // for LSU    tempData <==>  addr = rs1Val + imm
    //                             // for CSR    tempData <==>  csrAddr
    val pc = UInt(xlen.W)
    val inst = UInt(ilen.W)
}

class RSInput()(implicit val p: Parameters) extends MyBundle {
    val op = UInt(8.W)
    val opr1 = UInt(OPR_WIDTH.W)
    val opr2 = UInt(OPR_WIDTH.W)
    val rs1 = UInt(5.W)
    val rs2 = UInt(5.W)
    val ROBId = UInt(8.W)
    val rs1ROBId = UInt(8.W)
    val rs2ROBId = UInt(8.W)
    val immSrc = UInt(IMM_TYP_WIDTH.W)
    val immSign = UInt(1.W)
    val excpType = UInt(EXC_TYPE_WIDTH.W)
    val pc = UInt(xlen.W)
    val inst = UInt(ilen.W)
}

class RSOutput()(implicit val p: Parameters) extends MyBundle {
    val op = UInt(8.W)
    val ROBId = UInt(8.W)
    val opr1 = UInt(OPR_WIDTH.W)
    val opr2 = UInt(OPR_WIDTH.W)
    val rs1Val = UInt(xlen.W)
    val rs2Val = UInt(xlen.W)
    val immSrc = UInt(IMM_TYP_WIDTH.W)
    val immSign = UInt(1.W)
    val excpType = UInt(EXC_TYPE_WIDTH.W)

    val pc = UInt(xlen.W)
    val inst = UInt(ilen.W)
}

class ReservationStation(numEntries: Int, numROBEntries: Int)(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle {
        val enq = Flipped(Decoupled(new RSInput)) // from issue stage
        val deq = Decoupled(Output(new RSOutput)) // for Functional Unit
        val rob = Valid(new ROBRsInput(numROBEntries))
        val regStatus = Input(Vec(rfSets, new RegResult))
        val flush = Input(Bool())
    })

    val entries = Reg(Vec(numEntries, new RSEntry))
    val head = RegInit(0.U(log2Ceil(numEntries).W))
    val tail = RegInit(0.U(log2Ceil(numEntries).W))

    val count = RegInit(0.U(log2Ceil(numEntries+1).W))
    val full = count === numEntries.U
    val empty = count === 0.U

    val chosenEntry = entries(head)
    val oprReady = chosenEntry.rs1ROBId === 0.U && chosenEntry.rs2ROBId === 0.U
    io.enq.ready := !full
    io.deq.valid := !empty && oprReady && chosenEntry.busy
    io.deq.bits.op := chosenEntry.op
    io.deq.bits.ROBId := chosenEntry.ROBId
    io.deq.bits.opr1 := chosenEntry.opr1
    io.deq.bits.opr2 := chosenEntry.opr2
    io.deq.bits.rs1Val := chosenEntry.rs1Val
    io.deq.bits.rs2Val := chosenEntry.rs2Val
    io.deq.bits.immSrc := chosenEntry.immSrc
    io.deq.bits.immSign := chosenEntry.immSign
    io.deq.bits.excpType := chosenEntry.excpType
    io.deq.bits.pc := chosenEntry.pc
    io.deq.bits.inst := chosenEntry.inst

    io.rob.valid := false.B
    io.rob.bits.id := 0.U

    val rs1 = InstField(io.enq.bits.inst, "rs1")
    val rs2 = InstField(io.enq.bits.inst, "rs2")
    when (io.enq.fire) {
        entries(tail).busy := true.B
        entries(tail).ROBId := io.enq.bits.ROBId
        entries(tail).op := io.enq.bits.op
        entries(tail).rs1ROBId := io.enq.bits.rs1ROBId
        entries(tail).rs2ROBId := io.enq.bits.rs2ROBId
        entries(tail).inst := io.enq.bits.inst
        entries(tail).opr1 := io.enq.bits.opr1
        entries(tail).opr2 := io.enq.bits.opr2
        entries(tail).rs1 := io.enq.bits.rs1
        entries(tail).rs2 := io.enq.bits.rs2
        entries(tail).immSrc := io.enq.bits.immSrc
        entries(tail).immSign := io.enq.bits.immSign
        entries(tail).excpType := io.enq.bits.excpType
        entries(tail).pc := io.enq.bits.pc
        entries(tail).inst := io.enq.bits.inst

        entries(tail).rs1ROBId := io.regStatus(entries(tail).rs1).owner
        entries(tail).rs2ROBId := io.regStatus(entries(tail).rs2).owner
        
        when(io.regStatus(io.enq.bits.rs1).owner === 0.U) {
            entries(tail).rs1Val := io.regStatus(io.enq.bits.rs1).data
        }
        when(io.regStatus(io.enq.bits.rs2).owner === 0.U) {
            entries(tail).rs2Val := io.regStatus(io.enq.bits.rs2).data
        }

        tail := Mux(tail === (numEntries - 1).U, 0.U, tail + 1.U)
        count := count + 1.U
    }

    when (io.deq.fire) {
        entries(head).busy := false.B
        io.rob.valid := true.B
        io.rob.bits.id := entries(head).ROBId

        head := Mux(head === (numEntries - 1).U, 0.U, head + 1.U)
        count := count - 1.U
    }

    entries.foreach{ 
        e => 
            when(e.busy) {
                e.rs1ROBId := io.regStatus(e.rs1).owner
                e.rs2ROBId := io.regStatus(e.rs2).owner
                
                when(io.regStatus(e.rs1).owner === 0.U) {
                    e.rs1Val := io.regStatus(e.rs1).data
                }
                when(io.regStatus(e.rs2).owner === 0.U) {
                    e.rs2Val := io.regStatus(e.rs2).data
                }
            }
    }

    when (io.flush) {
        entries.foreach(e => e.busy := false.B)
        head := 0.U
        tail := 0.U
        count := 0.U
    }



}

object ReservationStationGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = true,
            busBeatSize = 16,
            logEnable = false,
            rfRdPort = 8, // for three FUs we need total 6 rdport
            rfWrPort = 4,
        )
    })

    println("Generating the ReservationStation hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new ReservationStation(3, 3)(defaultConfig), Array("--target-dir", "build"))
}


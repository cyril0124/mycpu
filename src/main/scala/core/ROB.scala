package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.FUType._
import mycpu.common.consts.Control._
import mycpu.common.consts.LsuOp._

object ROBStates{
    val ROB_STATE_WIDTH = log2Ceil(4)
    val sIssue = 0.U(ROB_STATE_WIDTH.W) // issue complete
    val sExec = 1.U(ROB_STATE_WIDTH.W) // execution complete: instruction is already load into Functional Unit
    val sWrite = 2.U(ROB_STATE_WIDTH.W) // write ROB complete
    val sCommit = 3.U(ROB_STATE_WIDTH.W) // commmit complete
}

import ROBStates._

class ROBEntry()(implicit val p: Parameters) extends MyBundle {
    val busy = Bool()
    val state = UInt(ROB_STATE_WIDTH.W)
    val rd = UInt(log2Ceil(rfSets).W)
    val data = UInt(xlen.W)

    val pc = UInt(xlen.W)
    val inst = UInt(ilen.W)
}

class RegResult()(implicit val p: Parameters) extends MyBundle {
    val owner = UInt(8.W) // from which ROB Entry, should be fill wieh ROBId
    val data = UInt(xlen.W)
}

class ROBInput()(implicit val p: Parameters) extends MyBundle {
    val rd = UInt(log2Ceil(rfSets).W)
    val fuValid = UInt(FU_NUM.W)
    val fuOp = UInt(8.W)

    val pc = UInt(xlen.W)
    val inst = UInt(ilen.W)
}

class ROBOutput()(implicit val p: Parameters) extends MyBundle {
    val rdWrEn = Bool()
    val rd = UInt(log2Ceil(rfSets).W)
    val data = UInt(xlen.W)

    val pc = UInt(xlen.W)
    val inst = UInt(ilen.W)
}

class ROBFuInput(numEntries: Int)(implicit val p: Parameters) extends MyBundle {
    val id = UInt(log2Ceil(numEntries).W)
    // val rd = UInt(5.W)
    val data = UInt(xlen.W)
}

class ROBRsInput(numEntries: Int)(implicit val p: Parameters) extends MyBundle {
    val id = UInt(log2Ceil(numEntries).W)
}

class ROB(numEntries: Int, nrFu: Int)(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle {
        val enq = Flipped(Decoupled(new ROBInput)) // from Issue stage
        val deq = Decoupled(Output(new ROBOutput)) // to Commit logic
        val rs = Vec(nrFu, Flipped(Valid(new ROBRsInput(numEntries)))) // from Reservation Station
        val fu = Vec(nrFu, Flipped(Valid(new ROBFuInput(numEntries)))) // from Functional Unit, valid when Functional Unit commit result
        val id = Output(UInt(log2Ceil(numEntries).W)) // id for Reservation Station
        val regStatus = Output(Vec(rfSets, new RegResult))
        val flush = Input(Bool())
    })

    val entries = Reg(Vec(numEntries, new ROBEntry))
    val regResStat = Reg(Vec(rfSets, new RegResult))

    val head = RegInit(0.U(log2Ceil(numEntries).W))
    val tail = RegInit(0.U(log2Ceil(numEntries).W))

    val count = RegInit(0.U(log2Ceil(numEntries+1).W))
    val full = count === numEntries.U
    val empty = count === 0.U

    io.regStatus <> regResStat
    io.id := tail + 1.U
    io.enq.ready := !full
    io.deq.valid := entries(head).state === sWrite && !empty
    io.deq.bits.data := entries(head).data
    io.deq.bits.rd := entries(head).rd
    io.deq.bits.rdWrEn := entries(head).rd =/= 0.U
    io.deq.bits.pc := entries(head).pc
    io.deq.bits.inst := entries(head).inst

    val enq = io.enq.bits
    val invalidRd = enq.fuValid(BRU) && (enq.fuOp =/= BR_JALR || enq.fuOp =/= BR_JAL) || 
                    enq.fuValid(LSU) && (enq.fuOp === LSU_SW || enq.fuOp === LSU_SH || enq.fuOp === LSU_SB || enq.fuOp === LSU_FENC) ||
                    enq.rd === 0.U
    when (io.enq.fire) {
        entries(tail).busy := true.B
        entries(tail).state := sIssue
        entries(tail).data := DontCare
        entries(tail).rd := io.enq.bits.rd
        entries(tail).pc := io.enq.bits.pc
        entries(tail).inst := io.enq.bits.inst

        regResStat(io.enq.bits.rd).owner := Mux(invalidRd, 0.U, tail + 1.U)

        tail := Mux(tail === (numEntries - 1).U, 0.U, tail + 1.U)
        count := count + 1.U
    }
    
    when (io.deq.fire) {
        entries(head).busy := false.B
        entries(head).state := sCommit

        head := Mux(head === (numEntries - 1).U, 0.U, head + 1.U)
        count := count - 1.U
    }

    io.rs.foreach{ r =>
        when(r.fire) {
            entries(r.bits.id - 1.U).state := sExec
        }
    }

    io.fu.foreach{ f => 
        when (f.fire) {
            entries(f.bits.id - 1.U).data := f.bits.data
            entries(f.bits.id - 1.U).state := sWrite
            
            val rd = entries(f.bits.id - 1.U).rd
            regResStat(rd).owner := 0.U
            when(rd =/= 0.U) {
                regResStat(rd).data := f.bits.data
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

object ROBGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = true,
            busBeatSize = 16,
            logEnable = false,
            rfRdPort = 8, // for three FUs we need total 6 rdport
            rfWrPort = 4,
        )
    })

    println("Generating the ROB hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new ROB(3, 4)(defaultConfig), Array("--target-dir", "build"))
}


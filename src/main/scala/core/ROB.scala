package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.FUType._
import mycpu.common.consts.Control._
import mycpu.common.consts.LsuOp._
import mycpu.common.Parameters._

object ROBStates{
    val ROB_STATE_WIDTH = log2Ceil(4)
    val sIssue = 0.U(ROB_STATE_WIDTH.W) // issue complete
    val sExec = 1.U(ROB_STATE_WIDTH.W) // execution complete: instruction is already load into Functional Unit
    val sWrite = 2.U(ROB_STATE_WIDTH.W) // write ROB complete
    val sCommit = 3.U(ROB_STATE_WIDTH.W) // commmit complete
    // val sIdle = 4.U(ROB_STATE_WIDTH.W)
}

import ROBStates._

class ROBEntry()(implicit val p: Parameters) extends MyBundle {
    val busy = Bool()
    val state = UInt(ROB_STATE_WIDTH.W)
    val rd = UInt(log2Ceil(rfSets).W)
    val data = UInt(xlen.W)

    // for BRU only
    val brAddr = UInt(xlen.W)
    val brTaken = Bool()

    val predictBrTaken = Bool()
    val predictID = UInt(8.W)
    val predictIdx = UInt(PRED_IDX_WIDTH.W)

    // for CSR only
    val excpAddr = UInt(xlen.W)
    val excpValid = Bool()

    val pc = UInt(xlen.W)
    val inst = UInt(ilen.W)
}

class ROBReadInfo()(implicit val p: Parameters) extends MyBundle {
    val busy = Bool()
    val state = UInt(ROB_STATE_WIDTH.W)
    val rd = UInt(log2Ceil(rfSets).W)
    val data = UInt(xlen.W)
}

class RegResult()(implicit val p: Parameters) extends MyBundle {
    val owner = UInt(8.W) // from which ROB Entry, should be fill wieh ROBId
}

class ROBInput()(implicit val p: Parameters) extends MyBundle {
    val rd = UInt(log2Ceil(rfSets).W)
    val fuValid = UInt(FU_NUM.W)
    val fuOp = UInt(8.W)

    val pc = UInt(xlen.W)
    val inst = UInt(ilen.W)
    val predictBrTaken = Bool()
    val predictID = UInt(8.W) // use for locating which pht entry is this predict info come from
    val predictIdx = UInt(PRED_IDX_WIDTH.W)
}

class ROBOutput()(implicit val p: Parameters) extends MyBundle {
    val rdWrEn = Bool()
    val rd = UInt(log2Ceil(rfSets).W)
    val data = UInt(xlen.W)
    val id = UInt(8.W)

    // for BRU only
    val brAddr = UInt(xlen.W)
    val brTaken = Bool()

    // for CSR only
    val excpAddr = UInt(xlen.W)
    val excpValid = Bool()

    val pc = UInt(xlen.W)
    val inst = UInt(ilen.W)
    val predictBrTaken = Bool()
    val predictID = UInt(8.W) 
    val predictIdx = UInt(PRED_IDX_WIDTH.W)
}

class ROBFuInput(numEntries: Int)(implicit val p: Parameters) extends MyBundle {
    val id = UInt(log2Ceil(numEntries).W)
    val data = UInt(xlen.W)
    val rd = UInt(5.W)

    // for BRU only
    val brAddr = UInt(xlen.W)
    val brTaken = Bool()

    // for CSR only
    val excpAddr = UInt(xlen.W)
    val excpValid = Bool()
}

class ROBRsInput(numEntries: Int)(implicit val p: Parameters) extends MyBundle {
    val id = UInt(log2Ceil(numEntries).W)
    val rd = UInt(5.W)
}

class ROBRsOutput(numEntries: Int)(implicit val p: Parameters) extends MyBundle {
    val data = UInt(xlen.W)
    val id = UInt(log2Ceil(numEntries).W)
    val rd = UInt(5.W)
}

class ROB(numEntries: Int, nrFu: Int)(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle {
        val enq = Flipped(Decoupled(new ROBInput)) // from Issue stage
        val deq = Decoupled(Output(new ROBOutput)) // to Commit logic
        val rs = Vec(nrFu, Flipped(Valid(new ROBRsInput(numEntries)))) // from Reservation Station
        val read = Vec(numEntries, Output(new ROBReadInfo)) // for Reservation Station
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
    
    (0 until numEntries).foreach{
        i => dontTouch(entries(i).busy)
    }

    io.regStatus <> regResStat
    io.id := tail + 1.U
    io.enq.ready := !full && !entries(tail).busy
    io.deq.valid := entries(head).state === sWrite && entries(head).busy
    io.deq.bits.data := entries(head).data
    io.deq.bits.rd := entries(head).rd
    io.deq.bits.rdWrEn := entries(head).rd =/= 0.U
    io.deq.bits.pc := entries(head).pc
    io.deq.bits.inst := entries(head).inst
    io.deq.bits.brAddr := entries(head).brAddr
    io.deq.bits.brTaken := entries(head).brTaken
    io.deq.bits.predictBrTaken := entries(head).predictBrTaken
    io.deq.bits.predictIdx := entries(head).predictIdx
    io.deq.bits.predictID := entries(head).predictID
    io.deq.bits.excpAddr := entries(head).excpAddr
    io.deq.bits.excpValid := entries(head).excpValid
    io.deq.bits.id := head + 1.U

    val enq = io.enq.bits
    when (io.enq.fire) {
        entries(tail).busy := true.B
        entries(tail).state := sIssue
        entries(tail).data := DontCare
        entries(tail).rd := io.enq.bits.rd
        entries(tail).pc := io.enq.bits.pc
        entries(tail).inst := io.enq.bits.inst
        entries(tail).predictBrTaken := io.enq.bits.predictBrTaken
        entries(tail).predictID := io.enq.bits.predictID
        entries(tail).predictIdx := io.enq.bits.predictIdx
        
        val rd = io.enq.bits.rd
        regResStat(rd).owner := Mux(rd === 0.U, 0.U, tail + 1.U)

        tail := Mux(tail === (numEntries - 1).U, 0.U, tail + 1.U)
    }
    
    when (io.deq.fire) {
        entries(head).busy := false.B
        entries(head).state := sCommit
        entries(head).brTaken := false.B
        entries(head).excpValid := false.B

        val rdDeqEntry = entries(head).rd
        when(regResStat(rdDeqEntry).owner === head + 1.U && !(io.enq.fire && io.enq.bits.rd === rdDeqEntry) ) { // deq has higher priority
            regResStat(rdDeqEntry).owner := 0.U
        }

        head := Mux(head === (numEntries - 1).U, 0.U, head + 1.U)
    }

    when( !(io.deq.fire && io.enq.fire) ) {
        when(io.enq.fire) {
            count := count + 1.U
        }
        when(io.deq.fire) {
            count := count - 1.U
        }
    }

    io.fu.foreach{ f => 
        when (f.fire) {
            entries(f.bits.id - 1.U).data := f.bits.data
            entries(f.bits.id - 1.U).state := sWrite
            entries(f.bits.id - 1.U).brAddr := f.bits.brAddr
            entries(f.bits.id - 1.U).brTaken := f.bits.brTaken
            entries(f.bits.id - 1.U).excpAddr := f.bits.excpAddr
            entries(f.bits.id - 1.U).excpValid := f.bits.excpValid
        }
    }

    entries.zip(io.read).foreach{ case(e, r) => 
        r.busy := e.busy
        r.data := e.data
        r.state := e.state
        r.rd := e.rd
    }

    
    io.rs.foreach{ r =>
        when(r.fire) { // Reservation Station has higher priority than Functional Unit
            entries(r.bits.id - 1.U).state := sExec
        }
    }

    when (io.flush) {
        entries.foreach(e => e.busy := false.B)
        regResStat.foreach(r => r.owner := 0.U)
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


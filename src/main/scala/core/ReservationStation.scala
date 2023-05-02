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
    val rd =  UInt(5.W)
    val rs1Val = UInt(xlen.W)
    val rs2Val = UInt(xlen.W)
    val rs1ROBId = UInt(8.W)
    val rs2ROBId = UInt(8.W) // rs1ROBId == 0 && rs2ROBId == 0 ==> operand ready => ready to issue this instruction into Functional Unit
    val immSrc = UInt(IMM_TYP_WIDTH.W)
    val immSign = UInt(1.W)
    val excpType = UInt(EXC_TYPE_WIDTH.W)
    val pc = UInt(xlen.W)
    val inst = UInt(ilen.W)
}

class RSInput()(implicit val p: Parameters) extends MyBundle {
    val op = UInt(8.W)
    val opr1 = UInt(OPR_WIDTH.W)
    val opr2 = UInt(OPR_WIDTH.W)
    val rs1 = UInt(5.W)
    val rs2 = UInt(5.W)
    val rd = UInt(5.W)  // TODO: optimize repeat and unnassary data field
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

class CommonDataBus()(implicit val p: Parameters) extends MyBundle {
    val data = UInt(xlen.W)
    val id = UInt(8.W)
    val rd = UInt(5.W)
}

import ROBStates._

class ReservationStation(numEntries: Int, numROBEntries: Int, nrFu: Int)(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle {
        val enq = Flipped(Decoupled(new RSInput)) // from issue stage
        val deq = Decoupled(Output(new RSOutput)) // for Functional Unit
        val robOut = Valid(new ROBRsInput(numROBEntries)) // for ROB
        val robRead = Vec(numROBEntries, Input(new ROBReadInfo))
        val regStatus = Input(Vec(rfSets, new RegResult))
        val cdb = Input(Vec(nrFu, Valid(new CommonDataBus)))
        val rf = Flipped(Vec(2, new ReadPort(UInt(xlen.W))))
        val flush = Input(Bool())
    })

    val entries = Reg(Vec(numEntries, new RSEntry))
    val head = RegInit(0.U(log2Ceil(numEntries).W))
    val tail = RegInit(0.U(log2Ceil(numEntries).W))

    val count = RegInit(0.U(log2Ceil(numEntries+1).W))
    val full = count === numEntries.U
    val empty = count === 0.U

    val rs1BypassFromROB = WireDefault(false.B)
    val rs2BypassFromROB = WireDefault(false.B)
    val rs1BypassFromROBVal = WireDefault(0.U(xlen.W))
    val rs2BypassFromROBVal = WireDefault(0.U(xlen.W))

    val rs1BypassFromCDB = WireDefault(false.B)
    val rs2BypassFromCDB = WireDefault(false.B)
    val rs1BypassFromCDBVal = WireDefault(0.U(xlen.W))
    val rs2BypassFromCDBVal = WireDefault(0.U(xlen.W))

    val chosenEntry = entries(head)
    val oprReady = (chosenEntry.rs1ROBId === 0.U || rs1BypassFromROB || rs1BypassFromCDB) && (chosenEntry.rs2ROBId === 0.U || rs2BypassFromROB || rs2BypassFromCDB)
    io.enq.ready := !full && !entries(tail).busy
    io.deq.valid := oprReady && chosenEntry.busy
    io.deq.bits.op := chosenEntry.op
    io.deq.bits.ROBId := chosenEntry.ROBId
    io.deq.bits.opr1 := chosenEntry.opr1
    io.deq.bits.opr2 := chosenEntry.opr2
    io.deq.bits.rs1Val :=   Mux(
                                chosenEntry.rs1ROBId === 0.U, 
                                chosenEntry.rs1Val, 
                                Mux( 
                                    rs1BypassFromROB, 
                                    rs1BypassFromROBVal, 
                                    Mux( rs1BypassFromCDB, rs1BypassFromCDBVal, chosenEntry.rs1Val ) 
                                )
                            )
    io.deq.bits.rs2Val :=   Mux(
                                chosenEntry.rs2ROBId === 0.U, 
                                chosenEntry.rs2Val, 
                                Mux( 
                                    rs2BypassFromROB, 
                                    rs2BypassFromROBVal, 
                                    Mux( rs2BypassFromCDB, rs2BypassFromCDBVal, chosenEntry.rs2Val ) 
                                )
                            )
    io.deq.bits.immSrc := chosenEntry.immSrc
    io.deq.bits.immSign := chosenEntry.immSign
    io.deq.bits.excpType := chosenEntry.excpType
    io.deq.bits.pc := chosenEntry.pc
    io.deq.bits.inst := chosenEntry.inst

    io.robOut.valid := false.B
    io.robOut.bits.id := 0.U
    io.robOut.bits.rd := 0.U

    io.rf.foreach{ r => 
        r.en := true.B
        r.addr := 0.U
    }
    
    val rs1Enq = InstField(io.enq.bits.inst, "rs1")
    val rs2Enq = InstField(io.enq.bits.inst, "rs2")
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
        entries(tail).rd := io.enq.bits.rd
        entries(tail).immSrc := io.enq.bits.immSrc
        entries(tail).immSign := io.enq.bits.immSign
        entries(tail).excpType := io.enq.bits.excpType
        entries(tail).pc := io.enq.bits.pc
        entries(tail).inst := io.enq.bits.inst

        val rs1 = io.enq.bits.rs1
        val rs2 = io.enq.bits.rs2
        entries(tail).rs1ROBId := io.regStatus(rs1).owner
        entries(tail).rs2ROBId := io.regStatus(rs2).owner
        
        // Read register file
        io.rf(0).addr := io.enq.bits.rs1
        io.rf(1).addr := io.enq.bits.rs2
        entries(tail).rs1Val := io.rf(0).data
        entries(tail).rs2Val := io.rf(1).data

        tail := Mux(tail === (numEntries - 1).U, 0.U, tail + 1.U)
    }

    when (io.deq.fire) {
        entries(head).busy := false.B
        io.robOut.valid := true.B
        io.robOut.bits.id := entries(head).ROBId
        io.robOut.bits.rd := entries(head).rd

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

    entries.zipWithIndex.foreach{ case(e, i) => 
        when(e.busy) {
            // Operands has three sources:
            // (1) from RegFile
            // (2) from ROB
            // (3) from CDB(Common Data Bus)

            // Bypass from ROB entry
            val rs1ROBEntry = io.robRead(e.rs1ROBId - 1.U)
            val rs2ROBEntry = io.robRead(e.rs2ROBId - 1.U)
            val rs1FromROB = (rs1ROBEntry.busy && rs1ROBEntry.state === sWrite || rs1ROBEntry.state === sCommit) && rs1ROBEntry.rd === e.rs1 && e.rs1 =/= 0.U
            val rs2FromROB = (rs2ROBEntry.busy && rs2ROBEntry.state === sWrite || rs2ROBEntry.state === sCommit) && rs2ROBEntry.rd === e.rs2 && e.rs2 =/= 0.U
            
            when(rs1FromROB && e.rs1ROBId =/= 0.U) {
                e.rs1Val := rs1ROBEntry.data
                e.rs1ROBId := 0.U

                when(head === i.U) {
                    rs1BypassFromROB := true.B
                    rs1BypassFromROBVal := rs1ROBEntry.data
                }
            }
            when(rs2FromROB && e.rs2ROBId =/= 0.U) {
                e.rs2Val := rs2ROBEntry.data
                e.rs2ROBId := 0.U
                
                when(head === i.U) {
                    rs2BypassFromROB := true.B
                    rs2BypassFromROBVal := rs2ROBEntry.data
                }
            }

            // Bypass from CDB(Common Data Bus)
            val rs1MatchVec = Cat(io.cdb.map(c => c.bits.rd === e.rs1).reverse)
            val rs2MatchVec = Cat(io.cdb.map(c => c.bits.rd === e.rs2).reverse)
            val rs1IDMatchVec = Cat(io.cdb.map(c => c.bits.id === e.rs1ROBId).reverse)
            val rs2IDMatchVec = Cat(io.cdb.map(c => c.bits.id === e.rs2ROBId).reverse)
            val cdbValidVec = Cat(io.cdb.map(c => c.valid).reverse)
            val cdbBypassRs1 = cdbValidVec & rs1MatchVec & rs1IDMatchVec
            val cdbBypassRs2 = cdbValidVec & rs2MatchVec & rs2IDMatchVec
            val cdbDataVec = io.cdb.map(c => c.bits.data)
            val bypassRs1 = cdbBypassRs1.orR
            val bypassRs2 = cdbBypassRs2.orR

            when(bypassRs1 && e.rs1ROBId =/= 0.U) {
                val bypassRs1 = Mux1H(cdbBypassRs1, cdbDataVec)
                e.rs1Val := bypassRs1
                e.rs1ROBId := 0.U

                when(head === i.U) {
                    rs1BypassFromCDB := true.B
                    rs1BypassFromCDBVal := bypassRs1
                }
            }
            when(bypassRs2 && e.rs2ROBId =/= 0.U) {
                val bypassRs2 = Mux1H(cdbBypassRs2, cdbDataVec)
                e.rs2Val := bypassRs2
                e.rs2ROBId := 0.U

                when(head === i.U) {
                    rs2BypassFromCDB := true.B
                    rs2BypassFromCDBVal := bypassRs2
                }
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
    (new chisel3.stage.ChiselStage).emitVerilog(new ReservationStation(3, 3, 4)(defaultConfig), Array("--target-dir", "build"))
}


package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.experimental.ChiselEnum

import mycpu.common._
import mycpu.util._
import chisel3.internal.public
import chisel3.experimental.hierarchy.public


object FUType{
    val FU_WIDTH = log2Ceil(3)
    val ALU = 0.U(FU_WIDTH.W)
    val BRU = 1.U(FU_WIDTH.W)
    val LSU = 2.U(FU_WIDTH.W)
    val FU_NOP = ALU
    val FUs = Seq(ALU, BRU, LSU)
}

import FUType._

class ScoreboardEntries()(implicit val p: Parameters) extends MyBundle {
    val busy = Bool() // indicates whether the unit is busy of not
    val op = UInt(8.W) // operation to perform in the unit
    val rd = UInt(log2Ceil(rfSets).W) // destination register
    val rs1 = UInt(log2Ceil(rfSets).W) // source registers 0
    val rs2 = UInt(log2Ceil(rfSets).W) // source registers 1
    val gen_rs1 = UInt(FU_WIDTH.W) // functional unit producing fj
    val gen_rs2 = UInt(FU_WIDTH.W) // functional unit producing fk
    val rs1_ready = Bool() // when rs1 are ready or not yet read. set to NO after operands are read.
    val rs2_ready = Bool() // when rs2 are ready or not yet read. set to NO after operands are read.
}

class ScoreboardRegStatus(nrFu: Int)(implicit val p: Parameters) extends MyBundle {
    val status = Vec(rfSets, UInt(log2Ceil(nrFu).W))
}

class FuWriteBundle(nrFu: Int)(implicit val p: Parameters) extends MyBundle {
    val fuId = UInt(log2Ceil(nrFu).W)
    val op = UInt(8.W) // operation to perform in the unit
    val rd = UInt(log2Ceil(rfSets).W) // destination register
    val rs1 = UInt(log2Ceil(rfSets).W) // source registers 0
    val rs2 = UInt(log2Ceil(rfSets).W) // source registers 1
}

class FuReadBundle()(implicit val p: Parameters) extends MyBundle {
    val gen_rs1 = UInt(FU_WIDTH.W) // functional unit producing fj
    val gen_rs2 = UInt(FU_WIDTH.W) // functional unit producing fk
    val rs1_ready = Bool() // when rs1 are ready or not yet read. set to NO after operands are read.
    val rs2_ready = Bool() // when rs2 are ready or not yet read. set to NO after operands are read.
}

class ScoreboardIO(nrFu: Int)(implicit val p: Parameters) extends MyBundle {
    val issue = Flipped(Decoupled(new FuWriteBundle(nrFu)))
    val readOpr = Vec(nrFu, Flipped(Decoupled()))
    val execute = Vec(nrFu, Input(Bool()))
    val writeback = Vec(nrFu, Flipped(Decoupled()))
    // val wbReady = Vec(nrFu, Output(Bool()))
}
class Scoreboard(nrFu: Int)(implicit val p: Parameters) extends MyModule {
    val io = IO(new ScoreboardIO(nrFu))

    val fuStatus = Seq.fill(nrFu)(RegInit(0.U.asTypeOf(new ScoreboardEntries())))
    val regStatus = RegInit(0.U.asTypeOf(new ScoreboardRegStatus(nrFu)))

    val fuBusy = WireInit(VecInit(fuStatus.map{f => f.busy}))
    
    // Write After Write hazard
    val wawRd = Cat(fuStatus.map(f => f.rd === io.issue.bits.rd && f.busy && f.rd =/= 0.U )).orR
    io.issue.ready := (!wawRd || wawRd && io.issue.bits.fuId === ALU) && io.issue.valid && !fuBusy(io.issue.bits.fuId)

    // Read After Write hazard for rs1, rs2 (true dependency)
    val rawRs1 = Wire(Vec(nrFu, Bool()))
    val rawRs2 = Wire(Vec(nrFu, Bool()))
    val rawRs1_1 = Wire(Vec(nrFu, Bool())) // work when issue req is fired
    val rawRs2_1 = Wire(Vec(nrFu, Bool()))

    rawRs1_1.foreach(_:=false.B)
    rawRs2_1.foreach(_:=false.B)


    for(i <- 0 until nrFu) {
        // rawRs1(i) := Cat(fuStatus.zipWithIndex.map{ case (f, j) => if( j != i) f.rd === fuStatus(i).rs1 && f.busy else false.B}).orR
        // rawRs2(i) := Cat(fuStatus.zipWithIndex.map{ case (f, j) => if( j != i) f.rd === fuStatus(i).rs2 && f.busy else false.B}).orR
        rawRs1(i) := Cat(fuStatus.zipWithIndex.filter(_._2 != i).map{ case (f, _) =>  f.rd === fuStatus(i).rs1 && f.busy && f.rd =/= 0.U }).orR
        rawRs2(i) := Cat(fuStatus.zipWithIndex.filter(_._2 != i).map{ case (f, _) =>  f.rd === fuStatus(i).rs2 && f.busy && f.rd =/= 0.U }).orR
        fuStatus(i).rs1_ready := Mux(rawRs1(i), false.B, true.B)
        fuStatus(i).rs2_ready := Mux(rawRs2(i), false.B, true.B)

        when(io.issue.bits.fuId === FUs(i) && io.issue.fire) {
            fuStatus(i).busy := true.B
            fuStatus(i).op := io.issue.bits.op
            fuStatus(i).rd := io.issue.bits.rd
            fuStatus(i).rs1 := io.issue.bits.rs1
            fuStatus(i).rs2 := io.issue.bits.rs2

            val matchRs1OH = Cat(fuStatus.map{f => f.rd === io.issue.bits.rs1 && f.busy && f.rd =/= 0.U }.reverse)
            val matchRs2OH = Cat(fuStatus.map{f => f.rd === io.issue.bits.rs2 && f.busy && f.rd =/= 0.U }.reverse)
            assert(PopCount(matchRs1OH) <= 1.U, "error matchRs1OH has multiple hot bit")
            assert(PopCount(matchRs2OH) <= 1.U, "error matchRs2OH has multiple hot bit")
            fuStatus(i).gen_rs1 := Mux1H(matchRs1OH, FUs)
            fuStatus(i).gen_rs2 := Mux1H(matchRs2OH, FUs)

            // rawRs1_1(i) := Cat(fuStatus.zipWithIndex.map{ case (f, j) => if( j != i) f.rd === io.issue.bits.rs1 && f.busy else false.B}).orR
            // rawRs2_1(i) := Cat(fuStatus.zipWithIndex.map{ case (f, j) => if( j != i) f.rd === io.issue.bits.rs2 && f.busy else false.B}).orR
            rawRs1_1(i) := Cat(fuStatus.zipWithIndex.filter(_._2 != i).map{ case (f, _) => f.rd === io.issue.bits.rs1 && f.busy}).orR
            rawRs2_1(i) := Cat(fuStatus.zipWithIndex.filter(_._2 != i).map{ case (f, _) => f.rd === io.issue.bits.rs2 && f.busy}).orR
            fuStatus(i).rs1_ready := Mux(rawRs1_1(i), false.B, true.B)
            fuStatus(i).rs2_ready := Mux(rawRs2_1(i), false.B, true.B)
        }
        
        regStatus.status.zipWithIndex.foreach{
            case(r, id) => 
                when(fuStatus(i).rd === id.U && fuStatus(i).rd =/= 0.U && fuStatus(i).busy) {
                    r := FUs(i)
                }
        }

        dontTouch(fuStatus(i))
    }
    
    // Read After Write hazard (true dependency)
    for(i <- 0 until nrFu) {
        io.readOpr(i).ready := fuStatus(i).rs1_ready && fuStatus(i).rs2_ready && fuStatus(i).busy && io.readOpr(i).valid
    }


    for(i <- 0 until nrFu) {
        when(io.execute(i)) {
            fuStatus(i).rs1_ready := false.B // already read operands
            fuStatus(i).rs2_ready := false.B
        }
    }

    // Write After Read hazard
    val warRd = Wire(Vec(nrFu, Bool()))

    for(i <- 0 until nrFu) {
        // warRd(i) := Cat(fuStatus.zipWithIndex.map{ case (f, j) => 
        //     if(j != i) ((f.rs1 === fuStatus(i).rd && f.rs1_ready) || (f.rs2 === fuStatus(i).rd && f.rs2_ready)) && f.busy
        //     else false.B
        // }).orR && fuStatus(i).busy

        warRd(i) := Cat(fuStatus.zipWithIndex.filter(_._2 != i).map{ case (f, _) => 
            ((f.rs1 === fuStatus(i).rd && f.rs1_ready) || (f.rs2 === fuStatus(i).rd && f.rs2_ready)) && f.busy && f.rd =/= 0.U 
        }).orR && fuStatus(i).busy

        io.writeback(i).ready := io.writeback(i).valid && !warRd(i)

        when(io.writeback(i).fire) {
            fuStatus(i).busy := false.B
        }

        // io.wbReady(i) := !warRd(i)
        // when(io.wbReady(i)) {
        //     fuStatus(i).busy := false.B
        // }
    }
}

object ScoreboardGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the Scoreboard hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Scoreboard(3)(defaultConfig), Array("--target-dir", "build"))
}


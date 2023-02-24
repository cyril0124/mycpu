package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class HazardUnitIO()(implicit val p: Parameters) extends MyBundle{
    val in = new Bundle{
        val execute = Flipped(new ExecuteHazardOutBundle)
        val memory = Flipped(new MemoryHazardBundle)
        val writeback = Flipped(new WritebackHazardBundle)
    }
    val out = Flipped(new ExecuteHazardInBundle)
}

class HazardUnit()(implicit val p: Parameters) extends MyModule{
    val io = IO(new HazardUnitIO)

    val rs1E = io.in.execute.rs1
    val rs2E = io.in.execute.rs2
    val rdM = io.in.memory.rd
    val rdW = io.in.writeback.rd
    val rdValM = io.in.memory.rdVal
    val rdValW = io.in.writeback.rdVal
    val regWrEnM = io.in.memory.regWrEn
    val regWrEnW = io.in.writeback.regWrEn

    /* solve data dependency hazard on execute stage */
    // forward rdValM from memory stage to execute stage for rs1E
    val fwMem2ExeRs1 = (rs1E === rdM) && regWrEnM && rdM =/= 0.U
    // forward rdValM from memory stage to execute stage for rs2E
    val fwMem2ExeRs2 = (rs2E === rdM) && regWrEnM && rdM =/= 0.U

    // forward rdValW from writeback stage to execute stage for rs1E
    val fwWb2ExeRs1 = (rs1E === rdW) && regWrEnW && rdW =/= 0.U
    // forward rdValW from writeback stage to execute stage for rs2E
    val fwWb2ExeRs2 = (rs2E === rdW) && regWrEnW && rdW =/= 0.U

    // default 
    io.out.aluSrc1 := "b00".U
    io.out.aluSrc2 := "b00".U
    
    when( fwWb2ExeRs1 ) {
        io.out.aluSrc1 := "b10".U
    }
    when( fwWb2ExeRs2 ) {
        io.out.aluSrc2 := "b10".U
    }

    // memory stage has higher priority
    when( fwMem2ExeRs1 ) {
        io.out.aluSrc1 := "b01".U // TODO: replace this whith ENUM, increase code readability
    }
    when( fwMem2ExeRs2 ) {
        io.out.aluSrc2 := "b01".U
    }



    io.out.rdValM := rdValM
    io.out.rdValW := rdValW
}

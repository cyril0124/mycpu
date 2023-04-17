package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.experimental.ChiselEnum

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.Control._
import mycpu.common.consts.LsuOp._
import mycpu.common.consts.AluOp._

class Core_1IO()(implicit val p: Parameters) extends MyBundle {
    val readValid = Input(Bool())
    val readAddr = Input(UInt(xlen.W))
    val flush = Input(Bool())
    val ibOutReady = Input(Bool())
    val brTaken = Input(Bool())
    val brAddr = Input(UInt(xlen.W))
}

class Core_1()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Core_1IO)

    val ib = Module(new InstBuffer)
    dontTouch(ib.io)
    val icache = Module(new ICache()(p.alterPartial(
        {
            case MyCpuParamsKey => MyCpuParameters(
                simulation = simulation,
                dcacheSets = 128,
                dcacheWays = 8,
                dcacheBlockSize = 8,
                busBeatSize = busBeatSize,
                logEnable = logEnable,
            )
        }
    )))

    val fetch_valid = Wire(Bool())
    val dec_valid, dec_ready = Wire(Bool())
    val issue_valid, issue_ready = Wire(Bool())

    // --------------------------------------------------------------------------------
    // Fetch stage
    // --------------------------------------------------------------------------------
    val pcReg = RegInit(resetPc.U(xlen.W))
    val pcNext = Wire(UInt(xlen.W))
    val pcNext4 = pcReg + (icacheRdWays*(ilen/8)).U
    val fetch_fire = fetch_valid

    val firstFire    = RegEnable(false.B, true.B, icache.io.read.req.fire)
    val preFetchInst = (firstFire && pcReg === resetPc.U) || (!firstFire && (fetch_fire || io.brTaken))

    icache.io.read.req.valid := preFetchInst
    icache.io.read.req.bits.addr := Mux(icache.io.read.req.fire, Mux(firstFire, pcReg, pcNext), Mux(io.brTaken, io.brAddr, pcReg))
    
    dontTouch(icache.io)

    when(icache.io.read.req.fire && !firstFire) { 
        pcReg := pcNext
    }

    pcNext := Mux(io.brTaken, io.brAddr, pcNext4)
    
    icache.io.read.resp.ready := true.B
    fetch_valid := icache.io.read.resp.valid

    // --------------------------------------------------------------------------------
    // Instruction Buffer
    // --------------------------------------------------------------------------------
    ib.io.icache.valid := fetch_valid
    ib.io.icache.bits := icache.io.read.resp.bits
    ib.io.flush := io.flush || io.brTaken // TODO:
    ib.io.out.ready := dec_ready
    
    // --------------------------------------------------------------------------------
    // Decode stage
    // --------------------------------------------------------------------------------
    val dec_latch = ib.io.out.valid && dec_ready
    val dec_full = RegInit(false.B)
    val dec_fire = dec_valid //&& issue_ready
    val dec_inst = RegEnable(ib.io.out.bits, dec_latch)
    
    dec_ready := !dec_full || dec_fire
    when(dec_latch) { dec_full := true.B }
    .elsewhen(dec_full && dec_fire) { dec_full := false.B }

    val dec_decoders = Seq.fill(icacheRdWays)(Module(new Decoder_1))
    val dec_decodeSigs = Seq.fill(icacheRdWays)(WireInit(0.U.asTypeOf(new DecodeSigs_1)))
    for(i <- 0 until icacheRdWays) {
        dec_decoders(i).io.inst := dec_inst(i).inst
        dec_decodeSigs(i) := dec_decoders(i).io.out 

        dontTouch(dec_decoders(i).io)
        dontTouch(dec_decodeSigs(i))
    }
    

    dec_valid := RegNext(dec_latch) || dec_full

    // TODO: Insert Buffer

    // --------------------------------------------------------------------------------
    // Issue stage 
    // --------------------------------------------------------------------------------
    val issue_latch = dec_valid && issue_ready
    val issue_fire = Wire(Bool())
    val issue_full = RegInit(false.B)

    val issue_decodeSigs = Reg(Vec(icacheRdWays, new DecodeSigs_1))
    val issue_instValid = RegEnable(Cat(dec_inst.map{d => d.valid}).asUInt, issue_latch)
    val issue_inst = RegEnable(Cat(dec_inst.map{d => d.inst}).asUInt, issue_latch)

    val issue_instSize = PopCount(issue_instValid) - 1.U

    val issue_instFire = Wire(Bool())
    val issue_ptr = RegInit(0.U(log2Ceil(icacheRdWays).W))
    for(i <- 0 until icacheRdWays) {
        when(issue_latch) {
            issue_decodeSigs(i) := dec_decodeSigs(i)
        }
    }


    issue_ready := !issue_full || issue_fire

    when(issue_latch) { issue_full := true.B }
    .elsewhen(issue_full && issue_fire) { issue_full := false.B}


    issue_valid := issue_ptr === issue_instSize
    when(issue_instFire) {
        issue_ptr := issue_ptr + 1.U
    }

    issue_fire := issue_valid

    issue_instFire := true.B
    MultiDontTouch(issue_latch, issue_fire, issue_decodeSigs, issue_instValid, issue_ptr)

    // in-order issue
    val aluValid = issue_decodeSigs(issue_ptr).aluOp =/= ALU_NOP
    val bruValid = issue_decodeSigs(issue_ptr).brType =/= BR_NOP
    val lsuValid = issue_decodeSigs(issue_ptr).lsuOp =/= LSU_NOP
    assert(PopCount(VecInit(Seq(aluValid, bruValid, lsuValid))) <= 1.U, "more than one op valid!")

    // --------------------------------------------------------------------------------
    // ALU stage
    // --------------------------------------------------------------------------------
    // val alu_






    val xbar = Module(new TLXbar)
    val rom = Module(new SingleROM)
    xbar.io <> DontCare
    icache.io.tlbus.req <> xbar.io.masterFace.in(0)
    icache.io.tlbus.resp <> xbar.io.masterFace.out(0)
    rom.io.req <> xbar.io.slaveFace.in(0)
    rom.io.resp <> xbar.io.slaveFace.out(0)
}
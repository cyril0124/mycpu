package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.experimental.ChiselEnum
import chisel3.util.experimental.BoringUtils

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.Control._
import mycpu.common.consts.LsuOp._
import mycpu.common.consts.AluOp._
import firrtl.Utils


class EdgeDetect(typ: String = "faling") extends Module{
    val io = IO(new Bundle{
        val in = Input(Bool())
        val change = Output(Bool())
    })

    val reg = RegInit(false.B)
    val prev = RegNext(io.in)

    reg := prev
    if(typ == "faling")
        io.change := prev && !io.in
    else if(typ == "rising")
        io.change := !prev && io.in
}

class Core_1IO()(implicit val p: Parameters) extends MyBundle {
    val in = new Bundle{
                val start = Input(Bool())
            }
    val out = new Bundle{
                val state = Output(new CoreState)
            }
}

class Core_1()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Core_1IO)
    io <> DontCare
    dontTouch(io)

    val ib = Module(new InstBuffer) // TODO: Optimize code architecture of InstBuffer(too messy for now)
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
    val rf = Module(new RegFile2(UInt(xlen.W)))
    rf.io.r <> DontCare
    rf.io.w <> DontCare

    val aluStage = Module(new ALUStage)
    val bruStage = Module(new BRUStage)
    val lsuStage = Module(new LSUStage)

    val fetch_valid = Wire(Bool())
    // val fetch_valid, fetch_ready = Wire(Bool())
    val dec_valid, dec_ready = Wire(Bool())
    val issue_valid, issue_ready = Wire(Bool())
    
    val bruBrTaken = WireInit(false.B)
    val bruBrAddr = WireInit(0.U(xlen.W))

    // --------------------------------------------------------------------------------
    // Fetch stage
    // --------------------------------------------------------------------------------
    val pcReg = RegInit(resetPc.U(xlen.W))
    val pcNext = Wire(UInt(xlen.W))
    val step = icacheRdWays * ( ilen / 8 )
    val isAlignAddr = ~Cat( pcReg(log2Ceil(step)-1, 0) & Fill(log2Ceil(step), 1.U) ).orR // TODO:
    val lastPc = RegEnable(icache.io.read.req.bits.addr, icache.io.read.req.fire)
    val pcNext4 = Mux(isAlignAddr, 
                        pcReg + step.U, 
                        lastPc + ( ( step.U - lastPc(log2Ceil(step)-1, 0) ) >> 2 << 2) // fix unalign address
                    ) 

    val fetch_instValid = RegInit(false.B)
    val fetch_fire = fetch_valid || fetch_instValid
    
    when(icache.io.read.resp.fire) { fetch_instValid := true.B }
    .elsewhen(fetch_instValid && icache.io.read.req.fire) { fetch_instValid := false.B }
    
    val edgeBackPressure = Module(new EdgeDetect("faling"))
    edgeBackPressure.io.in := ib.io.status.back_pressure
    
    val firstFire    = RegEnable(false.B, true.B, icache.io.read.req.fire)
    
    val fetch_pendingBranch = Module(new Queue(UInt(xlen.W), 4, flow = true))
    fetch_pendingBranch.io.enq.bits := bruStage.io.out.bits.brAddr
    fetch_pendingBranch.io.enq.valid := bruStage.io.out.fire && bruStage.io.out.bits.brTaken
    fetch_pendingBranch.io.deq.ready := icache.io.read.req.ready
    val brTaken = fetch_pendingBranch.io.deq.fire
    val brAddr = fetch_pendingBranch.io.deq.bits

    // val bruBrTaken = bruStage.io.out.bits.brTaken && bruStage.io.out.valid
    // val bruBrAddr = bruStage.io.out.bits.brAddr
    // fetch_ready := icache.io.read.req.ready
    val preFetchInst = (firstFire && pcReg === resetPc.U) || 
                        (!firstFire && (
                                (fetch_fire || edgeBackPressure.io.change) && !ib.io.status.back_pressure ||
                                brTaken && !ib.io.status.full // TODO: how if ib.io.full and bruBrTaken ?
                            )
                        )

    // Send icache request
    icache.io.read.req.valid := preFetchInst && io.in.start
    icache.io.read.req.bits.addr := Mux(icache.io.read.req.fire, Mux(firstFire, pcReg, pcNext), Mux(brTaken, brTaken, pcReg))
    icache.io.read.resp.ready := true.B
    icache.io.flush := brTaken

    // Update PC register
    when(icache.io.read.req.fire && !firstFire) { 
        pcReg := pcNext
    }
    pcNext := Mux(brTaken, brAddr, pcNext4)
    
    fetch_valid := icache.io.read.resp.valid
    // --------------------------------------------------------------------------------
    // Instruction Buffer
    // --------------------------------------------------------------------------------
    val blockAddr = RegEnable(bruBrAddr, bruBrTaken)
    val blockValid = RegInit(false.B)
    val willBlock = bruBrTaken && icache.io.read.resp.bits.addr =/= bruBrAddr
    val willWakeUp = blockValid && icache.io.read.resp.valid && icache.io.read.resp.bits.addr === blockAddr
    when(willBlock) { blockValid := true.B }
    .elsewhen(willWakeUp) { blockValid := false.B}

    ib.io.in.valid := fetch_valid && (!blockValid || willWakeUp)
    ib.io.in.bits.icache := icache.io.read.resp.bits
    ib.io.in.bits.pc := icache.io.read.resp.bits.addr
    ib.io.in.bits.flush := bruBrTaken
    ib.io.out.ready := dec_ready
    
    // --------------------------------------------------------------------------------
    // Decode stage
    // --------------------------------------------------------------------------------
    val dec_latch = ib.io.out.valid && dec_ready
    val dec_full = RegInit(false.B)
    val dec_fire = dec_valid && issue_ready
    val dec_inst = RegEnable(ib.io.out.bits.inst, dec_latch)
    val dec_pc = RegEnable(ib.io.out.bits.pc, dec_latch)
    val dec_flush = bruBrTaken
    
    // Pipeline handshake
    dec_ready := !dec_full || dec_fire
    when(dec_latch) { dec_full := true.B }
    .elsewhen(dec_full && dec_fire) { dec_full := false.B }

    // Instruction decode
    val dec_decoders = Seq.fill(icacheRdWays)(Module(new Decoder_1))
    val dec_decodeSigs = Seq.fill(icacheRdWays)(WireInit(0.U.asTypeOf(new DecodeSigs_1)))
    for(i <- 0 until icacheRdWays) {
        dec_decoders(i).io.inst := dec_inst(i).inst
        dec_decodeSigs(i) := dec_decoders(i).io.out 

        dontTouch(dec_decoders(i).io)
        dontTouch(dec_decodeSigs(i))
    }
    

    dec_valid := (RegNext(dec_latch) || dec_full) && !dec_flush

    when(dec_flush) {
        dec_full := false.B
        dec_inst.foreach( d => d.valid := false.B )
    }

    // TODO: Insert Buffer(Queue, FIFO)

    // --------------------------------------------------------------------------------
    // Issue stage 
    // --------------------------------------------------------------------------------
    // Pipeline handshake reletive signals
    val issue_latch = dec_valid && issue_ready
    val issue_fire = issue_valid // indicate that all of the instrcution are issued
    val issue_full = RegInit(false.B)
    // Pipeline data signals
    val issue_pc = RegEnable(dec_pc, issue_latch)
    val issue_decodeSigs = Reg(Vec(icacheRdWays, new DecodeSigs_1))
    val issue_instValid = RegEnable(Cat(dec_inst.map{d => d.valid}).asUInt, issue_latch)
    val issue_inst = Reg(Vec(icacheRdWays, UInt(ilen.W))) 
    val issue_instSize = PopCount(issue_instValid) - 1.U
    val issue_instFire = Wire(Bool())
    val issue_ptr = RegInit(0.U(log2Ceil(icacheRdWays).W))
    val issue_flush = bruBrTaken
    for(i <- 0 until icacheRdWays) {
        when(issue_latch) {
            issue_decodeSigs(i) := dec_decodeSigs(i)
            issue_inst(i) := dec_inst(i).inst
        }
    }

    // Pipeline handshake
    issue_ready := !issue_full || issue_fire
    when(issue_latch) { issue_full := true.B }
    .elsewhen(issue_full && issue_fire) { issue_full := false.B}

    
    // Select valid instruction that will be issue later
    issue_valid := ( issue_ptr === issue_instSize && issue_instFire ) && !issue_flush
    when(issue_instFire) {
        issue_ptr := issue_ptr + 1.U
    }
    issue_instFire := aluStage.io.in.fire || bruStage.io.in.fire || lsuStage.io.in.fire //! indicate that one instruction are issued

    val issue_chosenDecodesigs = Mux1H(UIntToOH(issue_ptr), issue_decodeSigs)
    val issue_chosenInst = Mux1H(UIntToOH(issue_ptr), issue_inst) 

    when(issue_flush) {
        issue_full := false.B
        issue_ptr := 0.U
    }
    
    val decOpr1 = issue_chosenDecodesigs.opr1
    val decOpr2 = issue_chosenDecodesigs.opr2
    val rs1 = InstField(issue_chosenInst, "rs1")
    val rs2 = InstField(issue_chosenInst, "rs2")
    val issue_rs1 = Mux(decOpr1 === OPR_REG1, rs1, 0.U)
    val issue_rs2 = Mux(decOpr2 === OPR_REG2, rs2, 0.U)
    val issue_rd = InstField(issue_chosenInst, "rd")


    // Functional Unit issue valid signals
    val issue_aluValid = issue_chosenDecodesigs.aluOp =/= ALU_NOP
    val issue_bruValid = issue_chosenDecodesigs.brType =/= BR_NOP
    val issue_lsuValid = issue_chosenDecodesigs.lsuOp =/= LSU_NOP
    assert(((PopCount(VecInit(Seq(issue_aluValid, issue_bruValid, issue_lsuValid))) <= 1.U && issue_full) || !issue_full), 
            cf"more than one op valid! ${issue_aluValid} ${issue_bruValid} ${issue_lsuValid} inst=> ${Hexadecimal(issue_chosenInst)} aluOp=> ${issue_chosenDecodesigs.aluOp} lsuOp=> ${issue_chosenDecodesigs.lsuOp}"
        )

    // Read scoreboard info before issue an instruction in case of WAW hazard
    import mycpu.FUType._
    val scoreboard = Module(new Scoreboard(3))
    scoreboard.io <> DontCare
    dontTouch(scoreboard.io)
    scoreboard.io.issue.valid := (issue_aluValid || issue_bruValid || issue_lsuValid) && issue_full
    scoreboard.io.issue.bits.fuId := MuxCase(ALU, Seq(
                                            issue_aluValid -> ALU,
                                            issue_bruValid -> BRU,
                                            issue_lsuValid -> LSU,
                                        ))
    scoreboard.io.issue.bits.op := MuxCase(ALU_ADD, Seq(
                                            issue_aluValid -> issue_chosenDecodesigs.aluOp,
                                            issue_bruValid -> issue_chosenDecodesigs.brType,
                                            issue_lsuValid -> issue_chosenDecodesigs.lsuOp,
                                        ))
    scoreboard.io.issue.bits.rs1 := issue_rs1
    scoreboard.io.issue.bits.rs2 := issue_rs2
    scoreboard.io.issue.bits.rd  := issue_rd

    scoreboard.io.flush := bruBrTaken

    val csrIssue = Module(new CircularShiftRegister(3, 0x5))
    val issueID = csrIssue.io.out
    csrIssue.io <> DontCare
    csrIssue.io.shiftLeft := issue_instFire
    csrIssue.io.reset := bruBrTaken


    val csrCommit = Module(new CircularShiftRegister(3, 0x5))
    val commitID = csrCommit.io.out
    csrCommit.io <> DontCare
    csrCommit.io.shiftLeft := aluStage.io.out.fire || bruStage.io.out.fire || lsuStage.io.out.fire
    csrCommit.io.reset := bruBrTaken

    // --------------------------------------------------------------------------------
    // ALU stage
    // --------------------------------------------------------------------------------
    aluStage.io.in.bits.id := issueID
    aluStage.io.in.bits.pc := issue_pc + (issue_ptr << 2)
    aluStage.io.in.bits.aluOp := issue_chosenDecodesigs.aluOp
    aluStage.io.in.bits.immSign := issue_chosenDecodesigs.immSign
    aluStage.io.in.bits.inst := issue_chosenInst
    aluStage.io.in.bits.opr1 := issue_chosenDecodesigs.opr1
    aluStage.io.in.bits.opr2 := issue_chosenDecodesigs.opr2
    aluStage.io.in.valid := issue_aluValid & scoreboard.io.issue.fire
    aluStage.io.rfRd(0) <> rf.io.r(0)
    aluStage.io.rfRd(1) <> rf.io.r(1)
    aluStage.io.rfRdReady := scoreboard.io.readOpr(ALU).ready
    aluStage.io.out.ready := scoreboard.io.writeback(ALU).ready && (aluStage.io.out.bits.id === commitID)
    scoreboard.io.readOpr(ALU).valid := aluStage.io.rfRd(0).en
    scoreboard.io.execute(ALU) := RegNext(scoreboard.io.readOpr(ALU).fire)
    scoreboard.io.writeback(ALU).valid := aluStage.io.out.valid

    aluStage.io.flush := bruBrTaken


    // --------------------------------------------------------------------------------
    // BRU stage
    // --------------------------------------------------------------------------------
    bruStage.io.in.bits.id := issueID
    bruStage.io.in.bits.pc := issue_pc + (issue_ptr << 2)
    bruStage.io.in.bits.bruOp := issue_chosenDecodesigs.brType
    bruStage.io.in.bits.immSrc := issue_chosenDecodesigs.immSrc
    bruStage.io.in.bits.inst := issue_chosenInst
    bruStage.io.in.bits.opr1 := issue_chosenDecodesigs.opr1
    bruStage.io.in.bits.opr2 := issue_chosenDecodesigs.opr2
    bruStage.io.in.valid := issue_bruValid & scoreboard.io.issue.fire
    bruStage.io.rfRd(0) <> rf.io.r(2)
    bruStage.io.rfRd(1) <> rf.io.r(3)
    bruStage.io.rfRdReady := scoreboard.io.readOpr(BRU).ready
    bruStage.io.out.ready := scoreboard.io.writeback(BRU).ready && fetch_pendingBranch.io.enq.ready && (bruStage.io.out.bits.id === commitID)
    // bruStage.io.out.ready := scoreboard.io.writeback(BRU).ready && (fetch_ready && bruStage.io.out.bits.brTaken ) //|| !bruStage.io.out.bits.brTaken)
    scoreboard.io.readOpr(BRU).valid := bruStage.io.rfRd(0).en
    scoreboard.io.execute(BRU) := RegNext(scoreboard.io.readOpr(BRU).fire)
    scoreboard.io.writeback(BRU).valid := bruStage.io.out.valid

    bruStage.io.flush := bruBrTaken

    bruBrTaken := bruStage.io.out.fire && bruStage.io.out.bits.brTaken
    bruBrAddr := bruStage.io.out.bits.brAddr


    // --------------------------------------------------------------------------------
    // LSU stage
    // --------------------------------------------------------------------------------
    lsuStage.io.in.bits.id := issueID
    lsuStage.io.in.bits.pc := issue_pc + (issue_ptr << 2)
    lsuStage.io.in.bits.lsuOp := issue_chosenDecodesigs.lsuOp
    lsuStage.io.in.bits.immSrc := issue_chosenDecodesigs.immSrc
    lsuStage.io.in.bits.inst := issue_chosenInst
    lsuStage.io.in.bits.opr1 := issue_chosenDecodesigs.opr1
    lsuStage.io.in.bits.opr2 := issue_chosenDecodesigs.opr2
    lsuStage.io.in.valid := issue_lsuValid & scoreboard.io.issue.fire
    lsuStage.io.rfRd(0) <> rf.io.r(4)
    lsuStage.io.rfRd(1) <> rf.io.r(5)
    lsuStage.io.rfRdReady := scoreboard.io.readOpr(LSU).ready
    lsuStage.io.out.ready := scoreboard.io.writeback(LSU).ready && (lsuStage.io.out.bits.id === commitID)
    scoreboard.io.readOpr(LSU).valid := lsuStage.io.rfRd(0).en
    scoreboard.io.execute(LSU) := RegNext(scoreboard.io.readOpr(LSU).fire)
    scoreboard.io.writeback(LSU).valid := lsuStage.io.out.valid

    lsuStage.io.flush := bruBrTaken

    val dcache = Module(new DCache)
    lsuStage.io.cache.read <> dcache.io.read
    lsuStage.io.cache.write <> dcache.io.write


    // Read RegFile
    rf.io.w(0).en := aluStage.io.out.fire
    rf.io.w(0).addr := aluStage.io.out.bits.rd
    rf.io.w(0).data := aluStage.io.out.bits.data

    rf.io.w(1).en := bruStage.io.out.fire && bruStage.io.out.bits.wrEn
    rf.io.w(1).addr := bruStage.io.out.bits.rd
    rf.io.w(1).data := bruStage.io.out.bits.data

    rf.io.w(2).en := lsuStage.io.out.fire && lsuStage.io.out.bits.wrEn
    rf.io.w(2).addr := lsuStage.io.out.bits.rd
    rf.io.w(2).data := lsuStage.io.out.bits.data

    val rfw = rf.io.w
    val rfWrVec = Cat(rf.io.w.map(w => w.en).reverse)
    assert(PopCount(rfWrVec) <= 1.U, cf"Write multiple reg at the same time! alu:${rfw(0)} bru:${rfw(1)} lsu:${rfw(2)}" )

    // Instruction Commit
    val instCommitVec = Cat(Seq(aluStage.io.out.fire, bruStage.io.out.fire, lsuStage.io.out.fire).reverse)
    assert(PopCount(instCommitVec) <= 1.U, cf"Commit multiple inst at the same time! alu:${instCommitVec(0)} bru:${instCommitVec(1)} lsu:${instCommitVec(2)}" )
    dontTouch(instCommitVec)

    val instState = Wire(new InstState)
    instState.commit := instCommitVec.orR
    instState.inst := Mux1H(instCommitVec, Seq(aluStage.io.out.bits.inst, bruStage.io.out.bits.inst, lsuStage.io.out.bits.inst))
    instState.pc := Mux1H(instCommitVec, Seq(aluStage.io.out.bits.pc, bruStage.io.out.bits.pc, lsuStage.io.out.bits.pc))

    val regState = WireInit(0.U.asTypeOf(new RegFileState))
    BoringUtils.addSink(regState, "regState")

    io.out.state.instState <> RegNext(instState)
    io.out.state.intRegState <> regState
    

    // --------------------------------------------------------------------------------
    // Bus
    // --------------------------------------------------------------------------------
    val xbar = Module(new TLXbar)
    val rom = Module(new SingleROM)
    xbar.io <> DontCare
    icache.io.tlbus.req <> xbar.io.masterFace.in(0)
    icache.io.tlbus.resp <> xbar.io.masterFace.out(0)

    dcache.io.tlbus.req <> xbar.io.masterFace.in(1)
    dcache.io.tlbus.resp <> xbar.io.masterFace.out(1)

    rom.io.req <> xbar.io.slaveFace.in(0)
    rom.io.resp <> xbar.io.slaveFace.out(0)
}

object Core_1GenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = true,
            busBeatSize = 16,
            logEnable = false,
            rfRdPort = 6, // for three FUs we need total 6 rdport
            rfWrPort = 3,
        )
    })

    println("Generating the Core_1 hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Core_1()(defaultConfig), Array("--target-dir", "build"))
}

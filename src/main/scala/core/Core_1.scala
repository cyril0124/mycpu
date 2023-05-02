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
import mycpu.common.consts.CsrOp._
import mycpu.common.consts.ExceptType._
import mycpu.FUType._
import mycpu.common.Parameters._


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

class Core()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Core_1IO)
    io <> DontCare
    dontTouch(io)

    val ib = Module(new InstBuffer) // TODO: Optimize code architecture of InstBuffer(too messy for now)
    dontTouch(ib.io)
    val rf = Module(new RegFile2(UInt(xlen.W)))
    rf.io.r <> DontCare
    rf.io.w <> DontCare

    val robEntry = 12
    val aluRSEntry = 5
    val bruRSEntry = 5
    val lsuRSEntry = 5
    val csrRSEntry = 5
    val nrFu = 4
    val rob = Module(new ROB(robEntry, nrFu))

    val aluStage_1 = Module(new ALUStage_1)
    val aluRS = Module(new ReservationStation(aluRSEntry, robEntry, nrFu))

    val bruStage_1 = Module(new BRUStage_1)
    val bruRS = Module(new ReservationStation(bruRSEntry, robEntry, nrFu))

    val lsuStage_1 = Module(new LSUStage_1)
    val lsuRS = Module(new ReservationStation(lsuRSEntry, robEntry, nrFu))

    val csrStage_1 = Module(new CSRStage_1)
    val csrRS = Module(new ReservationStation(csrRSEntry, robEntry, nrFu))


    // val fetch_valid = Wire(Bool())
    val dec_valid, dec_ready = Wire(Bool())
    val issue_valid, issue_ready = Wire(Bool())
    
    val bruBrTaken = WireInit(false.B)
    val bruBrAddr = WireInit(0.U(xlen.W))

    val csrExcpValid = WireInit(false.B)
    val csrExcpAddr = WireInit(0.U(xlen.W))

    val globalBrTaken = csrExcpValid || bruBrTaken
    val globalBrAddr = Mux(csrExcpValid, csrExcpAddr, bruBrAddr)
    val globalBrPC = rob.io.deq.bits.pc
    val globalPredictID = rob.io.deq.bits.predictID
    val globalPredictIdx = rob.io.deq.bits.predictIdx
    dontTouch(globalBrTaken)


    // --------------------------------------------------------------------------------
    // Instruction Fetch Unit
    // --------------------------------------------------------------------------------
    val ifu = Module(new IFU)
    ifu.io.start := io.in.start
    ifu.io.ib.backPressure := ib.io.status.backPressure
    ifu.io.redirect.valid := globalBrTaken
    ifu.io.redirect.bits.brTaken := rob.io.deq.bits.brTaken
    ifu.io.redirect.bits.pc := globalBrPC
    ifu.io.redirect.bits.targetAddr := globalBrAddr
    ifu.io.redirect.bits.way := globalPredictID
    ifu.io.redirect.bits.idx := globalPredictIdx
    
    ib.io.in <> ifu.io.output
    ib.io.flush := globalBrTaken || reset.asBool
    ib.io.out.ready := dec_ready

    // --------------------------------------------------------------------------------
    // Decode stage
    // --------------------------------------------------------------------------------
    val dec_latch = ib.io.out.valid && dec_ready
    val dec_full = RegInit(false.B)
    val dec_fire = dec_valid && issue_ready
    val dec_inst = RegEnable(ib.io.out.bits.inst, dec_latch)
    val dec_pc = RegEnable(ib.io.out.bits.pc, dec_latch)
    val dec_flush = globalBrTaken || reset.asBool
    
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
    

    dec_valid := dec_full && !dec_flush


    when(dec_flush) {
        dec_full := false.B
        dec_inst.foreach( d => d.valid := false.B )
    }

    // TODO: Instruction Queue 4 in 1 out
    // --------------------------------------------------------------------------------
    // Issue stage 
    // --------------------------------------------------------------------------------
    // Pipeline handshake reletive signals
    val issue_latch = dec_valid && issue_ready
    val issue_fire = issue_valid // indicate that all of the instrcution are issued
    val issue_full = RegInit(false.B)
    val issue_pc = RegEnable(dec_pc, issue_latch)
    val issue_decodeSigs = Reg(Vec(icacheRdWays, new DecodeSigs_1))
    val issue_instValid = RegEnable(Cat(dec_inst.map{d => d.valid}).asUInt, issue_latch)
    val issue_inst = Reg(Vec(icacheRdWays, UInt(ilen.W))) 
    val issue_predictBrTaken = Reg(Vec(icacheRdWays, Bool()))
    val issue_predictIdx = Reg(Vec(icacheRdWays, UInt(PRED_IDX_WIDTH.W)))
    val issue_instSize = PopCount(issue_instValid) - 1.U
    val issue_instFire = Wire(Bool())
    val issue_ptr = RegInit(0.U(log2Ceil(icacheRdWays).W))
    val issue_flush = globalBrTaken || reset.asBool
    for(i <- 0 until icacheRdWays) {
        when(issue_latch) {
            issue_decodeSigs(i) := dec_decodeSigs(i)
            issue_inst(i) := dec_inst(i).inst
            issue_predictBrTaken(i) := dec_inst(i).predictBrTaken
            issue_predictIdx(i) := dec_inst(i).predictIdx
        }
    }

    // Pipeline handshake
    issue_ready := !issue_full || issue_fire
    when(issue_latch) { issue_full := true.B }
    .elsewhen(issue_full && issue_fire) { issue_full := false.B}

    
    // Select valid instruction that will be issue later
    issue_valid := ( issue_ptr === issue_instSize && issue_instFire ) && !issue_flush
    when(issue_fire) { issue_ptr := 0.U }
    .elsewhen(issue_instFire) { issue_ptr := issue_ptr + 1.U }

    issue_instFire := rob.io.enq.fire 

    val issue_chosenDecodesigs = Mux1H(UIntToOH(issue_ptr), issue_decodeSigs)
    val issue_chosenInst = Mux1H(UIntToOH(issue_ptr), issue_inst)
    val issue_chosenPredictBrTaken = Mux1H(UIntToOH(issue_ptr), issue_predictBrTaken)
    val issue_chosenPredictIdx = Mux1H(UIntToOH(issue_ptr), issue_predictIdx)

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


    // Functional Unit issue valid signals
    val issue_aluValid = issue_chosenDecodesigs.aluOp =/= ALU_NOP && issue_full
    val issue_bruValid = issue_chosenDecodesigs.brType =/= BR_NOP && issue_full
    val issue_lsuValid = issue_chosenDecodesigs.lsuOp =/= LSU_NOP && issue_full
    val issue_csrValid = (issue_chosenDecodesigs.csrOp =/= CSR_NOP || issue_chosenDecodesigs.excpType =/= EXC_NONE) && issue_full
    assert(((PopCount(VecInit(Seq(issue_aluValid, issue_bruValid, issue_lsuValid, issue_csrValid))) <= 1.U && issue_full) || !issue_full), 
            cf"more than one op valid! ${issue_aluValid} ${issue_bruValid} ${issue_lsuValid} ${issue_csrValid} " +
            cf"inst=> ${Hexadecimal(issue_chosenInst)} " +
            cf"aluOp=> ${issue_chosenDecodesigs.aluOp} bruOp=> ${issue_chosenDecodesigs.brType} lsuOp=> ${issue_chosenDecodesigs.lsuOp} " +
            cf"csrOp=> ${issue_chosenDecodesigs.csrOp} excpType=> ${issue_chosenDecodesigs.excpType}"
        )

    val issue_stagePc = issue_pc + (issue_ptr << 2)
    dontTouch(issue_stagePc)

    // --------------------------------------------------------------------------------
    // Out-of-Order scheduler components
    // --------------------------------------------------------------------------------
    val rsReady = MuxCase(false.B, Seq(
                            issue_aluValid -> aluRS.io.enq.ready,
                            issue_bruValid -> bruRS.io.enq.ready,
                            issue_lsuValid -> lsuRS.io.enq.ready,
                            issue_csrValid -> csrRS.io.enq.ready,
                        ))
    rob.io.enq.valid := (issue_aluValid || issue_bruValid || issue_lsuValid || issue_csrValid) && issue_full && rsReady
    rob.io.enq.bits.fuOp := MuxCase(ALU_ADD, Seq(
                                            issue_aluValid -> issue_chosenDecodesigs.aluOp,
                                            issue_bruValid -> issue_chosenDecodesigs.brType,
                                            issue_lsuValid -> issue_chosenDecodesigs.lsuOp,
                                            issue_csrValid -> issue_chosenDecodesigs.csrOp,
                            ))
    rob.io.enq.bits.fuValid := Cat(VecInit(issue_aluValid, issue_bruValid, issue_lsuValid, issue_csrValid).reverse)
    rob.io.enq.bits.inst := issue_chosenInst
    rob.io.enq.bits.pc := issue_stagePc
    rob.io.enq.bits.predictBrTaken := issue_chosenPredictBrTaken
    rob.io.enq.bits.predictID := issue_ptr
    rob.io.enq.bits.predictIdx := issue_chosenPredictIdx
    val enq = rob.io.enq.bits
    val rd = InstField(issue_chosenInst, "rd")
    val invalidBRU = enq.fuValid(BRU) && (enq.fuOp =/= BR_JALR && enq.fuOp =/= BR_JAL)
    val invalidLSU = enq.fuValid(LSU) && (enq.fuOp === LSU_SW || enq.fuOp === LSU_SH || enq.fuOp === LSU_SB || enq.fuOp === LSU_FENC)
    val invalidRd = invalidBRU || invalidLSU || rd === 0.U
    val issue_rd = Mux(invalidRd, 0.U, rd)
    rob.io.enq.bits.rd := issue_rd
    rob.io.flush := globalBrTaken || reset.asBool

    // Reservation Station common input signals
    val rsInput = Wire(new RSInput)
    rsInput.ROBId := rob.io.id
    rsInput.excpType := issue_chosenDecodesigs.excpType
    rsInput.immSign := issue_chosenDecodesigs.immSign
    rsInput.immSrc := issue_chosenDecodesigs.immSrc
    rsInput.inst := issue_chosenInst
    rsInput.pc := issue_stagePc
    rsInput.op := MuxCase(ALU_ADD, Seq(
                                issue_aluValid -> issue_chosenDecodesigs.aluOp,
                                issue_bruValid -> issue_chosenDecodesigs.brType,
                                issue_lsuValid -> issue_chosenDecodesigs.lsuOp,
                                issue_csrValid -> issue_chosenDecodesigs.csrOp,
                ))
    rsInput.opr1 := issue_chosenDecodesigs.opr1
    rsInput.opr2 := issue_chosenDecodesigs.opr2
    rsInput.rs1 := issue_rs1
    rsInput.rs2 := issue_rs2
    rsInput.rd := issue_rd
    rsInput.rs1ROBId := rob.io.regStatus(issue_rs1).owner
    rsInput.rs2ROBId := rob.io.regStatus(issue_rs1).owner

    
    // ALU Stage RS
    aluRS.io.enq.valid := rob.io.enq.fire && issue_aluValid //&& issue_full
    aluRS.io.enq.bits := rsInput
    aluRS.io.regStatus := rob.io.regStatus
    aluRS.io.flush := globalBrTaken || reset.asBool
    aluRS.io.deq.ready := aluStage_1.io.in.ready
    // ALU Stage
    aluStage_1.io.in.valid := aluRS.io.deq.valid
    aluStage_1.io.in.bits.aluOp := aluRS.io.deq.bits.op
    aluStage_1.io.in.bits.immSrc := aluRS.io.deq.bits.immSrc
    aluStage_1.io.in.bits.immSign := aluRS.io.deq.bits.immSign
    aluStage_1.io.in.bits.inst := aluRS.io.deq.bits.inst
    aluStage_1.io.in.bits.pc := aluRS.io.deq.bits.pc
    aluStage_1.io.in.bits.opr1 := aluRS.io.deq.bits.opr1
    aluStage_1.io.in.bits.opr2 := aluRS.io.deq.bits.opr2
    aluStage_1.io.in.bits.id := aluRS.io.deq.bits.ROBId
    aluStage_1.io.in.bits.rs1Val := aluRS.io.deq.bits.rs1Val
    aluStage_1.io.in.bits.rs2Val := aluRS.io.deq.bits.rs2Val
    aluStage_1.io.flush := globalBrTaken || reset.asBool
    aluStage_1.io.out.ready := true.B


    // TODO: Multiple instruction issue
    // BRU Stage RS
    bruRS.io.enq.valid := rob.io.enq.fire && issue_bruValid
    bruRS.io.enq.bits := rsInput
    bruRS.io.regStatus := rob.io.regStatus
    bruRS.io.flush := globalBrTaken || reset.asBool
    bruRS.io.deq.ready := bruStage_1.io.in.ready
    // BRU Stage
    bruStage_1.io.in.valid := bruRS.io.deq.valid
    bruStage_1.io.in.bits.bruOp := bruRS.io.deq.bits.op
    bruStage_1.io.in.bits.immSrc := bruRS.io.deq.bits.immSrc
    bruStage_1.io.in.bits.inst := bruRS.io.deq.bits.inst
    bruStage_1.io.in.bits.pc := bruRS.io.deq.bits.pc
    bruStage_1.io.in.bits.opr1 := bruRS.io.deq.bits.opr1
    bruStage_1.io.in.bits.opr2 := bruRS.io.deq.bits.opr2
    bruStage_1.io.in.bits.id := bruRS.io.deq.bits.ROBId
    bruStage_1.io.in.bits.rs1Val := bruRS.io.deq.bits.rs1Val
    bruStage_1.io.in.bits.rs2Val := bruRS.io.deq.bits.rs2Val
    bruStage_1.io.flush := globalBrTaken || reset.asBool
    bruStage_1.io.out.ready := true.B


    // LSU Stage RS
    lsuRS.io.enq.valid := rob.io.enq.fire && issue_lsuValid
    lsuRS.io.enq.bits := rsInput
    lsuRS.io.regStatus := rob.io.regStatus
    lsuRS.io.flush := globalBrTaken || reset.asBool
    lsuRS.io.deq.ready := lsuStage_1.io.in.ready
    // LSU Stage
    lsuStage_1.io.in.valid := lsuRS.io.deq.valid
    lsuStage_1.io.in.bits.lsuOp := lsuRS.io.deq.bits.op
    lsuStage_1.io.in.bits.immSrc := lsuRS.io.deq.bits.immSrc
    lsuStage_1.io.in.bits.inst := lsuRS.io.deq.bits.inst
    lsuStage_1.io.in.bits.id := lsuRS.io.deq.bits.ROBId
    lsuStage_1.io.in.bits.rs1Val := lsuRS.io.deq.bits.rs1Val
    lsuStage_1.io.in.bits.rs2Val := lsuRS.io.deq.bits.rs2Val
    lsuStage_1.io.flush := globalBrTaken || reset.asBool
    lsuStage_1.io.out.ready := true.B
    // This is used to wake up Store instruction
    // Store instruction will send store req when Store instruction is on the top of ROB
    //      e.g.     jal x1, 0x12; sw x2, 0(x0)  
    lsuStage_1.io.rob.bits.id := rob.io.deq.bits.id
    lsuStage_1.io.rob.valid := true.B

    val dcache = Module(new DCache)
    dcache.io.flush := globalBrTaken
    lsuStage_1.io.cache.read <> dcache.io.read
    lsuStage_1.io.cache.write <> dcache.io.write


    // CSR Stage RS
    csrRS.io.enq.valid := rob.io.enq.fire && issue_csrValid
    csrRS.io.enq.bits := rsInput
    csrRS.io.regStatus := rob.io.regStatus
    csrRS.io.flush := globalBrTaken || reset.asBool
    csrRS.io.deq.ready := csrStage_1.io.in.ready
    // CSR Stage
    csrStage_1.io.in.valid := csrRS.io.deq.valid
    csrStage_1.io.in.bits.excpType := csrRS.io.deq.bits.excpType
    csrStage_1.io.in.bits.csrOp := csrRS.io.deq.bits.op
    csrStage_1.io.in.bits.inst := csrRS.io.deq.bits.inst
    csrStage_1.io.in.bits.id := csrRS.io.deq.bits.ROBId
    csrStage_1.io.in.bits.rs1Val := csrRS.io.deq.bits.rs1Val
    csrStage_1.io.in.bits.rs2Val := csrRS.io.deq.bits.rs2Val
    csrStage_1.io.flush := globalBrTaken || reset.asBool
    csrStage_1.io.out.ready := true.B

    
    // ROB Functional Unit connection 
    rob.io.fu(ALU).valid := aluStage_1.io.out.valid
    rob.io.fu(ALU).bits := DontCare
    rob.io.fu(ALU).bits.data := aluStage_1.io.out.bits.data
    rob.io.fu(ALU).bits.id := aluStage_1.io.out.bits.id
    rob.io.fu(ALU).bits.rd := aluStage_1.io.out.bits.rd
    rob.io.rs(ALU) <> aluRS.io.robOut
    
    rob.io.fu(BRU).valid := bruStage_1.io.out.valid
    rob.io.fu(BRU).bits := DontCare
    rob.io.fu(BRU).bits.data := bruStage_1.io.out.bits.data
    rob.io.fu(BRU).bits.id := bruStage_1.io.out.bits.id
    rob.io.fu(BRU).bits.rd := bruStage_1.io.out.bits.rd
    rob.io.fu(BRU).bits.brAddr := bruStage_1.io.out.bits.brAddr
    rob.io.fu(BRU).bits.brTaken := bruStage_1.io.out.bits.brTaken
    rob.io.rs(BRU) <> bruRS.io.robOut

    rob.io.fu(LSU).valid := lsuStage_1.io.out.valid
    rob.io.fu(LSU).bits := DontCare
    rob.io.fu(LSU).bits.data := lsuStage_1.io.out.bits.data
    rob.io.fu(LSU).bits.id := lsuStage_1.io.out.bits.id
    rob.io.fu(LSU).bits.rd := lsuStage_1.io.out.bits.rd
    rob.io.rs(LSU) <> lsuRS.io.robOut
    
    rob.io.fu(CSR).valid := csrStage_1.io.out.valid
    rob.io.fu(CSR).bits := DontCare
    rob.io.fu(CSR).bits.data := csrStage_1.io.out.bits.data
    rob.io.fu(CSR).bits.id := csrStage_1.io.out.bits.id
    rob.io.fu(CSR).bits.rd := csrStage_1.io.out.bits.rd
    rob.io.fu(CSR).bits.excpValid := csrStage_1.io.out.bits.excpValid
    rob.io.fu(CSR).bits.excpAddr := csrStage_1.io.out.bits.excpAddr
    rob.io.rs(CSR) <> csrRS.io.robOut

    rob.io.deq.ready := true.B

    // Common Data Bus
    val fuStageOutputVec = Seq(aluStage_1.io.out, bruStage_1.io.out, lsuStage_1.io.out, csrStage_1.io.out)
    val rsCDBVec = Seq(aluRS.io.cdb, bruRS.io.cdb, lsuRS.io.cdb, csrRS.io.cdb)
    rsCDBVec.foreach{ r => 
        r.zip(fuStageOutputVec).foreach{ case (r, f) => 
            r.valid := f.valid
            r.bits.data := f.bits.data
            r.bits.rd := f.bits.rd
            r.bits.id := f.bits.id
        }
    }
    
    // Reservation Station ROB read port, operand can be fetch from ROB when there is valid ROB entry and match both rd and id
    val rs = Seq(aluRS, bruRS, lsuRS, csrRS)
    rs.foreach{ r => 
        // Read reg data from ROB
        r.io.robRead.zip(rob.io.read).foreach{ case(rs, rob) => 
            rs <> rob
        }
    }

    // Reservation Station will read reg data from RegFile when instruction is fired into RS
    aluRS.io.rf(0) <> rf.io.r(0)
    aluRS.io.rf(1) <> rf.io.r(1)
    bruRS.io.rf(0) <> rf.io.r(2)
    bruRS.io.rf(1) <> rf.io.r(3)
    lsuRS.io.rf(0) <> rf.io.r(4)
    lsuRS.io.rf(1) <> rf.io.r(5)
    csrRS.io.rf(0) <> rf.io.r(6)
    csrRS.io.rf(1) <> rf.io.r(7)

    
    // Branch Taken and Exception Taken
    bruBrTaken := rob.io.deq.fire && rob.io.deq.bits.predictBrTaken =/= rob.io.deq.bits.brTaken
    bruBrAddr := Mux(rob.io.deq.bits.brTaken, rob.io.deq.bits.brAddr, rob.io.deq.bits.pc + 4.U)
    csrExcpValid := rob.io.deq.bits.excpValid && rob.io.deq.fire
    csrExcpAddr := rob.io.deq.bits.excpAddr

    // Write back RegFile
    rf.io.w(0).addr := rob.io.deq.bits.rd
    rf.io.w(0).data := rob.io.deq.bits.data
    rf.io.w(0).en := rob.io.deq.bits.rdWrEn && rob.io.deq.fire

    // Instruction State report
    val instState = Wire(new InstState)
    instState.commit := rob.io.deq.fire
    instState.inst := rob.io.deq.bits.inst
    instState.pc := rob.io.deq.bits.pc

    // --------------------------------------------------------------------------------
    // State report
    // --------------------------------------------------------------------------------
    val regState = WireInit(0.U.asTypeOf(new RegFileState))
    BoringUtils.addSink(regState, "regState")

    val csrState = WireInit(0.U.asTypeOf(new CsrFileState))
    BoringUtils.addSink(csrState, "csrState")

    io.out.state.instState <> RegNext(instState)
    io.out.state.intRegState <> regState
    io.out.state.csrState <> csrState
    

    // --------------------------------------------------------------------------------
    // Bus
    // --------------------------------------------------------------------------------
    val xbar = Module(new TLXbar)
    val rom = Module(new SingleROM)
    xbar.io <> DontCare
    ifu.io.tlbus.req <> xbar.io.masterFace.in(0)
    ifu.io.tlbus.resp <> xbar.io.masterFace.out(0)

    dcache.io.tlbus.req <> xbar.io.masterFace.in(1)
    dcache.io.tlbus.resp <> xbar.io.masterFace.out(1)

    rom.io.req <> xbar.io.slaveFace.in(0)
    rom.io.resp <> xbar.io.slaveFace.out(0)
}

object CoreGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = true,
            busBeatSize = 16,
            logEnable = false,
            rfRdPort = 8, // for three FUs we need total 6 rdport
            rfWrPort = 4,
        )
    })

    println("Generating the Core_1 hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Core()(defaultConfig), Array("--target-dir", "build"))
}

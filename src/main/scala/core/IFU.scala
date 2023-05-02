package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.Control._
import mycpu.common.Parameters._

class ICacheRespEntry()(implicit val p: Parameters) extends MyBundle {
    val inst = UInt(xlen.W)
    val valid = Bool()
}

class PredictInfo()(implicit val p: Parameters) extends MyBundle {
    val btbHit = Bool()
    val brTaken = Bool()
    val jump = Bool()
    val targetAddr = UInt(xlen.W)
}

class RedirectInfo()(implicit val p: Parameters) extends MyBundle {
    val targetAddr = UInt(xlen.W)
    val brTaken = Bool()
    val pc = UInt(xlen.W)
    val way = UInt(8.W)
    val idx = UInt(PRED_IDX_WIDTH.W)
}

class IFUOutput()(implicit val p: Parameters) extends MyBundle {
    val inst = Vec(icacheRdWays, UInt(ilen.W))
    val pc = UInt(xlen.W)
    val size = UInt((log2Ceil(icacheRdWays) + 1).W)
    val predictBrTaken = Vec(icacheRdWays, Bool())
    val predictIdx = Vec(icacheRdWays, UInt(PRED_IDX_WIDTH.W))
}

class IFU()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val start = Input(Bool())
        val ib = Input(new Bundle{
            val backPressure = Bool()
        }) 
        val redirect = Flipped(Valid(new RedirectInfo)) // from backend
        val output = Decoupled(new IFUOutput) // for InstBuffer
        val tlbus = new TLMasterBusUL
    })

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
    icache.io.tlbus <> io.tlbus
    
    val ghr = Module(new GHR)
    val btbs = Seq.fill(icacheRdWays)(Module(new BTB))
    val phts = Seq.fill(icacheRdWays)(Module(new PHT))

    val s0_valid = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool())
    
    val s1_redirect = Wire(Bool())
    val s1_targetAddr = Wire(UInt(xlen.W))

    def isAlignAddr_1(addr: UInt): Bool = {
        val step = icacheRdWays * ( ilen / 8 )
        ~Cat( addr(log2Ceil(step)-1, 0) & Fill(log2Ceil(step), 1.U) ).orR
    }
    
    // --------------------------------------------------------------------------------
    // Stage 0 
    // --------------------------------------------------------------------------------
    // Read ICache & Read BTB & Start branch prediction
    val s0_pcReg = RegInit(resetPc.U(xlen.W))
    val s0_pcNext = Wire(UInt(xlen.W))
    val step = icacheRdWays * ( ilen / 8 )
    val isAlignAddr = ~Cat( s0_pcReg(log2Ceil(step)-1, 0) & Fill(log2Ceil(step), 1.U) ).orR
    val s0_lastPC = RegEnable(icache.io.read.req.bits.addr, icache.io.read.req.fire)
    val s0_pcNext4 = Mux(isAlignAddr, 
                        s0_pcReg + step.U, 
                        s0_lastPC + ( ( step.U - s0_lastPC(log2Ceil(step)-1, 0) ) >> 2 << 2) // fix unalign address
                    ) 

    val backendRedirectQueue = Module(new Queue(new RedirectInfo, 4, flow = true))
    backendRedirectQueue.io.enq.bits := io.redirect.bits
    backendRedirectQueue.io.enq.valid := io.redirect.fire 
    backendRedirectQueue.io.deq.ready := icache.io.read.req.ready 
    val s0_redirect = backendRedirectQueue.io.deq.fire
    val s0_redirectInfo = backendRedirectQueue.io.deq.bits
    
    val s0_firstFire    = RegEnable(false.B, true.B, icache.io.read.req.fire)
    val s0_preFetchInst = (s0_firstFire && s0_pcReg === resetPc.U) || 
                            (!s0_firstFire && (
                                    io.output.fire ||
                                    s0_redirect 
                                )
                            )
    val s0_brTaken = WireInit(false.B)
    val s0_brAddr = WireInit(0.U(xlen.W))

    val s0_nextPC = Mux(s0_firstFire, s0_pcReg, Mux(s0_redirect, s0_redirectInfo.targetAddr, Mux(s1_redirect, s1_targetAddr, s0_pcNext)))

    // Send icache request
    icache.io.read.req.valid := s0_preFetchInst && io.start 
    icache.io.read.req.bits.addr := s0_nextPC
    icache.io.flush := io.redirect.fire

    // Update PC register
    when(icache.io.read.req.fire && !s0_firstFire) { 
        s0_pcReg := s0_pcNext
    }
    s0_pcNext := Mux(s0_redirect, s0_redirectInfo.targetAddr, Mux(s1_redirect, s1_targetAddr, s0_pcNext4))

    // Read BTB & PHT
    val icachePC = icache.io.read.req.bits.addr

    ghr.io.update.valid := s0_redirect
    ghr.io.update.bits.brTaken := s0_redirectInfo.brTaken

    btbs.zipWithIndex.foreach{ case(btb, i) => 
        btb.io.read.req.valid := icache.io.read.req.fire
        btb.io.read.req.bits.pc := icachePC + (i * 4).U
    }

    val s0_predictIdx = WireInit(VecInit(Seq.fill(icacheRdWays)(0.U(PRED_IDX_WIDTH.W))))
    phts.zipWithIndex.foreach{ case(pht, i) => 
        val phtIdx = (icachePC + (i * 4).U)(GHR_WIDTH + ADDR_ALIGN_WIDTH - 1, ADDR_ALIGN_WIDTH ) ^ ghr.io.out 
        s0_predictIdx(i) := phtIdx // G-share
        pht.io.index := phtIdx
    }

    s0_valid := RegNext(icache.io.read.req.fire) && !io.redirect.fire
    // --------------------------------------------------------------------------------
    // Stage 1 
    // --------------------------------------------------------------------------------
    // Recv ICache resp
    val s1_latch = s0_valid & s1_ready
    val s1_brTaken = RegEnable(Cat(phts.map(p => p.io.brTaken).reverse), s1_latch)
    val s1_btbInfo = RegEnable(Cat(btbs.map(p => p.io.read.resp.asUInt).reverse), s1_latch).asTypeOf(Vec(icacheRdWays, new BTBResp(xlen)))
    val s1_predictIdx = RegEnable(s0_predictIdx, s1_latch)
    val s1_full = RegInit(false.B)
    val s1_fire = s1_valid && io.output.ready

    s1_ready := !s1_full || s1_fire
    
    when(s1_latch) { s1_full := true.B }
    .elsewhen(s1_full && s1_fire) { s1_full := false.B }

    val resp = icache.io.read.resp
    resp.ready := true.B
    val s1_insts = RegEnable(Cat(resp.bits.inst.reverse), resp.fire).asTypeOf(Vec(icacheRdWays, UInt(xlen.W)))
    val s1_instPC = RegEnable(resp.bits.addr, resp.fire)
    val s1_instSize = RegEnable(resp.bits.size, resp.fire)

    val icacheRespIsAlignAddr = isAlignAddr_1(resp.bits.addr)
    val s1_instValidSize = Mux(icacheRespIsAlignAddr, s1_instSize, icacheRdWays.U - s1_instPC(log2Ceil(icacheRdWays)+2-1, 2))
    val s1_instValidMask_1 = ( Fill(icacheRdWays, 1.U) << (icacheRdWays.U - s1_instSize) )(icacheRdWays - 1, 0)
    val s1_instValidMask = ( Fill(icacheRdWays, 1.U) << (icacheRdWays.U - s1_instValidSize) )(icacheRdWays - 1, 0)

    val preDecoders = Seq.fill(icacheRdWays)(Module(new Decoder_1))
    preDecoders.zipWithIndex.foreach{ case(d, i) => 
        d.io.inst := s1_insts(i)
    }
    val preDecodeSigs = VecInit((0 until icacheRdWays).map( i => preDecoders(i).io.out))

    val s1_isBranchVec = preDecodeSigs.map(p => p.brType =/= BR_NOP && p.brType =/= BR_JALR)
    val s1_isBranchMask = Cat(s1_isBranchVec.reverse) & s1_instValidMask
    val s1_hasBranch = Cat(s1_isBranchMask).orR

    val s1_isJumpVec = preDecodeSigs.map(p => p.brType === BR_JAL)
    val s1_isJumpMask = Cat(s1_isJumpVec.reverse) & s1_instValidMask
    

    val immGens = Seq.fill(icacheRdWays)(Module(new ImmGen))
    immGens.zipWithIndex.foreach{ case(immGen, i) =>
        immGen.io.immSrc := preDecodeSigs(i).immSrc
        immGen.io.immSign := preDecodeSigs(i).immSign
        immGen.io.inst := s1_insts(i)
    }
    val s1_targetAddrVec = VecInit((0 until icacheRdWays).map( i => immGens(i).io.imm + s1_instPC + (i * 4).U))


    // Write BTB & PHT
    val redirectChosenOH = UIntToOH(s0_redirectInfo.way, icacheRdWays) 
    val backendRedirect = s0_redirect

    val s1_redirectJumpOH = PriorityEncoderOH(s1_isJumpMask)
    val s1_redirectJump = s1_redirectJumpOH.orR

    btbs.zipWithIndex.foreach{ case(btb, i) => 
        val backendRedirectValid = backendRedirect && redirectChosenOH(i)
        val s1_redirectValid = s1_redirectJumpOH(i) && !s1_btbInfo(i).hit
        val valid = backendRedirectValid || s1_redirectValid

        btb.io.write.valid := valid
        btb.io.write.bits.jump := Mux(backendRedirectValid, false.B, s1_isJumpVec(i))
        btb.io.write.bits.pc := Mux(backendRedirectValid, s0_redirectInfo.pc, s1_instPC + (i * 4).U )
        btb.io.write.bits.target := Mux(backendRedirectValid, s0_redirectInfo.targetAddr, s1_targetAddrVec(i))
    }

    phts.zipWithIndex.foreach{ case(pht, i) => 
        val backendRedirectValid = backendRedirect && redirectChosenOH(i)
        val s1_redirectValid = s1_redirectJumpOH(i) && !s1_btbInfo(i).hit
        val valid = backendRedirectValid || s1_redirectValid

        pht.io.update.valid := valid
        pht.io.update.bits.brTaken := Mux(backendRedirectValid, s0_redirectInfo.brTaken, true.B)
        pht.io.update.bits.idx := Mux(backendRedirectValid, s0_redirectInfo.idx, s1_predictIdx(i)) 
    }

    val s1_predictBrTakenOH = s1_brTaken & s1_isBranchMask
    val s1_chosenPredictBrTaken = PriorityEncoderOH(s1_predictBrTakenOH).orR
    val s1_redirectOH = PriorityEncoderOH(s1_isBranchMask & s1_brTaken | s1_redirectJumpOH)
    val s1_chosenRedirectOH = PriorityEncoderOH(s1_redirectOH)
    s1_redirect := (s1_chosenPredictBrTaken || s1_redirectJump) && s1_full
    s1_targetAddr := PriorityMux(s1_redirectOH, s1_targetAddrVec)

    val s1_instValid = RegInit(false.B)
    when(resp.fire) { s1_instValid := true.B }
    .elsewhen(s1_instValid && s1_latch) { s1_instValid := false.B }

    s1_valid := (RegNext(resp.fire) || s1_instValid) && s1_full
    // s1_valid := resp.fire || s1_instValid
    
    io.output.valid := s1_valid && !io.redirect.fire
    io.output.bits.inst := s1_insts
    io.output.bits.pc := s1_instPC
    val size = Wire(UInt(log2Ceil((icacheRdWays) + 1).W))
    size := OHToUInt(s1_chosenRedirectOH)
    io.output.bits.size := Mux(s1_redirect, size + 1.U, s1_instValidSize) // redirect will drop instruction behind the branch/jump instruction
    io.output.bits.predictBrTaken := (s1_brTaken & s1_isBranchMask | s1_isJumpMask).asBools
    io.output.bits.predictIdx := s1_predictIdx

    when(io.redirect.fire) {
        s1_full := false.B
    }
}
package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class IFU()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val start = Input(Bool())
        val ib = Input(new Bundle{
            val backPressure = Bool()
        })
        val redirect = Valid(new Bundle{ // from backend / frontend
            val targetAddr = UInt(xlen.W)
        })
        val output = Decoupled(new Bundle{ // for Decode
            
        })

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
    
    val s0_valid = Wire(Bool())

    // --------------------------------------------------------------------------------
    // Stage 0 
    // --------------------------------------------------------------------------------
    // Read ICache & Read BTB & Start branch prediction
    val s0_pcReg = RegInit(resetPc.U(xlen.W))
    val s0_pcNext = Wire(UInt(xlen.W))
    val step = icacheRdWays * ( ilen / 8 )
    val isAlignAddr = ~Cat( s0_pcReg(log2Ceil(step)-1, 0) & Fill(log2Ceil(step), 1.U) ).orR
    val s0_lastPc = RegEnable(icache.io.read.req.bits.addr, icache.io.read.req.fire)
    val s0_pcNext4 = Mux(isAlignAddr, 
                        s0_pcReg + step.U, 
                        s0_lastPc + ( ( step.U - s0_lastPc(log2Ceil(step)-1, 0) ) >> 2 << 2) // fix unalign address
                    ) 

    val fetch_instValid = RegInit(false.B)
    val s0_fire = s0_valid || fetch_instValid
    
    when(icache.io.read.resp.fire) { fetch_instValid := true.B }
    .elsewhen(fetch_instValid && icache.io.read.req.fire) { fetch_instValid := false.B }

    val edgeBackPressure = Module(new EdgeDetect("faling"))
    edgeBackPressure.io.in := io.ib.backPressure

    val pendingRedirect = Module(new Queue(UInt(xlen.W), 4, flow = true))
    pendingRedirect.io.enq.bits := io.redirect.bits.targetAddr
    pendingRedirect.io.enq.valid := io.redirect.fire 
    pendingRedirect.io.deq.ready := icache.io.read.req.ready 
    val s0_brTaken = pendingRedirect.io.deq.fire
    val s0_brAddr = pendingRedirect.io.deq.bits
    
    val s0_firstFire    = RegEnable(false.B, true.B, icache.io.read.req.fire)
    val s0_preFetchInst = (s0_firstFire && s0_pcReg === resetPc.U) || 
                    (!s0_firstFire && (
                            (s0_fire || edgeBackPressure.io.change) && !io.ib.backPressure ||
                            s0_brTaken
                        )
                    )

    // Send icache request
    icache.io.read.req.valid := s0_preFetchInst && io.start 
    icache.io.read.req.bits.addr := Mux(icache.io.read.req.fire, Mux(s0_firstFire, s0_pcReg, s0_pcNext), Mux(s0_brTaken, s0_brAddr, s0_pcReg))
    icache.io.flush := io.redirect.fire

    // Update PC register
    when(icache.io.read.req.fire && !s0_firstFire) { 
        s0_pcReg := s0_pcNext
    }
    s0_pcNext := Mux(s0_brTaken, s0_brAddr, s0_pcNext4)




    // Read BTB & PHT
    








    s0_valid := icache.io.read.req.fire
    // --------------------------------------------------------------------------------
    // Stage 1 
    // --------------------------------------------------------------------------------
    // Recv ICache resp
    // icache.io.read.resp.ready := ib.io.in.ready


}
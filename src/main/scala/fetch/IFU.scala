package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.experimental.ChiselEnum

import mycpu.common._
import mycpu.util._

class IFUIO()(implicit val p: Parameters) extends MyBundle {
    val tlbus = new TLMasterBusUL
}

class IFU()(implicit val p: Parameters) extends MyModule {
    val io = IO(new IFUIO)

    val icache = Module(new ICache()(p.alterPartial(
        {
            case MyCpuParamsKey => MyCpuParameters(
                dcacheSets = 128,
                dcacheWays = 8,
                dcacheBlockSize = 8
            )
        }
    )))

    icache.io.read <> DontCare
    icache.io.tlbus <> io.tlbus
    // icache.io.read.req.valid := !flush && io.in.start && preFetchInst
    // icache.io.read.req.bits.addr := Mux(io.out.fire, pcNext, pcReg)
    icache.io.read.resp.ready := true.B

}
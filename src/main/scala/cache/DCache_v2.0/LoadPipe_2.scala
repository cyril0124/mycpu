package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import firrtl.passes.wiring.Wiring

import mycpu.BusReq._
import mycpu.BusMaster._


class LoadPipe_2()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val load = new CacheReadBus
        val dir = Flipped(new DirectoryReadBus)
        val dataBank = Flipped(new DataBankArrayRead)
        val mshr =  Decoupled(new MissReq)
    })

    val s0_valid = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool())

    // --------------------------------------------------------------------------------
    // stage 0
    // --------------------------------------------------------------------------------
    // accept load request 
    // read directory 
    // read dataBank 
    val s0_full = RegInit(false.B)
    val s0_latch = io.load.req.fire 
    val s0_fire = s0_valid && s1_ready
    val s0_reqReg = RegEnable(io.load.req.bits, s0_latch)
    val s0_rAddr = Mux(s0_latch, io.load.req.bits.addr, s0_reqReg.addr)

    io.load.req.ready := !s0_full

    when(s0_latch) { s0_full := true.B }
    .elsewhen(s0_full && s0_fire) { s0_full := false.B }

    // read directory
    io.dir.req.valid := s0_latch || s0_full
    io.dir.req.bits.addr := s0_rAddr
    // read databank
    io.dataBank.req.valid := s0_latch || s0_full
    dontTouch(io.dataBank.req.valid)
    io.dataBank.req.bits.set := addrToDCacheSet(s0_rAddr)
    io.dataBank.req.bits.blockSelOH := addrToDCacheBlockOH(s0_rAddr)

    val s0_dirInfo = io.dir.resp.bits

    val s0_rdBlockData = io.dataBank.resp.bits.blockData
    val s0_rdDataAll = io.dataBank.resp.bits.data

    val s0_validReg = RegInit(false.B)
    when(s0_latch) { s0_validReg := true.B }
    .elsewhen(s0_fire) { s0_validReg := false.B }
    s0_valid := (RegNext(s0_latch) || s0_validReg) && io.dir.req.fire && io.dataBank.req.fire
    // --------------------------------------------------------------------------------
    // stage 1
    // --------------------------------------------------------------------------------
    // send resp (load hit)
    // alloc MSHR (load miss)
    val s1_full = RegInit(false.B)
    val s1_latch = s0_valid && s1_ready
    val s1_fire = s1_valid
    val s1_rAddr = RegEnable(s0_rAddr, s1_latch)
    val s1_dirInfo = RegEnable(s0_dirInfo, s1_latch)
    val s1_isHit = s1_dirInfo.hit
    val s1_chosenWayOH = s1_dirInfo.chosenWay
    val s1_rdBlockData = RegEnable(s0_rdBlockData, s1_latch)
    val s1_rdDataAll = RegEnable(s0_rdDataAll, s1_latch)
    val s1_rdData = Mux1H(s1_chosenWayOH, s1_rdDataAll)
    dontTouch(s1_rdData)
    dontTouch(s1_latch)

    s1_ready := !s1_full || s1_fire
    when(s1_latch) { s1_full := true.B }
    .elsewhen(s1_full && s1_fire) { s1_full := false.B }

    val temp = s1_rdBlockData.map{ d => d.asTypeOf(Vec(dcacheWays, UInt((dcacheBlockBytes*8).W)))}
    val s1_chosenRdBlockData = temp.map{ t => Mux1H(s1_chosenWayOH, t) }

    io.mshr.valid := !s1_isHit && s1_full
    io.mshr.bits <> DontCare
    io.mshr.bits.addr := s1_rAddr
    io.mshr.bits.isStore := false.B
    io.mshr.bits.dirInfo := s1_dirInfo
    io.mshr.bits.data := s1_chosenRdBlockData

    io.load.resp.valid := s1_isHit && s1_full
    io.load.resp.bits <> DontCare
    io.load.resp.bits.data := s1_rdData

    s1_valid := s1_full && (
                    !s1_isHit && io.mshr.fire ||
                    s1_isHit && io.load.resp.fire
                )

}

object LoadPipe_2GenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    println("Generating the LoadPipe_2 hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new LoadPipe_2()(defaultConfig), Array("--target-dir", "build"))
}
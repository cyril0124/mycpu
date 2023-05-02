package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.experimental.ChiselEnum

import mycpu.common._
import mycpu.util._

import mycpu.BusReq._
import mycpu.BusMaster._
import dataclass.data
import chisel3.util.random.LFSR
import scala.tools.cmd.Meta
import chisel3.internal.firrtl.Ref
import os.read


class ICacheReadReq()(implicit val p: Parameters) extends MyBundle{
    val addr = UInt(xlen.W)
}

class ICacheReadResp()(implicit val p: Parameters) extends MyBundle{
    val data = UInt(ilen.W)
    val addr = UInt(xlen.W)
    val inst = Vec(icacheRdWays, UInt(ilen.W))
    val size = UInt((log2Ceil(icacheRdWays) + 1).W)
}

class ICacheReadBus()(implicit val p: Parameters) extends MyBundle{
    val req = Flipped(Decoupled(new ICacheReadReq))
    val resp = Decoupled(new ICacheReadResp)
}

class ICacheIO()(implicit val p: Parameters) extends MyBundle{
    val read = new ICacheReadBus
    val tlbus = new TLMasterBusUL
    val flush = Input(Bool())
}


class ICache()(implicit val p: Parameters) extends MyModule {
    val io = IO(new ICacheIO)
    io <> DontCare

    val cacheSize = dcacheSets * dcacheWays * dcacheBanks *dcacheBlockBytes
    val setBits = log2Ceil(dcacheSets)
    val metaBits = (new DCacheMeta).getWidth
    println("----------ICache info----------")
    println(s" cacheSize: ${cacheSize} Byte")
    println(s" sets:${dcacheSets}  ways:${dcacheWays}  blockBytes:${dcacheBlockBytes}")
    println(s" byteOffsetBits: ${dcacheByteOffsetBits}")
    println(s" blockBits: ${dcacheBlockBits}")
    println(s" setBits: ${dcacheSetBits}")
    println(s" tagBits: ${dcacheTagBits}")


    val db = Module(new DataBankArray)
    val dir = Module(new DCacheDirectory)
    val refillPipe = Module(new RefillPipe)

    refillPipe.io.resp.ready := true.B
    refillPipe.io.dataWrite.req <> db.io.write.req
    refillPipe.io.dirWrite.req <> dir.io.write.req
    refillPipe.io.tlbus <> io.tlbus
    
    val refillBuffer = Module(new RefillBuffer(2))

    val s0_valid = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool())
    val s2_valid, s2_ready = Wire(Bool())

    // --------------------------------------------------------------------------------
    // stage 0
    // --------------------------------------------------------------------------------
    // read databank & directory
    val s0_latch = io.read.req.fire
    val s0_fire = s0_valid && s1_ready
    val s0_reqReg = RegEnable(io.read.req.bits, s0_latch)
    val s0_req = Mux(io.read.req.fire, io.read.req.bits, s0_reqReg)

    io.read.req.ready := s1_ready && db.io.read.req.ready && dir.io.read.req.ready
    

    db.io.read.req.valid := io.read.req.fire
    db.io.read.req.bits.set := addrToDCacheSet(s0_req.addr)

    dir.io.read.req.valid := io.read.req.fire
    dir.io.read.req.bits.addr := s0_req.addr

    s0_valid := RegNext(io.read.req.fire) // TODO: using single port SRAM

    class StageInfo extends Bundle{
        val req = chiselTypeOf(io.read.req.bits)
        val dirInfo = chiselTypeOf(dir.io.read.resp.bits)
        val rdData = chiselTypeOf(db.io.read.resp)
    }

    val s1_info = Wire(new StageInfo)
    s1_info.dirInfo := dir.io.read.resp.bits
    s1_info.req := s0_reqReg
    s1_info.rdData := db.io.read.resp

    // --------------------------------------------------------------------------------
    // stage 1
    // --------------------------------------------------------------------------------
    // 
    val s1_full = RegInit(false.B)
    val s1_latch = s0_valid && s1_ready
    val s1_fire = s1_valid && s2_ready
    val s1_addr = RegEnable(io.read.req.bits.addr, io.read.req.fire)
    val s1_blockSel = addrToDCacheBlockOH(s1_addr)
    val s1_rdBlockData = Mux1H(s1_info.dirInfo.chosenWay, s1_info.rdData)
    val s1_rdHitData = Mux1H(s1_blockSel, s1_rdBlockData)
    s1_ready := !s1_full //|| s1_fire
    
    when(s1_latch && !s1_fire) { s1_full := true.B }
    .elsewhen(s1_full && s1_fire) { s1_full := false.B }

    val bypassVec = refillBuffer.io.read.cacheLineAddr.zip(refillBuffer.io.read.valids).map{ case(a, v) => a === addrToDCacheBlockAddr(s1_addr) && v}
    val s1_bypass = Cat(bypassVec).orR && !s1_info.dirInfo.hit && (s1_full || s1_latch)
    val s1_bypassIdx = OHToUInt(Cat(bypassVec.reverse))
    val s1_bypassBlockData = refillBuffer.io.read.cacheLineData(s1_bypassIdx)
    val s1_bypassData = Mux1H(s1_blockSel, s1_bypassBlockData)
    
    refillPipe.io.req.valid := !s1_info.dirInfo.hit && s1_full && !s1_bypass
    refillPipe.io.req.bits.addr := s1_addr
    refillPipe.io.req.bits.chosenWay := s1_info.dirInfo.chosenWay

    val rdThreshole = dcacheBlockSize.U - icacheRdWays.U
    val s1_off = s1_addr(dcacheByteOffsetBits+dcacheBlockBits-1, dcacheByteOffsetBits)
    dontTouch(s1_off)
    val s1_respHitSize = Mux(s1_off >= rdThreshole, dcacheBlockSize.U - s1_off, icacheRdWays.U)
    val s1_respHitInst = (s1_rdBlockData.asUInt >> (s1_off << log2Ceil(ilen)) )(icacheRdWays*32-1, 0).asTypeOf(io.read.resp.bits.inst) 
    val s1_respBypassInst = (s1_bypassBlockData.asUInt >> (s1_off << log2Ceil(ilen)) )(icacheRdWays*32-1, 0).asTypeOf(io.read.resp.bits.inst)
    val s1_resp = WireInit(0.U.asTypeOf(io.read.resp))

    val s1_respSend = RegInit(false.B)
    when(s1_resp.fire && !s1_fire) { s1_respSend := true.B }
    .elsewhen(s1_respSend && s1_fire) { s1_respSend := false.B }

    s1_resp.valid := ( s1_info.dirInfo.hit || !s1_info.dirInfo.hit && s1_bypass ) && (s1_full || s1_latch) && s2_ready && !s1_respSend
    s1_resp.bits.addr := s1_addr
    s1_resp.bits.size := s1_respHitSize
    s1_resp.bits.data := Mux(s1_bypass, s1_bypassData, s1_rdHitData)
    s1_resp.bits.inst.zipWithIndex.foreach{ case(inst, i) =>
        inst := Mux(s1_bypass, s1_respBypassInst(i), s1_respHitInst(i))
    }

    s1_valid := s1_respSend || s1_resp.fire || refillPipe.io.req.fire

    // --------------------------------------------------------------------------------
    // stage 2
    // --------------------------------------------------------------------------------
    val s2_full = RegInit(false.B)
    val s2_latch = s1_valid && s2_ready
    val s2_fire = s2_valid // stage2 is final stage
    val s2_addr = RegEnable(s1_addr, s2_latch)
    val s2_dirInfo = RegEnable(s1_info.dirInfo, s2_latch)
    val s2_bypass = RegEnable(s1_bypass, s2_latch)
    s2_ready := !s2_full || s2_fire

    when(s2_latch) { s2_full := true.B }
    .elsewhen(s2_full && s2_fire) { s2_full := false.B }

    
    refillBuffer.io.write.valid := io.tlbus.resp.fire && io.tlbus.resp.bits.opcode === AccessAckData
    refillBuffer.io.write.bits.data := io.tlbus.resp.bits.data
    refillBuffer.io.write.bits.cacheLineAddr := s2_addr
    dontTouch(refillBuffer.io)

    val s2_refillData = refillPipe.io.resp.bits.data
    val s2_refillValid = RegInit(false.B)
    when(s2_refillValid && s2_latch || s2_fire ) { s2_refillValid := false.B }
    .elsewhen(refillPipe.io.resp.fire) { s2_refillValid := true.B }

    val s2_off = s2_addr(dcacheByteOffsetBits+dcacheBlockBits-1, dcacheByteOffsetBits) // block offset
    val s2_respMissSize = Mux(s2_off >= rdThreshole, dcacheBlockSize.U - s2_off, icacheRdWays.U)
    val s2_respRefillInst = (refillPipe.io.resp.bits.blockData.asUInt >> (s2_off << log2Ceil(ilen)) )(icacheRdWays*32-1, 0).asTypeOf(io.read.resp.bits.inst)
    val s2_resp = WireInit(0.U.asTypeOf(io.read.resp))
    s2_resp.valid := !s2_dirInfo.hit && s2_full && (refillPipe.io.resp.fire || s2_refillValid)
    s2_resp.bits.addr := s2_addr
    s2_resp.bits.size := s2_respMissSize
    s2_resp.bits.data := s2_refillData
    s2_resp.bits.inst.zipWithIndex.foreach{ case(inst, i) =>
        inst := s2_respRefillInst(i)
    }

    s2_valid := s2_dirInfo.hit || s2_bypass || !s2_dirInfo.hit && s2_resp.fire

    when(io.flush) {
        s1_full := false.B
        s2_full := false.B
    }


    val readRespArb = Module(new Arbiter(chiselTypeOf(io.read.resp.bits), 2))
    readRespArb.io.in(0) <> s2_resp
    readRespArb.io.in(1) <> s1_resp
    io.read.resp <> readRespArb.io.out

    
    refillPipe.io.resp.ready := io.read.resp.ready

    io.tlbus.resp.ready := true.B
    io.tlbus.req.bits.source := MASTER_0

    SimLog(simulation & logEnable, io.read.req.fire, "[ICache] read req ==> addr: 0x%x\n", io.read.req.bits.addr)
    SimLog(simulation & logEnable, io.read.resp.fire, "[ICache] read resp <== data: 0x%x  inst:0x%x\n", io.read.resp.bits.data, io.read.resp.bits.inst.asUInt)
}

object ICacheGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false,
            // dcacheSets = 32,
            // dcacheWays = 4,
            // dcacheBlockSize = 4
        )
    })

    println("Generating the ICache hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new ICache()(defaultConfig), Array("--target-dir", "build"))
}

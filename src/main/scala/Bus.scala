package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

import chisel3.experimental.ChiselEnum

object BusMaster {
    val BUS_MASTER_WIDTH = 2
    val BUS_MASTER_NUM = 2
    val MASTER_0 = 0.U(BUS_MASTER_WIDTH.W) // from 1_Fetch
    val MASTER_1 = 1.U(BUS_MASTER_WIDTH.W) // from 4_Mem

    val MASTERS = Seq(MASTER_0, MASTER_1)
}

object BusSlave {
    val BUS_SLAVE_WIDTH = 2
    val SLAVE_ROM = 0.U(BUS_SLAVE_WIDTH.W)
    val SLAVE_RAM = 1.U(BUS_SLAVE_WIDTH.W)
    val SLAVE_UART = 2.U(BUS_SLAVE_WIDTH.W)
}

object BusReq {
    def Get = 4.U
    def PutFullData = 2.U
    def PutPartialData = 3.U

    def AccessAck = 0.U
    def AccessAckData = 1.U 

    def isPut(req: UInt): Bool = {
        req(1).asBool
    }
}

import BusMaster._
import BusSlave._
import BusReq._

// req, tl-ul channel a
class BusMasterBundle()(implicit val p: Parameters) extends MyBundle{
    val opcode = UInt(3.W)
    val param = UInt(3.W)
    val size = UInt(busBeatWidth.W) //UInt(log2Ceil(busBeatSize / 8).W)
    val source = UInt(log2Ceil(nrBusMaster).W)
    val address = UInt(xlen.W)
    val mask = UInt(busBeatSize.W) // UInt((busBeatSize / 8).W)
    val corrupt = Bool()
    val data = UInt((busBeatSize*8).W) // UInt(busBeatSize.W)
    // val sink = UInt(log2Ceil(nrBusMaster).W)
}

// resp, tl-ul channel d
class BusSlaveBundle()(implicit val p: Parameters) extends MyBundle{
    val opcode = UInt(3.W)
    val param = UInt(3.W)
    val size = UInt(busBeatWidth.W) // UInt(log2Ceil(busBeatSize / 8).W)
    val source = UInt(log2Ceil(nrBusMaster).W)
    val sink = UInt(log2Ceil(nrBusSlave).W)
    val denied = Bool()
    val corrupt = Bool()
    val data = UInt((busBeatSize*8).W) // UInt(busBeatSize.W)
}

// tl-ul master
class TLMasterBusUL()(implicit val p: Parameters) extends MyBundle{
    val req = DecoupledIO(new BusMasterBundle)
    val resp = Flipped(DecoupledIO(new BusSlaveBundle))
}
// tl-ul slave
class TLSlaveBusUL()(implicit val p: Parameters) extends MyBundle{
    val req = Flipped(DecoupledIO(new BusMasterBundle))
    val resp = DecoupledIO(new BusSlaveBundle)
}

class TLBusMux[T <: Data](gen: T, nrIn: Int = 2)(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val in = Flipped(Vec(nrIn, DecoupledIO(gen)))
        val out = DecoupledIO(gen)
        val choseOH = Input(Vec(nrIn, Bool()))
    })
    io.out.bits  := Mux1H((0 until nrIn).map{ i => (io.choseOH(i) -> io.in(i).bits)})
    io.out.valid := Mux1H((0 until nrIn).map{ i => (io.choseOH(i) -> io.in(i).valid)})
    // io.in.foreach( in => in.ready := io.out.ready)
    io.in.zip(io.choseOH).foreach{ case(in, chose) => in.ready := io.out.ready & chose}
}

class TLBusAlloc[T <: Data](gen: T, nrOut: Int = 2)(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val out = Vec(nrOut, DecoupledIO(gen))
        val in = Flipped(DecoupledIO(gen))
        val choseOH = Input(Vec(nrOut, Bool()))
    })

    io.out <> DontCare
    io.in <> DontCare
    io.out.zip(io.choseOH).foreach{ case(o, c) =>
        when(c) {
            o.bits <> io.in.bits
            o.valid := io.in.valid
            io.in.ready := o.ready
        }.otherwise{
            o.valid := false.B
        }
    }
}


class TLBusArbiter(nrIn: Int = 2, policy: String = "priority")(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val reqs = Input(Vec(nrIn, Bool()))
        val grantOH = Output(UInt(nrIn.W))
    })

    val owner = RegInit(MASTER_0)
    // val owner = WireInit(MASTER_0)

    if(policy == "priority") {
        // println("[TLBusArbiter] Policy is PRIORITY!")
        owner := Mux1H((0 until nrIn).reverse.map{ i => io.reqs(i) -> MASTERS(i)})
    } else if( policy == "round robin") {
        // println("[TLBusArbiter] Policy is ROUND ROBIN!")
        switch(owner) {
            is(MASTER_0) {
                when(io.reqs(0)) { 
                    owner := MASTER_0
                }.elsewhen(io.reqs(1)) { 
                    owner := MASTER_1
                }
            }
            is(MASTER_1) {
                when(io.reqs(1)) { 
                    owner := MASTER_1
                }.elsewhen(io.reqs(0)) { 
                    owner := MASTER_0
                }
            }
        }
    } else {
        assert(false, "[TLBusArbiter] Invalid policy!")
    }
    
    io.grantOH := UIntToOH(owner)
}

class TLAddrDecode(nrIn: Int)(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val addr = Input(UInt(xlen.W))
        val choseOH = Output(Vec(nrIn, Bool()))
    })
    
    def mappingRegion(address: UInt, start: UInt, end: UInt): Bool = {
        val valid = WireInit(false.B)
        when(address >= start && address < end) {
            valid := true.B
        }.otherwise {
            valid := false.B
        }
        valid
    }

    when(mappingRegion(io.addr, memRomBegin.U, memRomEnd.U)) { // ROM
        io.choseOH := UIntToOH(SLAVE_ROM, nrIn).asTypeOf(Vec(nrIn, Bool()))
    }.elsewhen(mappingRegion(io.addr, memRamBegin.U, memRamEnd.U)) { // RAM
        io.choseOH := UIntToOH(SLAVE_RAM, nrIn).asTypeOf(Vec(nrIn, Bool()))
    }.otherwise{ // default
        io.choseOH := UIntToOH(SLAVE_ROM, nrIn).asTypeOf(Vec(nrIn, Bool()))
        // io.choseOH := 0.U.asTypeOf(Vec(nrIn, Bool()))
    }
}


class TLXbar()(implicit val p: Parameters) extends MyModule{
    val io = IO(new BusXbarIO)
    io <> DontCare
    val mf = io.masterFace
    val sf = io.slaveFace

    val s1_valid, s1_ready = Wire(Bool())
    val s2_valid, s2_ready = Wire(Bool())

    // --------------------------------------------------------------------------------
    // stage 0
    // --------------------------------------------------------------------------------
    // accept request
    val reqArb = Module(new TLBusArbiter(nrBusMaster))
    mf.in.zip(reqArb.io.reqs).foreach{ case(mfi, r) => r := mfi.valid }

    val reqMux = Module(new TLBusMux(new BusMasterBundle, nrBusMaster))
    reqMux.io.in.zip(mf.in).foreach{ case(ri, mfi) => ri <> mfi }
    reqMux.io.choseOH := reqArb.io.grantOH.asTypeOf(Vec(nrBusMaster, Bool()))

    val s0_req = reqMux.io.out

    val buf = Module(new Queue(new BusMasterBundle, entries = 4, flow = true))
    buf.io.enq <> s0_req
    
    // --------------------------------------------------------------------------------
    // stage 1
    // --------------------------------------------------------------------------------
    // send buffered request to slave
    val s1_full = RegInit(false.B)
    val s1_fire = Wire(Bool())
    val s1_latch = buf.io.deq.fire
    buf.io.deq.ready := s1_ready
    val s1_req = RegEnable(buf.io.deq.bits, s1_latch)
    val s1_opcode = s1_req.opcode
    val s1_beatSize = s1_req.size >> log2Ceil(busBeatSize)
    val s1_address = s1_req.address
    val s1_source = s1_req.source

    s1_ready := !s1_full || s1_fire
    when(s1_latch) { s1_full := true.B }
    .elsewhen(s1_full && s1_fire) { s1_full := false.B}

    val addrDec = Module(new TLAddrDecode(nrBusSlave))
    val s1_chosenSlaveOH = addrDec.io.choseOH
    addrDec.io.addr := s1_address

    sf.in.zipWithIndex.foreach{ case(si, i) => 
        si.bits  := s1_req 
        si.valid := s1_chosenSlaveOH(i) && s1_full
    }

    val s1_beatCounter = Counter(10)
    val s1_slaveRecVec = Cat(sf.in.map{ sfi => sfi.fire }.reverse)
    val s1_slaveRecv = (s1_slaveRecVec & s1_chosenSlaveOH.asUInt).orR
    val s1_slaveRecvHold = Hold(s1_slaveRecv, s1_slaveRecv, s1_fire)
    val s1_lastBeat = s1_beatCounter.value === s1_beatSize - 1.U
    when(s1_slaveRecv && !s1_lastBeat) {
        s1_beatCounter.inc()
    }
    when(s1_latch) {
        s1_beatCounter.reset()
    }
    
    s1_valid := s1_slaveRecvHold && s1_lastBeat && s1_opcode === PutFullData ||
                                    s1_slaveRecvHold && s1_opcode === Get
    
    s1_fire := s2_ready && s1_valid
    // --------------------------------------------------------------------------------
    // stage 2
    // --------------------------------------------------------------------------------
    // waitting for request
    val s2_full = RegInit(false.B)
    val s2_latch = s2_ready && s1_valid
    val s2_chosenSlaveOH = RegEnable(s1_chosenSlaveOH, s2_latch)
    val s2_opcode = RegEnable(s1_opcode, s2_latch)
    val s2_beatSize = RegEnable(s1_beatSize, s2_latch)
    val s2_chosenMasterOH = RegEnable(UIntToOH(s1_source), s2_latch)
    val s2_fire = s2_valid // stage2 is final stage
    
    s2_ready := !s2_full || s2_fire
    when(s2_latch) { s2_full := true.B }
    .elsewhen(s2_full && s2_fire) { s2_full := false.B }

    val slaveMux = Module(new TLBusMux(new BusSlaveBundle, nrBusSlave))
    slaveMux.io.in <> sf.out
    slaveMux.io.choseOH := s2_chosenSlaveOH

    mf.out.zipWithIndex.foreach{ case(mo, i) => 
        mo.bits <> slaveMux.io.out.bits
        mo.valid := slaveMux.io.out.valid && s2_chosenMasterOH(i) && s2_full
    }
    slaveMux.io.out.ready := Mux1H(s2_chosenMasterOH, mf.out.map{ mo => mo.ready})

    val s2_beatCounter = Counter(10)
    val s2_masterRecvVec = Cat(mf.out.map{ mfo => mfo.fire }.reverse) // ! NOTICE: use .reverse for the correct bit sequence
    val s2_masterRecv = (s2_masterRecvVec & s2_chosenMasterOH).orR
    val s2_masterRecvHold = Hold(s2_masterRecv, s2_masterRecv, s2_fire)
    val s2_lastBeat = s2_beatCounter.value === s2_beatSize - 1.U
    when(s2_masterRecv && !s2_lastBeat) {
        s2_beatCounter.inc()
    }
    when(s2_latch) {
        s2_beatCounter.reset()
    }

    s2_valid :=  s2_opcode === PutFullData && s2_masterRecvHold || 
                s2_opcode === Get && s2_masterRecvHold && s2_lastBeat


    
    // Bus status output
    val idle = RegInit(true.B)
    dontTouch(idle)
    when(s1_latch || s2_latch) {
        idle := false.B
    }.elsewhen(s2_valid) {
        idle := true.B
    }

    io.status.idle := idle

}

// TLXbar with PingPongBuf
class TLXbar_1()(implicit val p: Parameters) extends MyModule{
    val io = IO(new BusXbarIO)

    val mf = io.masterFace
    val sf = io.slaveFace

    // Bus request arb
    val reqArb = Module(new TLBusArbiter(nrBusMaster))
    mf.in.zip(reqArb.io.reqs).foreach{ case(mfi, r) => r := mfi.valid }

    val reqMux = Module(new TLBusMux(new BusMasterBundle, nrBusMaster))
    reqMux.io.in.zip(mf.in).foreach{ case(ri, mfi) => ri <> mfi }
    reqMux.io.choseOH := reqArb.io.grantOH.asTypeOf(Vec(nrBusMaster, Bool()))

    val ppBuf = Module(new PingPongBuf(new BusMasterBundle))
    ppBuf.io.in <> reqMux.io.out
    // mf.in.zip(reqMux.io.choseOH).foreach{ case(mfi, chose) => mfi.ready := ppBuf.io.in.ready && chose }

    val bufData = Mux(ppBuf.io.out.fire, ppBuf.io.out.bits, RegEnable(ppBuf.io.out.bits, ppBuf.io.out.fire))
    val bufSource = bufData.source
    val bufAddress = bufData.address
    val pendingMasterOH = UIntToOH(bufSource, nrBusMaster) // pending request's sourceID, the request is watting for ack
    val pendingReq = RegInit(false.B)
    
    val addrDec = Module(new TLAddrDecode(nrBusSlave))
    val pendingSlaveOH = addrDec.io.choseOH
    addrDec.io.addr := bufAddress

    val slaveRecVec = sf.in.map{ sfi => sfi.fire }
    val slaveRecv = Cat(pendingSlaveOH.zip(slaveRecVec).map{ case(p, sr) => p & sr }).orR
    when(ppBuf.io.out.fire) { pendingReq := true.B }

    val masterRecvVec = Cat(mf.out.map{ mfo => mfo.fire }.reverse) // master face output is fired // ! NOTICE: use .reverse for the correct bit sequence
    val pendingFree = (masterRecvVec & pendingMasterOH).orR
    when(pendingFree){ pendingReq := false.B }

    ppBuf.io.out.ready := !pendingReq

    sf.in.zipWithIndex.foreach{ case(si, i) => 
        si.bits  := bufData 
        si.valid := pendingSlaveOH(i)
    }
    
    val slaveMux = Module(new TLBusMux(new BusSlaveBundle, nrBusSlave))
    slaveMux.io.in <> sf.out
    slaveMux.io.choseOH := pendingSlaveOH

    mf.out.zipWithIndex.foreach{ case(mo, i) => 
        mo.bits <> slaveMux.io.out.bits
        mo.valid := slaveMux.io.out.valid && pendingMasterOH(i)
    }
    slaveMux.io.out.ready := Mux1H(pendingMasterOH, mf.out.map{ mo => mo.ready})
}

object TLXbarGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the TLXbar hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new TLXbar()(defaultConfig), Array("--target-dir", "build"))
}

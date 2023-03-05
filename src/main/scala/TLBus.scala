package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

object BusMasterId {
    def ID_ROM = 0.U
    def ID_RAM = 1.U
}

object BusReq {
    def Get = 4.U
    def PutFullData = 2.U
    def PutPartialData = 3.U

    def isPut(req: UInt): Bool = {
        req(1).asBool
    }
}

import BusReq._
import BusMasterId._

// req, tl-ul channel a
class BusMasterBundle()(implicit val p: Parameters) extends MyBundle{
    val opcode = UInt(3.W)
    val param = UInt(3.W)
    val size = UInt(log2Ceil(busBeatSize / 8).W)
    val source = UInt(log2Ceil(nrBusMaster).W)
    val address = UInt(xlen.W)
    val mask = UInt((busBeatSize / 8).W)
    val corrupt = Bool()
    val data = UInt(busBeatSize.W)
    // val sink = UInt(log2Ceil(nrBusMaster).W)
}

// resp, tl-ul channel d
class BusSlaveBundle()(implicit val p: Parameters) extends MyBundle{
    val opcode = UInt(3.W)
    val param = UInt(3.W)
    val size = UInt(log2Ceil(busBeatSize / 8).W)
    val source = UInt(log2Ceil(nrBusMaster).W)
    val sink = UInt(log2Ceil(nrBusSlave).W)
    val denied = Bool()
    val corrupt = Bool()
    val data = UInt(busBeatSize.W)
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

class BusXbarIO()(implicit val p: Parameters) extends MyBundle{
    val masterFace = (new Bundle{
        val in = Flipped(Vec(nrBusMaster, Decoupled(new BusMasterBundle)))
        val out = Vec(nrBusMaster, Decoupled(new BusSlaveBundle))
    })
    val slaveFace = (new Bundle{
        val in = Vec(nrBusSlave, Decoupled(new BusMasterBundle))
        val out = Flipped(Vec(nrBusSlave, Decoupled(new BusSlaveBundle)))
    })
}

/*        (slave resp)    (master req)
              /|\            |
masterFace:    |   ==> out  \|/ ==> in   
        ---------------------------------
        |            BusXbar            |
        ---------------------------------
slaveFace:    /|\            |
               |   ==> out  \|/  ==> in
         (slave resp)    (master req)

source(a.k.a. masterID):  send and assign from [Master], it is used for [Slave] to find a specific [Master] for the bus respond info. 
            [Master] --> [BusXbar] --> [Slave]
sinkID(a.k.a. slaveID):  send and assign from [Slave], it is used for [Master] to find a specific [Slave] for the bus respond(some opcode may use double handshake) info.
            [Master] <-- [BusXbar] <-- [Slave]
*/
class BusXbar()(implicit val p: Parameters) extends MyModule {
    val io = IO(new BusXbarIO)

    def mappingRegion(address: UInt, start: UInt, end: UInt): Bool = {
        val valid = WireInit(false.B)
        when(address >= start && address < end) {
            valid := true.B
        }.otherwise {
            valid := false.B
        }
        valid
    }

    def choseValid(idx: Int, valid: Bool, gen: Vec[DecoupledIO[BusMasterBundle]]): Unit = {
        gen.zipWithIndex.foreach{ case(g, i) => 
            if(i == idx) 
                g.valid := valid
            else
                g.valid := false.B
        }
    }
    
    // TODO: RRArbiter round robin
    val masterArb = Module(new Arbiter(new BusMasterBundle, nrBusMaster))
    val mArbOut = masterArb.io.out
    masterArb.io.in.zip(io.masterFace.in).foreach{ case (in, out) => in <> out }

    // memory mapping 
    io.slaveFace.in.foreach{ s =>
        s.bits <> mArbOut.bits
    }
    when(mappingRegion(mArbOut.bits.address, memRomBegin.U, memRomEnd.U)) { // ROM
        choseValid(0, mArbOut.valid, io.slaveFace.in)
        mArbOut.ready := io.slaveFace.in(0).ready
    }.elsewhen(mappingRegion(mArbOut.bits.address, memRamBegin.U, memRamEnd.U)) { // RAM
        choseValid(1, mArbOut.valid, io.slaveFace.in)
        mArbOut.ready := io.slaveFace.in(1).ready
    }.otherwise{ // default
        choseValid(0, false.B, io.slaveFace.in)
        mArbOut.ready := false.B
    }

    val slaveArb = Module(new Arbiter(new BusSlaveBundle, nrBusSlave))
    val sArbOut = slaveArb.io.out
    slaveArb.io.in.zip(io.slaveFace.out).foreach{ case (in, out) => in <> out }

    val slaveChosenVec = UIntToOH(sArbOut.bits.source)
    io.masterFace.out.zipWithIndex.foreach { case(out, i) =>
        out.valid := slaveChosenVec(i)
        sArbOut.ready := out.ready && slaveChosenVec(i)
        out.bits <> sArbOut.bits
    }
}

class BusCrossBar()(implicit val p: Parameters) extends MyModule {
    val io = IO(new BusXbarIO)

    def mappingRegion(address: UInt, start: UInt, end: UInt): Bool = {
        val valid = WireInit(false.B)
        when(address >= start && address < end) {
            valid := true.B
        }.otherwise {
            valid := false.B
        }
        valid
    }

    def mappingChose(address: UInt): UInt = {
        val choseOH = Wire(UInt(nrBusSlave.W))
        when(mappingRegion(address, memRomBegin.U, memRomEnd.U)) { // ROM
            choseOH := UIntToOH(0.U)
        }.elsewhen(mappingRegion(address, memRamBegin.U, memRamEnd.U)) { // RAM
            choseOH := UIntToOH(1.U)
        }.otherwise { // default
            choseOH := UIntToOH(0.U)
        }
        choseOH
    }

    def sourceChose(id: UInt): UInt = {
        val choseOH = Wire(UInt(nrBusMaster.W))
        choseOH := UIntToOH(id)
        choseOH
    }
    
    val mf = io.masterFace
    val sf = io.slaveFace

    // master --> slave
    val slaveArbs = Seq.fill(nrBusSlave)(Module(new Arbiter(new BusMasterBundle, nrBusMaster)))
    for(i <- 0 until nrBusSlave) {
        slaveArbs(i).io.in.zip(mf.in).foreach{ case (sa, mi) => 
            val masterChose = mappingChose(mi.bits.address)(i)
            sa.bits <> mi.bits
            sa.valid := masterChose && mi.valid
            mi.ready := masterChose && sa.ready
        }
        slaveArbs(i).io.out <> sf.in(i)
    }

    // master <-- slave
    val masterArbs = Seq.fill(nrBusMaster)(Module(new Arbiter(new BusSlaveBundle, nrBusSlave)))
    for(i <- 0 until nrBusMaster) {
        masterArbs(i).io.in.zip(sf.out).foreach{ case (ma, so) => 
            val slaveChose = sourceChose(so.bits.source)(i)
            ma.bits <> so.bits
            ma.valid := slaveChose && so.valid
            so.ready := slaveChose && ma.ready
        }
        masterArbs(i).io.out <> mf.out(i)
        // dontTouch(masterArbs(i).io.out)
    }

}

object BusXbarGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the BusXbar hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new BusXbar()(defaultConfig), Array("--target-dir", "build"))
}

object BusCrossBarGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the BusCrossBar hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new BusCrossBar()(defaultConfig), Array("--target-dir", "build"))
}


import chiseltest._

object BusXbarRawTest extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    chiseltest.RawTester.test(new BusXbar()(defaultConfig)) { c =>
        def masterFaceIssue(valid: UInt, data: UInt, address: UInt, typ: UInt): Unit = {
            c.io.masterFace.in.zipWithIndex.foreach{ case (m, i) =>
                m.valid.poke(valid)
                m.bits.data.poke(data)
                m.bits.address.poke(address)
                m.bits.opcode.poke(typ)
                m.bits.source.poke(i.U)
            }
        }
        
        val mf = c.io.masterFace
        val sf = c.io.slaveFace

        masterFaceIssue(true.B, 10.U, 1.U, 1.U)
        sf.in.foreach{s => 
            s.bits.data.expect(10.U)
            s.bits.address.expect(1.U)
            s.bits.opcode.expect(1.U)
        }
        sf.in(0).valid.expect(true.B)

        masterFaceIssue(true.B, 20.U, "h0000_2000".U, 2.U)
        sf.in.foreach{s => 
            s.bits.data.expect(20.U)
            s.bits.address.expect("h0000_2000".U)
            s.bits.opcode.expect(2.U)
        }
        sf.in(1).valid.expect(true.B)

        println("PASS!");
    }
}
package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec
import chisel3.util.RegEnable
import chisel3.util.random.LFSR
import chisel3.util.Counter
import chisel3.util.log2Ceil

import scala.util.Random.nextInt

/*
    ICache  DCache
    |       |
    xxxxxxxxxxxxxxxxxxxxxxxxxx--> xbar
        |       |
        ROM     RAM
*/
class DCacheWithBus()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val read = new CacheReadBus
        val write = new CacheWriteBus

        val read2 = new CacheReadBus // icache
    })

    val dcache = Module(new DCache)
    val icache = Module(new ICache)
    val xbar = Module(new TLXbar)
    val rom = Module(new SingleROM)
    val ram = Module(new SingleRAM)

    xbar.io <> DontCare
    rom.io <> DontCare
    ram.io <> DontCare 

    dcache.io.read <> io.read
    dcache.io.write <> io.write
    dcache.io.tlbus.req <> xbar.io.masterFace.in(1)
    dcache.io.tlbus.resp <> xbar.io.masterFace.out(1)

    io.read2 <> DontCare
    icache.io.write <> DontCare
    icache.io.read <> io.read2
    icache.io.tlbus.req <> xbar.io.masterFace.in(0)
    icache.io.tlbus.resp <> xbar.io.masterFace.out(0)

    rom.io.req <> xbar.io.slaveFace.in(0)
    rom.io.resp <> xbar.io.slaveFace.out(0)

    ram.io.req <> xbar.io.slaveFace.in(1)
    ram.io.resp <> xbar.io.slaveFace.out(1)

    // val romReq = xbar.io.slaveFace.in(0)
    // val romResp = xbar.io.slaveFace.out(0)
    // // rom.io.clock := clock
    // // rom.io.reset := reset

    // val romBusy = RegInit(false.B)
    // when(romReq.fire) {
    //     romBusy := true.B
    // }
    // romReq.ready := !romBusy
    
    // val romReqValReg = RegEnable(romReq.bits, romReq.fire)
    // val romReqVal = Mux(romReq.fire, romReq.bits, romReqValReg)
    // val reqSize = romReqVal.size >> log2Ceil(busBeatSize)
    // val beatCounter = Counter((0 until 10), romBusy && romResp.fire, romReq.fire)
    // val beatCount = beatCounter._1

    // // rom.io.raddr := romReqVal.address - memRamBegin.U
    // val lfsr = LFSR(32)
    // romResp.bits.data := lfsr + romReqVal.address
    // romResp.valid := romBusy
    // romResp.bits.opcode := Mux(romReqVal.opcode === BusReq.Get, BusReq.AccessAckData, BusReq.AccessAck)

    // when(romResp.fire && beatCount === reqSize - 1.U) {
    //     romBusy := false.B
    // }

}


/*
    LSU---->DCache
            |
    xxxxxxxxxxxxxxxxxxxxxxxxxx--> xbar
        |       |
        ROM     RAM
*/
class LSUWithBus()(implicit val p: Parameters) extends MyModule {
    val io = IO(new LsuIO_1)

    io <> DontCare

    val lsu = Module(new LSU_1)
    val xbar = Module(new TLXbar)
    val dcache = Module(new DCache)
    val rom = Module(new SingleROM)
    val ram = Module(new SingleRAM)

    xbar.io <> DontCare
    rom.io <> DontCare
    ram.io <> DontCare 

    lsu.io.excp <> io.excp
    lsu.io.req <> io.req
    lsu.io.resp <> io.resp
    lsu.io.cache.read <> dcache.io.read
    lsu.io.cache.write <> dcache.io.write
    

    dcache.io.tlbus.req <> xbar.io.masterFace.in(1)
    dcache.io.tlbus.resp <> xbar.io.masterFace.out(1)
    
    rom.io.req <> xbar.io.slaveFace.in(0)
    rom.io.resp <> xbar.io.slaveFace.out(0)

    ram.io.req <> xbar.io.slaveFace.in(1)
    ram.io.resp <> xbar.io.slaveFace.out(1)

    
}


class BusTest extends AnyFlatSpec with ChiselScalatestTester {

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false,
            nrBusMaster = 3
        )
    })

    implicit val p = defaultConfig

    behavior of "Bus"

    // it should "test TLBusMux" in {
    //     test(new TLBusMux(new BusMasterBundle, 3)(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
    //         def slaveChose(sel: Seq[Int]): Unit = {
    //             sel.zipWithIndex.foreach{ case(s, i) =>
    //                 c.io.choseOH(i).poke(s)
    //             }
    //         }

    //         c.io.in(0).bits.data.poke(100)
    //         c.io.in(1).bits.data.poke(200)
    //         c.io.in(2).bits.data.poke(300)
    //         c.io.out.ready.poke(1)
            
    //         slaveChose(Seq(0, 0, 1))
    //         c.io.out.bits.data.expect(300)
    //         c.io.in(2).ready.expect(1)

    //         slaveChose(Seq(0, 1, 0))
    //         c.io.out.bits.data.expect(200)
    //         c.io.in(1).ready.expect(1)

    //         c.io.out.ready.poke(0)
    //         slaveChose(Seq(1, 0, 0))
    //         c.io.out.bits.data.expect(100)
    //         c.io.in(0).ready.expect(0)

    //         // slaveChose(Seq(1, 1, 0))
    //         println("PASS")
    //     }
    // }

    // it should "test TLBusArbiter" in {
    //     test(new TLBusArbiter(2)(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 

    //         c.io.reqs(0).poke(1)
    //         c.io.reqs(1).poke(1)

    //         c.clock.step()

    //         c.io.grantOH.expect("b10".U)
            
    //         c.io.reqs(0).poke(1)
    //         c.io.reqs(1).poke(0)
    //         c.clock.step()

    //         c.io.grantOH.expect("b01".U)

    //         println("PASS")
    //     }
    // }


    // it should "test TLAddrDecode" in {
    //     test(new TLAddrDecode(2)(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 

    //         c.io.addr.poke(0x00000000)
    //         c.io.choseOH(0).expect(1)
    //         c.io.choseOH(1).expect(0)
    //         c.io.addr.poke(0x00003000)
    //         c.io.choseOH(0).expect(0)
    //         c.io.choseOH(1).expect(1)

    //         println("PASS")
    //     }
    // }

    val defaultConfig2 = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false,
            nrBusMaster = 2,
            dcacheBlockSize = 4,
        )
    })

    it should "test TLXbar" in { 
        test(new TLXbar()(defaultConfig2)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
            val mf = c.io.masterFace
            val sf = c.io.slaveFace

            val beatByte = 4

            def init() = {
                sf.in.foreach(i => i.ready.poke(1))
                mf.out.foreach(i => i.ready.poke(1))
                c.clock.step(10)
            }

            def mfWaitReady(mfid: Int) = {
                while(!mf.in(mfid).ready.peekBoolean()){
                    c.clock.step()
                }
            }

            def sfWaitReady(mfid: Int) = {
                while(!sf.out(mfid).ready.peekBoolean()){
                    c.clock.step()
                }
            }
            
            def mfIssue(mfid: Int, data: Int, addr: Int, opcode: Int, beatNum: Int): Unit = {
                mf.in(mfid).valid.poke(1)
                mfWaitReady(mfid)
                mf.in(mfid).bits.data.poke(data)
                mf.in(mfid).bits.address.poke(addr)
                mf.in(mfid).bits.opcode.poke(opcode)
                mf.in(mfid).bits.source.poke(mfid)
                mf.in(mfid).bits.size.poke(beatNum*beatByte)
                c.clock.step()
                mf.in(mfid).valid.poke(0)
            }

            def sfIssue(sfid: Int, data: Int, opcode: Int): Unit = {
                sf.out(sfid).valid.poke(1)
                sfWaitReady(sfid)
                sf.out(sfid).bits.data.poke(data)
                sf.out(sfid).bits.source.poke(sfid)
                sf.out(sfid).bits.opcode.poke(opcode)
                c.clock.step()
                sf.out(sfid).valid.poke(0)
            }

            def randData() = nextInt(1000)
            
            def putRandomData(addr: Int, beatNum: Int) = {
                for( i <- 0 until beatNum) {
                    mfIssue(1, randData, addr + beatByte * i, 2, beatNum) // PutFullData
                }
                // c.clock.step()
            }

            init()

            putRandomData(0, 8)
            sfIssue(0, 0, 0) // AccessAck

            putRandomData(1024, 8)
            c.clock.step()
            sfIssue(0, 0, 0) // AccessAck
            
            c.clock.step(10)
            putRandomData(0, 8)
            putRandomData(1024, 8)
            sfIssue(0, 0, 0) // AccessAck
            sfIssue(0, 0, 0) // AccessAck


            c.clock.step(100)
        }
    }

    // it should "test Dcache with Bus" in { 
    //     test(new DCacheWithBus()(defaultConfig2)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
    //         def init(): Unit = {
    //             c.io.write.resp.ready.poke(1)
    //             c.io.read.resp.ready.poke(1)
    //             c.io.read2.resp.ready.poke(1)
    //         }

    //         def read(addr: Int): Unit = { // read dcache
    //             c.io.read.req.valid.poke(1)
    //             c.io.read.req.bits.addr.poke(addr)
    //             c.clock.step()
    //             c.io.read.req.valid.poke(0)
    //         }

    //         def read2(addr: Int): Unit = { // read icache
    //             c.io.read2.req.valid.poke(1)
    //             c.io.read2.req.bits.addr.poke(addr)
    //             c.clock.step()
    //             c.io.read2.req.valid.poke(0)
    //         }

    //         def write(addr: Int, data: Int, mask: UInt): Unit = { // write dcache
    //             c.io.write.req.valid.poke(1)
    //             c.io.write.req.bits.addr.poke(addr)
    //             c.io.write.req.bits.data.poke(data)
    //             c.io.write.req.bits.mask.poke(mask)
    //             c.clock.step()
    //             c.io.write.req.valid.poke(0)
    //         }

    //         init()
    //         c.clock.step(10)

    //         val cacheMissPenalty = 5

    //         // test dcache read
    //         read(0)
    //         c.clock.step(cacheMissPenalty)

    //         read(8)
    //         c.clock.step(cacheMissPenalty)

    //         read(0)
    //         c.clock.step()

    //         read(12)
    //         c.clock.step()


    //         // test icache read
    //         read2(0x2000)
    //         c.clock.step(cacheMissPenalty)

    //         read2(0x2000 + 4)
    //         c.clock.step()

    //         read2(0)
    //         c.clock.step(cacheMissPenalty)

    //         c.clock.step(10)


    //         // test dcache write with mask
    //         write(0, 0x1234, "b1110".U)
    //         c.clock.step(2)

    //         read(0)
    //         c.clock.step()
            



    //         c.clock.step(100)
            
    //     }
    // }

    // it should "test LSU with Bus" in { 
    //     test(new LSUWithBus()(defaultConfig2)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
    //         def init(): Unit = {
    //             c.io.resp.ready.poke(1)
    //             c.clock.step(10)
    //         }

    //         def load(addr: Int, lsuOp: Int): Unit = {
    //             c.io.req.bits.addr.poke(addr)
    //             c.io.req.bits.lsuOp.poke(lsuOp) 
    //             c.io.req.valid.poke(1)
    //             c.clock.step()
    //             c.io.req.valid.poke(0)
    //         }

    //         def lb(addr: Int) = load(addr, 1)
    //         def lh(addr: Int) = load(addr, 2)
    //         def lw(addr: Int) = load(addr, 3)
    //         def lbu(addr: Int) = load(addr, 4)
    //         def lhu(addr: Int) = load(addr, 5)

    //         def store(addr: Int, data: Int, lsuOp: Int): Unit = {
    //             c.io.req.bits.addr.poke(addr)
    //             c.io.req.bits.wdata.poke(data)
    //             c.io.req.bits.lsuOp.poke(lsuOp) 
    //             c.io.req.valid.poke(1)
    //             c.clock.step()
    //             c.io.req.valid.poke(0)
    //         }

    //         def sb(addr: Int, data: Int) = store(addr, data, 6)
    //         def sh(addr: Int, data: Int) = store(addr, data, 7)
    //         def sw(addr: Int, data: Int) = store(addr, data, 8)

    //         init()
    //         lb(0)
    //         c.clock.step(8)
    //         lw(4)
    //         c.clock.step(3)

    //         lw(0x2000)
    //         c.clock.step(8)

    //         lbu(0x2002)
    //         c.clock.step(8)

    //         lh(0x2001)
    //         c.clock.step(8)



    //         c.clock.step(100)
    //     }
    // }
}
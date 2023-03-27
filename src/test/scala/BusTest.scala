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

    // it should "test TLXbar" in { 
    //     test(new TLXbar()(defaultConfig2)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
    //         val mf = c.io.masterFace
    //         val sf = c.io.slaveFace

    //         sf.in.foreach(i => i.ready.poke(1))
    //         c.clock.step(10)
            
    //         def mfIssue(mfid: Int, valid: UInt, data: UInt, addr: UInt, typ: UInt): Unit = {
    //             mf.in(mfid).valid.poke(valid)
    //             mf.in(mfid).bits.data.poke(data)
    //             mf.in(mfid).bits.address.poke(addr)
    //             mf.in(mfid).bits.opcode.poke(typ)
    //             mf.in(mfid).bits.source.poke(mfid.U)
    //         }

    //         def sfIssue(sfid: Int, valid: UInt, data: UInt): Unit = {
    //             sf.out(sfid).valid.poke(valid)
    //             sf.out(sfid).bits.data.poke(data)
    //             sf.out(sfid).bits.source.poke(sfid.U)
    //         }

    //         val Get = 4.U
    //         val PutFullData = 2.U

    //         mfIssue(0, true.B, 123.U, "h0000_0444".U, Get) // slave 0
    //         mfIssue(1, true.B, 223.U, "h0000_2500".U, Get) // slave 1
    //         c.clock.step()
    //         // mf.in(0).valid.poke(0)
    //         // mf.in(1).valid.poke(0)
    //         c.clock.step()

    //         // sf.in(1).bits.data.expect(223.U)
    //         // sf.in(1).bits.address.expect("h0000_2500".U)
    //         // sf.in(1).valid.expect(true.B)
    //         // sf.in(0).valid.expect(false.B)

    //         mfIssue(0, true.B, 123.U, "h0000_0444".U, Get) // slave 0
    //         mfIssue(1, false.B, 223.U, "h0000_2500".U, Get) // slave 1
    //         c.clock.step(2)
    //         // sf.in(0).bits.data.expect(123.U)
    //         // sf.in(0).bits.address.expect("h0000_0444".U)
    //         // sf.in(0).valid.expect(true.B)
    //         // sf.in(1).valid.expect(false.B)


    //         c.clock.step(10)
    //         println("PASS")
    //     }
    // }

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

    it should "test LSU with Bus" in { 
        test(new LSUWithBus()(defaultConfig2)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
            def init(): Unit = {
                c.io.resp.ready.poke(1)
                c.clock.step(10)
            }

            def load(addr: Int, lsuOp: Int): Unit = {
                c.io.req.bits.addr.poke(addr)
                c.io.req.bits.lsuOp.poke(lsuOp) 
                c.io.req.valid.poke(1)
                c.clock.step()
                c.io.req.valid.poke(0)
            }

            def lb(addr: Int) = load(addr, 1)
            def lh(addr: Int) = load(addr, 2)
            def lw(addr: Int) = load(addr, 3)
            def lbu(addr: Int) = load(addr, 4)
            def lhu(addr: Int) = load(addr, 5)

            def store(addr: Int, data: Int, lsuOp: Int): Unit = {
                c.io.req.bits.addr.poke(addr)
                c.io.req.bits.wdata.poke(data)
                c.io.req.bits.lsuOp.poke(lsuOp) 
                c.io.req.valid.poke(1)
                c.clock.step()
                c.io.req.valid.poke(0)
            }

            def sb(addr: Int, data: Int) = store(addr, data, 6)
            def sh(addr: Int, data: Int) = store(addr, data, 7)
            def sw(addr: Int, data: Int) = store(addr, data, 8)

            init()
            lb(0)
            c.clock.step(8)
            lw(4)
            c.clock.step(3)

            lw(0x2000)
            c.clock.step(8)

            lbu(0x2002)
            c.clock.step(8)

            lh(0x2001)
            c.clock.step(8)



            c.clock.step(100)
        }
    }
}
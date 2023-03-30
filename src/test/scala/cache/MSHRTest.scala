package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._

import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random.nextInt

class MSHR_1()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val req = Flipped(Decoupled((new MissReq)))
        val resp = new MissResp
        val tlbus = new TLMasterBusUL
    })

    val mshr = Module(new MSHR)
    val refillPipe = Module(new RefillPipe)
    val writebackQueue = Module(new WritebackQueue)

    mshr.io <> DontCare
    refillPipe.io <> DontCare
    writebackQueue.io <> DontCare

    mshr.io.req <> io.req
    mshr.io.resp <> io.resp
    mshr.io.dirWrite.req.ready := true.B
    mshr.io.dataWrite.req.ready := true.B

    refillPipe.io.req <> mshr.io.tasks.refill.req
    refillPipe.io.resp <> mshr.io.tasks.refill.resp
    refillPipe.io.dirWrite.req.ready := true.B
    refillPipe.io.dataWrite.req.ready := true.B


    writebackQueue.io.req <> mshr.io.tasks.writeback.req
    writebackQueue.io.resp <> mshr.io.tasks.writeback.resp

    
    val reqArb = Module(new Arbiter(chiselTypeOf(io.tlbus.req.bits), 2))
    reqArb.io.in(0) <> writebackQueue.io.tlbus.req
    reqArb.io.in(1) <> refillPipe.io.tlbus.req
    io.tlbus.req <> reqArb.io.out

    writebackQueue.io.tlbus.resp.bits := io.tlbus.resp.bits
    refillPipe.io.tlbus.resp.bits := io.tlbus.resp.bits
    when(io.tlbus.resp.bits.opcode === BusReq.AccessAck) {
        io.tlbus.resp.ready := writebackQueue.io.tlbus.resp.ready
        writebackQueue.io.tlbus.resp.valid := io.tlbus.resp.valid
    }.elsewhen(io.tlbus.resp.bits.opcode === BusReq.AccessAckData) {
        io.tlbus.resp.ready := refillPipe.io.tlbus.resp.ready
        refillPipe.io.tlbus.resp.valid := io.tlbus.resp.valid
    }.otherwise{
        io.tlbus.resp.ready := false.B
        writebackQueue.io.tlbus.resp.valid := false.B
        refillPipe.io.tlbus.resp.valid := false.B
    }

}


class MSHRTest extends AnyFlatSpec with ChiselScalatestTester {
    behavior of "MSHRTest"

    val annos = Seq(WriteVcdAnnotation)

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    it should "test MSHR" in {
        test(new MSHR_1()(defaultConfig)).withAnnotations(annos) { c => 

            def init() = {
                c.io.tlbus.req.ready.poke(1)
                c.io.resp.load.ready.poke(1)
                c.io.resp.store.ready.poke(1)
            }

            def randData() = nextInt(1000)

            def allocMSHR(addr: Int, isDirtyWay: Boolean, dirtyTag: Int, chosenWay: UInt, hit: Boolean, isStore: Boolean, storeData: Int, storeMask: UInt) = {
                c.io.req.valid.poke(1)
                c.io.req.bits.addr.poke(addr)
                c.io.req.bits.data.foreach( i => i.poke(randData))
                c.io.req.bits.dirInfo.chosenWay.poke((chosenWay))
                c.io.req.bits.dirInfo.dirtyTag.poke(dirtyTag)
                c.io.req.bits.dirInfo.hit.poke(hit)
                c.io.req.bits.isStore.poke(isStore)
                c.io.req.bits.storeData.poke(storeData)
                c.io.req.bits.storeMask.poke(storeMask)
                c.io.req.bits.dirInfo.isDirtyWay.poke(isDirtyWay)
                c.clock.step()
                c.io.req.valid.poke(0)
            }

            def tlbusRefillData(beatNum: Int, randDly: Boolean = true) = {
                while(!c.io.tlbus.req.valid.peekBoolean()) { c.clock.step() }
                c.clock.step()
                for(i <- 0 until beatNum) {
                    if(nextInt(2) == 1 && randDly){
                        c.io.tlbus.resp.valid.poke(0)
                        c.clock.step(nextInt(10))
                    }
                    c.io.tlbus.resp.valid.poke(1)
                    c.io.tlbus.resp.bits.opcode.poke(1) // AccessAckData
                    c.io.tlbus.resp.bits.data.poke(randData)
                    c.clock.step()
                }
                c.io.tlbus.resp.valid.poke(0)
            }

            def tlbusReqRandDly() = {
                c.io.tlbus.req.ready.poke(0)
                c.clock.step(nextInt(10))
                c.io.tlbus.req.ready.poke(1)
            }

            def tlbusRespWriteback(beatNum: Int, randDly: Boolean = false) = {
                while(!c.io.tlbus.req.valid.peekBoolean()) { c.clock.step() }
                c.clock.step()
                c.io.tlbus.req.ready.poke(1)
                for( i <- 0 until beatNum-1) {
                    while(!c.io.tlbus.req.valid.peekBoolean()) c.clock.step()
                    if(randDly) tlbusReqRandDly()
                    c.clock.step()
                }
                c.io.tlbus.resp.bits.opcode.poke(0) // AccessAck
                c.io.tlbus.resp.valid.poke(1)
                c.clock.step()
                c.io.tlbus.resp.valid.poke(0)
            }

            init()
            c.clock.step(10)

            // load miss clean
            allocMSHR(0, isDirtyWay =  false, 0, "b1000".U, false, isStore = false, storeData = randData, "b1111".U)
            tlbusRefillData(4,false)
            c.clock.step()

            // load miss dirty
            allocMSHR(0, isDirtyWay =  true, 0, "b1000".U, false, isStore = false, storeData = randData, "b1111".U)
            tlbusRespWriteback(4)
            tlbusRefillData(4,false)
            c.clock.step()

            // store miss clean
            allocMSHR(0, isDirtyWay =  false, 0, "b1000".U, false, isStore = true, storeData = randData, "b1111".U)
            tlbusRefillData(4,false)
            c.clock.step()
            c.clock.step()

            // store miss dirty
            allocMSHR(0, isDirtyWay =  true, 0, "b1000".U, false, isStore = true, storeData = randData, "b1111".U)
            tlbusRespWriteback(4)
            tlbusRefillData(4,false)
            c.clock.step()
            c.clock.step()

            c.clock.step(200)
        }
    }
}
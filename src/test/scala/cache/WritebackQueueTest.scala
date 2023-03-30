package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec

import scala.util.Random.nextInt


class WritebackQueueTest extends AnyFlatSpec with ChiselScalatestTester {
    behavior of "WritebackQueue"

    val annos = Seq(WriteVcdAnnotation)

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    it should "test WritebackQueue" in {
        test(new WritebackQueue()(defaultConfig)).withAnnotations(annos) { c => 

            def init() = {
                c.io.resp.ready.poke(1)
                c.io.tlbus.req.ready.poke(1)
            }

            def randData() = nextInt(1000)

            def writebackData(addr: Int, dirtyTag: Int) = {
                c.io.req.valid.poke(1)
                while(!c.io.req.ready.peekBoolean()) c.clock.step()
                c.io.req.bits.addr.poke(addr)
                c.io.req.bits.dirtyTag.poke(dirtyTag)
                c.io.req.bits.data.foreach( i => i.poke(randData))
                c.clock.step()
                c.io.req.valid.poke(0)
            }

            def tlbusReqRandDly() = {
                c.io.tlbus.req.ready.poke(0)
                c.clock.step(nextInt(10))
                c.io.tlbus.req.ready.poke(1)
            }

            def tlbusRespWriteback(beatNum: Int, randDly: Boolean = false) = {
                c.io.tlbus.req.ready.poke(1)
                for( i <- 0 until beatNum-1) {
                    while(!c.io.tlbus.req.valid.peekBoolean()) c.clock.step()
                    if(randDly) tlbusReqRandDly()
                    c.clock.step()
                }
                c.io.tlbus.resp.valid.poke(1)
                c.clock.step()
                c.io.tlbus.resp.valid.poke(0)
            }

            init()
            c.clock.step(10)
            writebackData(0x1234, 0x02)
            tlbusRespWriteback(4)

            c.clock.step(4)

            writebackData(0x2345, 0x12)
            tlbusRespWriteback(4, true)
            writebackData(0x4567, 0x22)
            tlbusRespWriteback(4)
            

            c.clock.step(200)
        }
    }
}
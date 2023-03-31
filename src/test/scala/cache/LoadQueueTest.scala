package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._

import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random.nextInt

class LoadQueueTest extends AnyFlatSpec with ChiselScalatestTester {
    behavior of "LoadQueueTest"

    val annos = Seq(WriteVcdAnnotation)

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    it should "test LoadQueue" in {
        test(new LoadQueue(UInt(32.W))(defaultConfig)).withAnnotations(annos) { c => 

            def init() = {
                c.io.deq.ready.poke(0)
            }

            def randData() = nextInt(1000)

            def enq(addr: Int) = {
                c.io.enq.valid.poke(1)
                c.io.enq.bits.poke(randData())
                c.io.inAddr.poke(addr)
                c.clock.step()
                c.io.enq.valid.poke(0)
            }

            def deq() = {
                c.io.deq.ready.poke(1)
                c.clock.step()
                c.io.deq.ready.poke(0)
            }

            def refillFire(addr: Int) = {
                c.io.refillInfo.reqFire.poke(1)
                c.io.refillInfo.reqAddr.poke(addr)
                c.clock.step()
                // c.io.refillInfo.reqFire.poke(0)
            }

            def refillResp() = {
                c.io.refillInfo.reqFire.poke(0)
                c.io.refillInfo.respFire.poke(1)
                c.clock.step()
                c.io.refillInfo.respFire.poke(0)
            }



            init()
            c.clock.step(10)
            enq(0x1000)
            enq(0x1004)
            enq(0x1008)
            enq(0x100C)
            refillFire(0x1000)
            c.clock.step()
            refillResp()

            deq()
            deq()
            deq()

            c.clock.step()

            enq(0x1000)
            enq(0x1020)
            enq(0x1030)
            enq(0x1040)
            enq(0x1050)
            
            deq()
            deq()
            deq()
            deq()
            deq()
            

            c.clock.step(200)
        }
    }
}
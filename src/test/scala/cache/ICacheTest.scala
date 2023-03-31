package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._

import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random.nextInt

class ICacheTest extends AnyFlatSpec with ChiselScalatestTester {
    behavior of "ICacheTest"

    val annos = Seq(WriteVcdAnnotation)

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false,
            dcacheSets = 16,
            dcacheBlockSize = 4,
            dcacheWays = 4
        )
    })

    it should "test ICache" in {
        test(new ICache()(defaultConfig)).withAnnotations(annos) { c => 

            def init() = {
                c.io.tlbus.req.ready.poke(1)
                c.io.read.resp.ready.poke(1)
            }

            def randData() = nextInt(1000)

            def load(addr: Int) = {
                c.io.read.req.valid.poke(1)
                c.io.read.req.bits.addr.poke(addr)
                c.clock.step()
                c.io.read.req.valid.poke(0)
            }

            def tlbusRefillData(beatNum: Int, randDly: Boolean = true) = {
                for(i <- 0 until beatNum) {
                    // while(!c.io.resp.ready.peekBoolean()) { c.clock.step() }
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

            init()
            c.clock.step(10)
            // load(0x1000)
            // c.clock.step(2)
            // tlbusRefillData(4, false)
            
            // c.clock.step()
            // load(0x1000)

            c.clock.step(10)

            fork{
                load(0x1000)
                load(0x1004)
                load(0x1008)
                load(0x100C)

                load(0x2008)
                load(0x2000)
                load(0x1000)
                load(0x100C)
            }.fork{
                while(!c.io.tlbus.req.valid.peekBoolean()) c.clock.step()
                c.clock.step()
                tlbusRefillData(4, false)
                
                while(!c.io.tlbus.req.valid.peekBoolean()) c.clock.step()
                c.clock.step()
                tlbusRefillData(4, false)
            }.join()

            c.clock.step(200)
        }
    }
}
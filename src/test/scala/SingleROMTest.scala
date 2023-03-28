package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec

import scala.util.Random.nextInt
import scala.collection.mutable


class SingleROMTest extends AnyFlatSpec with ChiselScalatestTester {

    behavior of "SingleROM"

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    it should "test SingleROM" in {
        test(new SingleROM()(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
            def init() = {
                c.io.resp.ready.poke(1)
            }

            def randData() = nextInt(1000)

            val beatByte = 4
            def putRandomData(addr: Int, beatNum: Int) = {
                c.io.req.valid.poke(1)
                c.io.req.bits.opcode.poke(2) // PutFullData
                c.io.req.bits.size.poke(beatNum*beatByte)
                for( i <- 0 until beatNum) {
                    c.io.req.bits.address.poke(addr + beatByte * i)
                    c.io.req.bits.data.poke(randData)
                    c.clock.step()
                }
                c.io.req.valid.poke(0)
            }

            def get(addr: Int, beatNum: Int) = {
                c.io.req.valid.poke(1)
                c.io.req.bits.address.poke(addr)
                c.io.req.bits.opcode.poke(4) // Get
                c.io.req.bits.size.poke(beatNum*beatByte)
                c.clock.step()
                c.io.req.valid.poke(0)
            }

            init()
            c.clock.step(10)

            putRandomData(0, 8)  

            while(!c.io.req.ready.peekBoolean()) { c.clock.step() }
            // c.clock.step(5)
            get(0, 8)
            c.io.resp.ready.poke(0)
            c.clock.step(10)
            c.io.resp.ready.poke(1)

            c.clock.step(100)
        }
    }
}
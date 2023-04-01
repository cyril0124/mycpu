package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec

import scala.util.Random.nextInt
import scala.collection.mutable
import scala.math


class SingleROMTest extends AnyFlatSpec with ChiselScalatestTester {

    behavior of "SingleROM"
    val busBeatSize = 8

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false,
            busBeatSize = busBeatSize
        )
    })

    it should "test SingleROM" in {
        test(new SingleROM()(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
            var scoreboard: mutable.Map[Int, Int] = mutable.Map() // addr -> data

            def init() = {
                c.io.resp.ready.poke(1)
            }

            def randData() = nextInt(math.pow(2, busBeatSize*8-1).toInt)

            def putRandomData(addr: Int, beatNum: Int) = {
                c.io.req.valid.poke(1)
                c.io.req.bits.opcode.poke(2) // PutFullData
                c.io.req.bits.size.poke(beatNum*busBeatSize)
                for( i <- 0 until beatNum) {
                    val address = addr + busBeatSize * i
                    val data = randData
                    c.io.req.bits.address.poke(address)
                    c.io.req.bits.data.poke(data)
                    c.clock.step()
                }
                c.io.req.valid.poke(0)
            }

            def get(addr: Int, beatNum: Int) = {
                c.io.req.valid.poke(1)
                c.io.req.bits.address.poke(addr)
                c.io.req.bits.opcode.poke(4) // Get
                c.io.req.bits.size.poke(beatNum*busBeatSize)
                c.clock.step()
                c.io.req.valid.poke(0)
            }

            def putRandomDataCheck(addr: Int, beatNum: Int) = {
                c.io.req.valid.poke(1)
                c.io.req.bits.opcode.poke(2) // PutFullData
                c.io.req.bits.size.poke(beatNum*busBeatSize)
                for( i <- 0 until beatNum) {
                    val address = addr + busBeatSize * i
                    val data = randData
                    c.io.req.bits.address.poke(address)
                    c.io.req.bits.data.poke(data)
                    scoreboard += (address -> data)
                    c.clock.step()
                }
                c.io.req.valid.poke(0)

                c.clock.step()
                get(addr, beatNum)
                while(!c.io.resp.valid.peekBoolean()) c.clock.step()
                for(i <- 0 until beatNum) {
                    val address = addr + busBeatSize * i
                    c.io.resp.bits.data.expect(scoreboard(address))
                    c.clock.step()
                }
            }

            

            init()
            c.clock.step(10)

            // // put single
            // putRandomData(0, 1)
            // c.clock.step()
            // // put multi
            // putRandomData(0, 4)
            // c.clock.step()
            // // get single 
            // get(0x5600, 1)
            // c.clock.step()
            // // get multi
            // get(0x0000, 4)
            // c.clock.step(10)
            
            putRandomDataCheck(0, 4)
            putRandomDataCheck(0x1200, 8)
            putRandomDataCheck(0x4099, 8)

            c.clock.step(100)
        }
    }
}
package mycpu

import chisel3._
import chiseltest._
import chiseltest.iotesters
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec

import scala.util.Random.nextInt




class RefillPipeTest extends AnyFlatSpec with ChiselScalatestTester {
    behavior of "RefillPipe"

    val annos = Seq(WriteVcdAnnotation)

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    it should "test RefillPipe" in {
        test(new RefillPipe()(defaultConfig)).withAnnotations(annos) { c => 

            def init() = {
                c.io.resp.ready.poke(1)
                c.io.tlbus.req.ready.poke(1)
                c.io.dirWrite.req.ready.poke(1)
                c.io.dataWrite.req.ready.poke(1)
            }

            def sendRefill(addr: Int, chosenWay: UInt) = {
                c.io.req.valid.poke(1)
                c.io.req.bits.addr.poke(addr)
                c.io.req.bits.chosenWay.poke(chosenWay)
                c.clock.step()
                c.io.req.valid.poke(0)
            }

            def tlbusRandDly() = {
                c.io.tlbus.req.ready.poke(0)
                c.clock.step(nextInt(10))
                c.io.tlbus.req.ready.poke(1)
            }
            
            def randData = nextInt(1000)
            
            def tlbusRefillData(beatNum: Int, randDly: Boolean = true) = {
                for(i <- 0 until beatNum) {
                    while(!c.io.resp.ready.peekBoolean()) { c.clock.step() }
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

            fork{
                sendRefill(0x1234, "b1111".U)
            }.fork{
                tlbusRandDly()
            }.join()

            c.clock.step()
            tlbusRefillData(4)



            c.clock.step(200)
        }
    }

    it should "test TLSerializer" in {
        test(new TLSerializer(UInt(32.W), 16)).withAnnotations(annos) { c => 
            def init() = {
                c.io.out.ready.poke(1)
                c.io.in.valid.poke(0)
            }

            def randData = nextInt(1000)

            init()
            c.clock.step(10)

            c.io.in.bits.foreach { i => i.poke(randData) }
            c.io.in.valid.poke(1)
            // c.clock.step()
            c.io.out.ready.poke(0)
            c.clock.step(nextInt(20))
            c.io.out.ready.poke(1)
            while(!c.io.fireAll.peekBoolean()) c.clock.step()
            c.clock.step()
            c.io.in.valid.poke(0)


            c.clock.step(100)
        }
    }

    it should "test TLDeSerializer" in {
        test(new TLDeSerializer(UInt(32.W), 16)).withAnnotations(annos) { c => 
            def init() = {
                c.io.out.ready.poke(1)
                c.io.in.valid.poke(0)
            }

            def randData = nextInt(1000)

            def sendBeatData(beatNum: Int) = {
                c.io.in.valid.poke(1)
                for(i <- 0 until beatNum) {
                    while(!c.io.in.ready.peekBoolean()) c.clock.step()
                    c.io.in.bits.poke(randData)
                    c.clock.step()
                }
                c.io.in.valid.poke(0)
            }

            init()
            c.clock.step(10)


            c.io.out.ready.poke(0)
            sendBeatData(16)
            c.clock.step(5)
            c.io.out.ready.poke(1)


            c.clock.step(100)
        }
    }
}
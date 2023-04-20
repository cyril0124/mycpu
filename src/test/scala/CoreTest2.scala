package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._

import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random.nextInt

class Core_1Test extends AnyFlatSpec with ChiselScalatestTester {
    behavior of "Core_1Test"

    val annos = Seq(WriteVcdAnnotation)

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false,
            busBeatSize = 16,
            logEnable = true,
        )
    })

    it should "test Core_1" in {
        test(new Core_1()(defaultConfig)).withAnnotations(annos) { c => 

            def init() = {
                // c.io.ibOutReady.poke(0)
            }

            def read(addr: Int) = {
                // c.io.readValid.poke(1)
                // c.io.readAddr.poke(addr)
                c.clock.step()
                // c.io.readValid.poke(0)
            }

            def randData() = nextInt(1000)

            init()
            c.clock.step(10)
            
            // for(i <- 0 until 20 by 4) {
            //     read(i)
            //     c.clock.step()
            // }

            // c.io.ibOutReady.poke(1)
            // c.clock.step(20)

            // c.io.readValid.poke(1)
            // c.io.brAddr.poke(0x1000)
            // c.io.brTaken.poke(1)
            // c.clock.step()
            // c.io.brTaken.poke(0)
            // c.io.ibOutReady.poke(0)

            // c.io.flush.poke(1)
            // c.clock.step()
            // c.io.flush.poke(0)


            c.clock.step(200)
        }
    }
}
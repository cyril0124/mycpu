package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec

class CoreTest extends AnyFlatSpec with ChiselScalatestTester {

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            enableDebug = false
        )
    })

    behavior of "Core"
    it should "test all " in {
        test(new Core()(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
            c.io.in.start.poke(true.B)
            c.clock.step(100)
        }
    }

}
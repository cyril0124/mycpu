package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec

import scala.io.{BufferedSource, Source}
import ujson._
import scala.sys.process.Process

import MyUtils._

class CoreTest extends AnyFlatSpec with ChiselScalatestTester {

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    behavior of "Core"

    val annos = Seq(VcsBackendAnnotation, WriteVcdAnnotation)

    it should "test some specific code " in {
        test(new SimTop()(defaultConfig)).withAnnotations(annos) { c =>
            c.io.in.start.poke(1.U)
            c.clock.step(1000)
        }
    }
}
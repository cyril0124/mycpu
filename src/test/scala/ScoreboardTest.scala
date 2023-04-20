package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._

import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random.nextInt

import FUType._
import os.read


class ScoreboardTest extends AnyFlatSpec with ChiselScalatestTester {
    behavior of "ScoreboardTest"

    val annos = Seq(WriteVcdAnnotation)

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    it should "test Scoreboard" in {
        test(new Scoreboard(3)(defaultConfig)).withAnnotations(annos) { c => 

            def init() = {

            }

            def randData() = nextInt(1000)

            def issue(fu: UInt, op: Int, rd: Int, rs1: Int, rs2: Int) = {
                c.io.issue.valid.poke(1)
                c.io.issue.bits.rd.poke(rd)
                c.io.issue.bits.rs1.poke(rs1)
                c.io.issue.bits.rs2.poke(rs2)
                c.io.issue.bits.fuId.poke(fu)
                c.io.issue.bits.op.poke(op)
                c.clock.step()
                c.io.issue.valid.poke(0)
            }
            
            def readOpr(fu: UInt) = {
                val id = fu.litValue.toInt
                c.io.readOpr(id).valid.poke(1)
                c.clock.step()
                c.io.readOpr(id).valid.poke(0)
            }

            def execute(fu: UInt) = {
                val id = fu.litValue.toInt
                c.io.execute(id).poke(1)
                c.clock.step()
                c.io.execute(id).poke(0)
            }

            def writeback(fu: UInt) = {
                val id = fu.litValue.toInt
                c.io.writeback(id).valid.poke(1)
                // c.io.wbReady(id).poke(1)
                c.clock.step()
                c.io.writeback(id).valid.poke(0)
                // c.io.wbReady(id).poke(0)
            }

            def freeAll() = {
                writeback(FUs(0))
                writeback(FUs(1))
                writeback(FUs(2))
            }

            init()
            c.clock.step(10)

            // WAW
            issue(FUs(0), 8, 1, 2, 3)
            issue(FUs(1), 8, 1, 4, 5)
            c.io.issue.ready.expect(0)

            c.clock.step()
            issue(FUs(1), 8, 6, 4, 5)

            // FU busy
            c.clock.step()
            issue(FUs(0), 8, 8, 0, 9)
            c.io.issue.ready.expect(0)

            // FU ready
            c.clock.step()
            issue(FUs(2), 8, 8, 0, 9)

            // free all
            c.clock.step()
            freeAll()

            // WAR
            c.clock.step()
            issue(FUs(0), 8, 1, 2, 3)
            issue(FUs(1), 8, 2, 4, 5)
            writeback(FUs(1)) // write invalid, FUs(1) need reg(2)

            // free all
            c.clock.step()
            freeAll()

            // RAW
            c.clock.step()
            issue(FUs(2), 8, 1, 2, 3)
            issue(FUs(1), 8, 4, 1, 5)
            readOpr(FUs(1)) // read invalid due to FUs(2) has not write back

            writeback(FUs(2))
            readOpr(FUs(1)) // read valid

            println("hello")
            println(c.regStatus.status(1).peek())


            c.clock.step(200)
        }
    }
}
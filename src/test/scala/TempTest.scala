package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec
import chisel3.util.Queue
import chisel3.util.Decoupled

import scala.util.Random.nextInt

class QueueTest extends Module {
    val io = IO(new Bundle{
        val in = Flipped(Decoupled(new Bundle{
            val data = UInt(8.W)
        }))
        val out = Decoupled(new Bundle{
            val data = UInt(8.W)
        })
    })
    val queue = Queue(io.in, entries = 4)
    io.out <> queue
}

class TempTest extends AnyFlatSpec with ChiselScalatestTester {
    behavior of "TempTest"

    it should "test Queue" in {
        test(new QueueTest()).withAnnotations(Seq(WriteVcdAnnotation)) { c => 

            def trnas(data: Int): Unit = {
                c.io.in.valid.poke(1)
                c.io.in.bits.data.poke(data)
                c.clock.step()
                c.io.in.valid.poke(0)
            }

            def recvRandDly(dly: Int): Unit = {
                for(i <- 0 until dly){
                    c.io.out.ready.poke(0)
                    c.clock.step()
                }
                c.io.out.ready.poke(1)
            }

            c.io.out.ready.poke(0)
            
            trnas(nextInt(0xFF))
            trnas(nextInt(0xFF))
            trnas(nextInt(0xFF))
            trnas(nextInt(0xFF))
            trnas(nextInt(0xFF))

            c.io.out.ready.poke(1)

            
            c.clock.step(200)
        }
    }
}
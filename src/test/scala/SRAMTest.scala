package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random.nextInt
import scala.collection.mutable

class SRAMTest extends AnyFlatSpec with ChiselScalatestTester {

    behavior of "SRAM"

    it should "test BankRam2P" in {
        test(new BankRam2P_1(depth = 512)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>

            var scoreboard: mutable.Map[Int, Int] = mutable.Map()

            def write(addr: Int, data: Int, mask: String) = {
                val maskInt = Integer.parseInt(mask, 2)
                c.io.w.en.poke(1)
                c.io.w.addr.poke(addr)
                c.io.w.data.poke(data)
                c.io.w.mask.get.poke(maskInt)
                c.clock.step()
                c.io.w.en.poke(0)
                scoreboard += (addr -> data)
            }

            def read(addr: Int): Int = {
                c.io.r.en.poke(1)
                c.io.r.addr.poke(addr)
                c.clock.step()
                c.io.r.en.poke(0)
                val data = c.io.r.data.peekInt().toInt
                assert(data == scoreboard(addr), s"read data error expect=>${scoreboard(addr)} get=>${data}")
                data
            }

            def readAndWrite(raddr: Int, waddr: Int, wdata: Int, wmask: String): Int = {
                val maskInt = Integer.parseInt(wmask, 2)
                c.io.r.en.poke(1)
                c.io.r.addr.poke(raddr)
                c.io.w.en.poke(1)
                c.io.w.addr.poke(waddr)
                c.io.w.data.poke(wdata)
                c.io.w.mask.get.poke(maskInt)
                c.clock.step()
                c.io.r.en.poke(0)
                c.io.w.en.poke(0)
                val rdata = c.io.r.data.peekInt().toInt
                assert(waddr == raddr && rdata == wdata, s"error while read and write same address:${waddr} rdata:${rdata} =/= wdata:${wdata}")
                rdata
            }

            def randData = nextInt(1000)
            def randAddr = nextInt(512)

            c.clock.step(10)

            // normal read write test
            for(i <- 0 until 100) {
                val addr = randAddr
                write(addr, randData, "1111")
                // println(s"read data:${read(addr)}")
            }

            // bypass test
            c.clock.step(100)
            for(i <- 0 until 100) {
                readAndWrite(0,0,100,"1111")
            }

            c.clock.step(100)
        }
    }

}
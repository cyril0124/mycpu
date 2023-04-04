package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random.nextInt
import scala.collection.mutable

class SRAMTest extends AnyFlatSpec with ChiselScalatestTester {
    val annos = Seq(WriteVcdAnnotation)
    behavior of "SRAM"

    // it should "test BankRam2P" in {
    //     test(new BankRam2P_1(depth = 512)).withAnnotations(annos) { c =>

    //         var scoreboard: mutable.Map[Int, Int] = mutable.Map()

    //         def write(addr: Int, data: Int, mask: String) = {
    //             val maskInt = Integer.parseInt(mask, 2)
    //             c.io.w.en.poke(1)
    //             c.io.w.addr.poke(addr)
    //             c.io.w.data.poke(data)
    //             c.io.w.mask.get.poke(maskInt)
    //             c.clock.step()
    //             c.io.w.en.poke(0)
    //             scoreboard += (addr -> data)
    //         }

    //         def read(addr: Int): Int = {
    //             c.io.r.en.poke(1)
    //             c.io.r.addr.poke(addr)
    //             c.clock.step()
    //             c.io.r.en.poke(0)
    //             val data = c.io.r.data.peekInt().toInt
    //             assert(data == scoreboard(addr), s"read data error expect=>${scoreboard(addr)} get=>${data}")
    //             data
    //         }

    //         def readAndWrite(raddr: Int, waddr: Int, wdata: Int, wmask: String): Int = {
    //             val maskInt = Integer.parseInt(wmask, 2)
    //             c.io.r.en.poke(1)
    //             c.io.r.addr.poke(raddr)
    //             c.io.w.en.poke(1)
    //             c.io.w.addr.poke(waddr)
    //             c.io.w.data.poke(wdata)
    //             c.io.w.mask.get.poke(maskInt)
    //             c.clock.step()
    //             c.io.r.en.poke(0)
    //             c.io.w.en.poke(0)
    //             val rdata = c.io.r.data.peekInt().toInt
    //             assert(waddr == raddr && rdata == wdata, s"error while read and write same address:${waddr} rdata:${rdata} =/= wdata:${wdata}")
    //             rdata
    //         }

    //         def randData = nextInt(1000)
    //         def randAddr = nextInt(512)

    //         c.clock.step(10)

    //         // normal read write test
    //         for(i <- 0 until 100) {
    //             val addr = randAddr
    //             write(addr, randData, "1111")
    //             // println(s"read data:${read(addr)}")
    //         }

    //         // bypass test
    //         c.clock.step(100)
    //         for(i <- 0 until 100) {
    //             readAndWrite(0,0,100,"1111")
    //         }

    //         c.clock.step(100)
    //     }
    // }

    it should "test SRAMArray_1P" in { 
        var scoreboard: mutable.Map[(Int, Int), Int] = mutable.Map() // (addr, way) -> data
        val testCaseNum = 1000
        val ways  = 4
        test(new SRAMArray_1P(width = 32, depth = 512, ways = ways, bramPolicy = "write_first")).withAnnotations(annos) { c =>

            def randAddr = nextInt(512).toInt
            def randData = nextInt(1000).toInt

            def randWmask = Seq.fill(ways)(if(nextInt(2) == 1) 1 else 0)

            def binarySeqToInt(binarySeq: Seq[Int]): Int = {
                binarySeq.foldLeft(0)((accumulator, bit) => accumulator * 2 + bit)
            }
            
            def write(addr: Int, mask: Seq[Int]) = {
                val wmask = binarySeqToInt(mask)
                val wdata = Seq.fill(ways)(randData)
                c.io.en.poke(1)
                c.io.rw.poke(1)
                for(i <- 0 until ways) {
                    c.io.wdata(i).poke(wdata(i))
                }
                c.io.wmaskOH.poke(wmask)
                c.io.addr.poke(addr)
                c.clock.step()
                c.io.en.poke(0)
                c.io.rw.poke(0)

                mask.reverse.zipWithIndex.foreach{ case(m, i) =>
                    if( m == 1) scoreboard += ((addr, i) -> wdata(i))
                }
            }

            def read(addr: Int) = {
                c.io.en.poke(1)
                c.io.rw.poke(0)
                c.io.addr.poke(addr)
                c.clock.step()
                c.io.en.poke(0)
                c.io.rw.poke(0)
                val rdata = c.io.rdata.map{ r => 
                    r.peekInt().toInt
                }
                (0 until ways).foreach{ i => 
                    val sdata = scoreboard.getOrElse((addr, i), 0)
                    if(sdata != 0) {
                        assert(rdata(i) === sdata)
                    }
                }
            }

            c.clock.step(10)
        
            (0 until testCaseNum).foreach{ i => 
                val addr = randAddr
                write(addr, randWmask)
                read(addr)
            }

            c.clock.step()
        }
    }

    it should "test SRAMArray_2P" in { 
        var scoreboard: mutable.Map[(Int, Int), Int] = mutable.Map() // (addr, way) -> data
        val testCaseNum = 1000
        val ways  = 4
        test(new SRAMArray_2P(width = 32, depth = 512, ways = ways, bramPolicy = "write_first")).withAnnotations(annos) { c =>

            def randAddr = nextInt(512).toInt
            def randData = nextInt(1000).toInt

            def randWmask = Seq.fill(ways)(if(nextInt(2) == 1) 1 else 0)

            def binarySeqToInt(binarySeq: Seq[Int]): Int = {
                binarySeq.foldLeft(0)((accumulator, bit) => accumulator * 2 + bit)
            }
            
            def write(addr: Int, mask: Seq[Int]) = {
                val wmask = binarySeqToInt(mask)
                val wdata = Seq.fill(ways)(randData)
                c.io.w.en.poke(1)
                for(i <- 0 until ways) {
                    c.io.w.data(i).poke(wdata(i))
                }
                c.io.w.maskOH.poke(wmask)
                c.io.w.addr.poke(addr)
                c.clock.step()
                c.io.w.en.poke(0)

                mask.reverse.zipWithIndex.foreach{ case(m, i) =>
                    if( m == 1) scoreboard += ((addr, i) -> wdata(i))
                }
            }

            def read(addr: Int) = {
                c.io.r.en.poke(1)
                c.io.r.addr.poke(addr)
                c.clock.step()
                c.io.r.en.poke(0)
                val rdata = c.io.r.data.map{ r => 
                    r.peekInt().toInt
                }
                (0 until ways).foreach{ i => 
                    val sdata = scoreboard.getOrElse((addr, i), 0)
                    if(sdata != 0) {
                        assert(rdata(i) === sdata)
                    }
                }
            }

            c.clock.step(10)
        
            (0 until testCaseNum).foreach{ i => 
                val addr = randAddr
                write(addr, randWmask)
                read(addr)
            }

            c.clock.step()
        }
    }

}
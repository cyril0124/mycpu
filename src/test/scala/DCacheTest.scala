package mycpu

import chisel3._
import chiseltest._
import  org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random.nextInt
import scala.math
import chisel3.util.Fill
import chisel3.util.FillInterleaved

class DCacheTest extends AnyFlatSpec with ChiselScalatestTester{
    behavior of "DCache"
    val annos = Seq(VcsBackendAnnotation, WriteVcdAnnotation)
    // val annos = Seq(WriteVcdAnnotation)

    // it should "test BankRam2P" in {
    //     test(new BankRam2P_1()) { c => 
    //         c.io.w.en.poke(1.U)
    //         c.io.w.addr.poke(10.U)
    //         c.io.w.mask.get.poke("b1111".U)
    //         c.io.w.data.poke(12345.U)
    //         c.clock.step()

    //         c.io.w.en.poke(0.U)
    //         c.io.r.en.poke(1.U)
    //         c.io.r.addr.poke(10.U)
    //         c.clock.step()
    //         c.io.r.data.expect(12345)

    //         println(s"read addr: ${c.io.r.addr.peek()} rdata: ${c.io.r.data.peek()}")
    //     }
    // }

    // it should "test BankRam1P" in {
    //     test(new BankRam1P_1()).withAnnotations(annos) { c => 

    //         def write(addr: Int, data:Int, mask: UInt): Unit = {
    //             c.io.en.poke(1.U)
    //             c.io.rw.poke(true.B)
    //             c.io.addr.poke(addr.U)
    //             c.io.wdata.poke(data.U)
    //             c.io.wmask.get.poke(mask)
    //             c.clock.step()
    //             println(s"write addr: ${c.io.addr.peek()} wdata: ${c.io.wdata.peek()}")
    //         }
            
    //         def read(addr: Int): Int = {
    //             c.io.en.poke(1.U)
    //             c.io.addr.poke(addr.U)
    //             c.io.rw.poke(false.B)
    //             c.clock.step()
    //             println(s"read addr: ${c.io.addr.peek()} rdata: ${c.io.rdata.peek()}")
    //             c.io.rdata.peek().litValue.toInt
    //         }

    //         // test write
    //         val testCaseNum = 30
    //         val addr = Seq.fill(testCaseNum)(nextInt(1024) / 4 * 4)
    //         val data = Seq.fill(testCaseNum)(nextInt(1024))
    //         val mask = (0 until testCaseNum).map{ i => 
    //             val t = nextInt(3)
    //             (t % 3) match {
    //                 case 0 => 15 // "b1111".U // 32-bit
    //                 case 1 => 3 // "b0011".U // 16-bit
    //                 case 2 => 1 // "b0001".U // 8-bit
    //             }
    //         }
    //         val expectData = (0 until testCaseNum).map{ i => 
    //             mask(i) match {
    //                 case 15 => data(i)
    //                 case 3 => data(i) & 0xFFFF
    //                 case 1 => data(i) & 0xFF
    //             }
    //         }
            
    //         var scoreboard: scala.collection.mutable.Map[Int,Int] = scala.collection.mutable.Map() // (addr, data)
    //         // write
    //         var i = 0;
    //         while(i < testCaseNum) {
    //             val en = nextInt(2)
    //             if(en == 1) {
    //                 write(addr(i), data(i), mask(i).U)
    //                 if(!scoreboard.contains(addr(i)))
    //                     scoreboard += (addr(i) -> expectData(i))
    //                 else
    //                     scoreboard(addr(i)) = expectData(i)
    //                 c.io.en.poke(0)
    //                 i = i + 1
    //             } else {
    //                 c.io.en.poke(0)
    //                 c.clock.step()
    //             }
    //         }
    //         // read back
    //         i = 0;
    //         while(i < testCaseNum) {
    //             val en = nextInt(2)
    //             if(en == 1) {
    //                 read(addr(i))
    //                 val rdata = c.io.rdata.peek().litValue.toInt
    //                 val rdataWithMask = mask(i) match {
    //                     case 15 => rdata
    //                     case 3 => rdata & 0xFFFF
    //                     case 1 => rdata & 0xFF
    //                 }
    //                 if(rdataWithMask != scoreboard(addr(i)))
    //                     assert(false, s"error! expect: ${scoreboard(addr(i))} but get: ${rdataWithMask} addr:${addr(i)}")
    //                 c.io.en.poke(0)
    //                 println(">>pass")
    //                 i = i + 1
    //             } else {
    //                 c.io.en.poke(0)
    //                 c.clock.step()
    //             }
    //         }

    //         c.clock.step(10)
    //         println("BankRam1P test all PASS!")
    //     }
    // }

    // it should "test DataBank" in {
    //     test(new DCacheDataBank(UInt(64.W))).withAnnotations(annos) { c => 
    //         def write(set: Int, way: Int, data: Int): Unit = {
    //             c.io.r.en.poke(0.U)
    //             c.io.w.en.poke(1.U)
    //             c.io.w.set.poke(set.U)
    //             c.io.w.way.poke(way.U)
    //             c.io.w.data.poke(data.U)
    //             c.io.w.mask.poke("b11111111".U)
    //             c.clock.step()
    //         }

    //         def read(set: Int, way: Int): UInt = {
    //             c.io.r.en.poke(1.U)
    //             c.io.w.en.poke(0.U)
    //             c.io.r.set.poke(set.U)
    //             c.io.r.way.poke(way.U)
    //             c.clock.step()
    //             c.io.r.data.peek()
    //         }

    //         val testCaseNum = 200
    //         val wdata = Seq.fill(testCaseNum)(nextInt(math.pow(2, 32).toInt))
    //         val en = Seq.fill(testCaseNum)(nextInt(2))
    //         val set = Seq.fill(testCaseNum)(nextInt(64))
    //         val way = Seq.fill(testCaseNum)(nextInt(4))

    //         var scoreboard: scala.collection.mutable.Map[(Int, Int), Int] = scala.collection.mutable.Map() // (set, way), data

    //         var i = 0
    //         while( i < testCaseNum ) {
    //             val en = nextInt(2)
    //             if(en == 1) {
    //                 println(s">>write: set=${set(i)} way=${way(i)} wdata=${wdata(i)}")
    //                 write(set(i), way(i), wdata(i))
    //                 if(!scoreboard.contains((set(i), way(i))))
    //                     scoreboard += ((set(i), way(i)) -> wdata(i))
    //                 else {
    //                     println(s">>REPLACE write: set=${set(i)} way=${way(i)} wdata=${wdata(i)}")
    //                     scoreboard((set(i), way(i))) = wdata(i)
    //                 }
    //                 c.io.w.en.poke(0)
    //                 i = i + 1
    //             } else {
    //                 c.io.w.en.poke(0)
    //                 c.clock.step()
    //             }
    //         }
    //         println()
    //         i = 0;
    //         while( i < testCaseNum ) {
    //             val en = nextInt(2)
    //             if(en == 1) {
    //                 println(s">>read: set=${set(i)} way=${way(i)} expect=${scoreboard(set(i), way(i))}")
    //                 read(set(i), way(i))
    //                 c.io.r.data.expect(scoreboard(set(i), way(i)))
    //                 c.io.r.en.poke(0)
    //                 i = i + 1
    //                 println("PASS<<")
    //             } else {
    //                 c.io.r.en.poke(0)
    //                 c.clock.step()
    //             }
    //         } 

    //         c.clock.step(10)
    //         println("DataBank test all PASS!")
    //     }
    // }

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = true,
            dcacheSets =  64,
            dcacheWays = 4,
        )
    })
    it should "test DCache" in {
        test(new DCache()(defaultConfig)).withAnnotations(annos) { c => 
            val resp = c.io.tlbus.resp

            def read(addr: Int): Unit = {
                c.io.read.req.valid.poke(1)
                c.io.read.req.bits.addr.poke(addr)
                c.clock.step()
                c.io.read.req.valid.poke(0)
            }

            def respRefill(data: Int, source: Int): Unit = {
                resp.valid.poke(1)
                resp.bits.data.poke(data)
                resp.bits.source.poke(source)
                c.clock.step()
                // resp.valid.poke(0)
            }

            val testCaseNum = 200
            val addrs = Seq.fill(testCaseNum)(nextInt(math.pow(2,31).toInt))
            val datas = Seq.fill(testCaseNum)(nextInt(math.pow(2,31).toInt))
            
            var scoreboard: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map() // (addr, data)
            
            c.io.tlbus.req.ready.poke(1)
            for( i <- 0 until testCaseNum) {
                if(!scoreboard.contains(addrs(i))) {
                    println(s">>>[rd miss]expect: ${datas(i)}")
                    read(addrs(i))
                    c.clock.step() // read cache info 
                    c.clock.step() // miss & send sub req
                    respRefill(datas(i), 1)

                    c.io.read.resp.valid.expect(1)
                    c.io.read.resp.bits.data.expect(datas(i))
                    resp.valid.poke(0)
                    
                    println("PASS[rd miss]<<<")

                    scoreboard += (addrs(i) -> datas(i))
                    c.clock.step()
                } else {
                    c.clock.step()
                }
            }

            c.clock.step(10)
            
            println("\nread hit test")
            for( i <- 0 until testCaseNum) {
                println(s">>>[rd hit]expect: ${scoreboard(addrs(i))} at addr: ${addrs(i)}")

                read(addrs(i))
                c.clock.step() // delay one cycle watting for data become avaliable

                if(c.io.read.resp.valid.peekBoolean() == true) { 
                    c.io.read.resp.valid.expect(1, s"expect: ${scoreboard(addrs(i))} at addr: ${addrs(i)}")
                    c.io.read.resp.bits.data.expect(scoreboard(addrs(i)))
                    println("PASS[rd hit]<<<")
                } else { // cache block has been replaced
                    c.clock.step()
                    respRefill(datas(i), 1)
                    resp.valid.poke(0)
                }
                
                c.clock.step()
            }
            
            
            
            c.clock.step(10)
        }
    }

}
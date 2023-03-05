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
import dataclass.data

class DCacheTest extends AnyFlatSpec with ChiselScalatestTester{
    behavior of "DCache"

    // it should "test BankRam2P" in {
    //     test(new BankRam2P_1()) { c => 
    //         c.io.w.en.poke(1.U)
    //         c.io.w.addr.poke(10.U)
    //         c.io.w.mask.get.poke("b1111".U)
    //         c.io.w.data.poke(12345.U)
    //         c.clock.step()

    //         c.io.w.en.poke(1.U)
    //         c.io.r.en.poke(1.U)
    //         c.io.r.addr.poke(10.U)
    //         c.clock.step()
    //         c.io.r.data.expect(12345)

    //         println(s"read addr: ${c.io.r.addr.peek()} rdata: ${c.io.r.data.peek()}")
    //     }
    // }

    // it should "test BankRam1P" in {
    //     test(new BankRam1P_1()).withAnnotations(Seq(WriteVcdAnnotation)) { c => 

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
    //                 c.io.rdata.expect(scoreboard(addr(i)), s"addr:${addr(i)}")
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
    //     test(new DCacheDataBank(UInt(64.W))).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
    //         def write(set: Int, way: Int, data: Int, memType: UInt): Unit = {
    //             c.io.r.en.poke(0.U)
    //             c.io.w.en.poke(1.U)
    //             c.io.w.set.poke(set.U)
    //             c.io.w.way.poke(way.U)
    //             c.io.w.data.poke(data.U)
    //             c.io.w.memType.poke(memType)
    //             c.clock.step()
    //         }

    //         def read(set: Int, way: Int, memType: UInt): UInt = {
    //             c.io.r.en.poke(1.U)
    //             c.io.w.en.poke(0.U)
    //             c.io.r.set.poke(set.U)
    //             c.io.r.way.poke(way.U)
    //             c.io.r.memType.poke(memType)
    //             c.clock.step()
    //             c.io.r.data.peek()
    //         }

    //         val testCaseNum = 200
    //         val wdata = Seq.fill(testCaseNum)(nextInt(math.pow(2, 32).toInt))
    //         val en = Seq.fill(testCaseNum)(nextInt(2))
    //         val set = Seq.fill(testCaseNum)(nextInt(64))
    //         val way = Seq.fill(testCaseNum)(nextInt(4))
    //         val memType = (0 until testCaseNum).map{ i => 
    //             val t = nextInt(3)  // 000: 8-bit  001: 16-bit  010: 32-bit  011: 64-bit
    //             (t % 3) match {
    //                 case 2 => 2  // 32-bit
    //                 case 1 => 1  // 16-bit
    //                 case 0 => 0  // 8-bit
    //             }
    //         }
    //         val expectData = (0 until testCaseNum).map{ i => 
    //             memType(i) match {
    //                 case 2 => wdata(i)
    //                 case 1 => wdata(i) & 0xFFFF
    //                 case 0 => wdata(i) & 0xFF
    //             }
    //         }

    //         var scoreboard: scala.collection.mutable.Map[(Int, Int),(Int, Int)] = scala.collection.mutable.Map() // (set, way), (data, memType)

    //         var i = 0
    //         while( i < testCaseNum ) {
    //             val en = nextInt(2)
    //             if(en == 1) {
    //                 write(set(i), way(i), wdata(i), memType(i).U)
    //                 if(!scoreboard.contains((set(i), way(i))))
    //                     scoreboard += ((set(i), way(i)) -> (expectData(i), memType(i)))
    //                 else
    //                     scoreboard((set(i), way(i))) = (expectData(i), memType(i))
    //                 c.io.w.en.poke(0)
    //                 i = i + 1
    //             } else {
    //                 c.io.w.en.poke(0)
    //                 c.clock.step()
    //             }
    //         }

    //         i = 0;
    //         while( i < testCaseNum ) {
    //             val en = nextInt(2)
    //             if(en == 1) {
    //                 read(set(i), way(i), scoreboard(set(i), way(i))._2.U)
    //                 c.io.r.data.expect(scoreboard(set(i), way(i))._1)
    //                 c.io.r.en.poke(0)
    //                 i = i + 1
    //                 println(">>pass")
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
            enableDebug = false
        )
    })
    it should "test DCache" in {
        test(new DCache(nrSet = 16)(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
            val resp = c.io.tlbus.resp

            def read(addr: Int, memType: UInt): Unit = {
                c.io.read.req.valid.poke(1)
                c.io.read.req.bits.addr.poke(addr)
                c.io.read.req.bits.memType.poke(memType)
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
            val memTypes = (0 until testCaseNum).map{ i =>
                                 (addrs(i) % 3) match {
                                    case 0 => "b000".U
                                    case 1 => "b001".U
                                    case 2 => "b010".U
                                    case _ => "b010".U
                                }
                            }
            val datasWithMask = datas.zip(addrs).map {
                                    case(d,a) => ( a % 3) match {
                                                    case 0 => d & 0xFF
                                                    case 1 => d & 0xFFFF
                                                    case 2 => d
                                                    case _ => d
                                                }
                                }        

            var scoreboard: scala.collection.mutable.Map[Int,(Int, UInt)] = scala.collection.mutable.Map() // (addr, (data, memType))
            
            c.io.tlbus.req.ready.poke(1)
            for( i <- 0 until testCaseNum) {
                if(!scoreboard.contains(addrs(i))) {
                    println(s">>>[rd miss]expect: ${datasWithMask(i)}")
                    read(addrs(i), memTypes(i))
                    c.clock.step() // read cache info 
                    c.clock.step() // miss & send sub req
                    respRefill(datas(i), 1)

                    c.io.read.resp.valid.expect(1)
                    c.io.read.resp.bits.data.expect(datasWithMask(i))
                    resp.valid.poke(0)
                    
                    println("PASS[rd miss]<<<")

                    scoreboard += (addrs(i) -> (datasWithMask(i) -> memTypes(i)))
                    c.clock.step()
                } else {
                    c.clock.step()
                }
            }

            c.clock.step(10)
            
            println("\nread hit test")
            for( i <- 0 until testCaseNum) {
                println(s">>>[rd hit]expect: ${scoreboard(addrs(i))._1} at addr: ${addrs(i)}")

                read(addrs(i), scoreboard(addrs(i))._2)
                c.clock.step()

                if(c.io.read.resp.valid.peekBoolean() == true) { 
                    c.io.read.resp.valid.expect(1, s"expect: ${scoreboard(addrs(i))._1} at addr: ${addrs(i)}")
                    c.io.read.resp.bits.data.expect(scoreboard(addrs(i))._1)
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
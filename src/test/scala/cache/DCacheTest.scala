package mycpu

import chisel3._
import chiseltest._
import  org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random.nextInt
import scala.util.Random.shuffle
import scala.math
import chisel3.util.Fill
import chisel3.util.FillInterleaved


class DCacheTest extends AnyFlatSpec with ChiselScalatestTester{
    behavior of "DCache"
    // val annos = Seq(VcsBackendAnnotation, WriteVcdAnnotation)
    // val annos = Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)
    val annos = Seq(WriteVcdAnnotation)

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
            dcacheSets =  128,
            dcacheWays = 4,
            dcacheBlockSize = 2,
        )
    })
    it should "test read miss and read hit" in {
        test(new DCache()(defaultConfig)).withAnnotations(annos) { c => 
            val resp = c.io.tlbus.resp

            def read(addr: Int): Unit = {
                c.io.read.req.valid.poke(1)
                c.io.read.req.bits.addr.poke(addr)
                c.clock.step()
                c.io.read.req.valid.poke(0)
            }

            def read_1(addr: Int): Unit = {
                c.io.read.req.valid.poke(1)
                c.io.read.req.bits.addr.poke(addr)
            }

            def respRefill(data: Int, source: Int): Unit = {
                resp.valid.poke(1)
                resp.bits.data.poke(data)
                resp.bits.source.poke(source)
                resp.bits.opcode.poke(1) // AccessAckData
                // c.clock.step()
            }

            def respRefill_1(data: Int, source: Int): Unit = {
                resp.valid.poke(1)
                resp.bits.data.poke(data)
                resp.bits.source.poke(source)
                resp.bits.opcode.poke(1) // AccessAckData
                c.clock.step()
            }
            
            c.io.tlbus.req.ready.poke(1)
            c.io.read.resp.ready.poke(1)
            // read(0)
            // c.io.tlbus.req.valid.expect(1)
            // c.clock.step()
            // respRefill(2222, 1)
            // respRefill(3333, 1)
            // resp.valid.poke(0)
            // c.clock.step()

            // read(1536)
            // c.io.tlbus.req.valid.expect(1)
            // c.clock.step()
            // respRefill(2222, 1)
            // respRefill(3333, 1)
            // resp.valid.poke(0)
            // c.clock.step()

            // read(3584)
            // c.io.tlbus.req.valid.expect(1)
            // c.clock.step()
            // respRefill(2222, 1)
            // respRefill(3333, 1)
            // resp.valid.poke(0)
            // c.clock.step()

            // read(7680)
            // c.io.tlbus.req.valid.expect(1)
            // c.clock.step()
            // respRefill(2222, 1)
            // respRefill(3333, 1)
            // resp.valid.poke(0)
            // c.clock.step()

            // read(512)
            // c.io.tlbus.req.valid.expect(1)
            // c.io.tlbus.req.bits.opcode.expect(2)
            // val wbData1 = c.io.tlbus.req.bits.data.peekInt().toInt
            // val wbAddr1 = c.io.tlbus.req.bits.address.peekInt().toInt
            // println(s"wbData1: ${wbData1}  wbAddr1: ${wbAddr1}")
            // c.clock.step()
            // val wbData2 = c.io.tlbus.req.bits.data.peekInt().toInt
            // val wbAddr2 = c.io.tlbus.req.bits.address.peekInt().toInt
            // println(s"wbData2: ${wbData2}  wbAddr2: ${wbAddr2}")
            // c.clock.step()
            // c.io.tlbus.resp.valid.poke(1)
            // c.io.tlbus.resp.bits.opcode.poke(0) // AccessAck
            // c.clock.step()
            // c.io.tlbus.resp.valid.poke(0)

            // c.io.tlbus.req.valid.expect(1)
            // c.io.tlbus.req.bits.address.expect(512)
            // c.io.tlbus.req.bits.opcode.expect(4) // Get
            // c.clock.step()
            // respRefill(2222, 1)
            // // respRefill(3333, 1)
            // resp.valid.poke(1)
            // resp.bits.data.poke(3333)
            // resp.bits.source.poke(1)
            // resp.bits.opcode.poke(1) // AccessAckData
            // c.io.read.resp.valid.expect(1)
            // c.io.read.resp.bits.data.expect(2222)

            // c.clock.step()
            // resp.valid.poke(0)
            // c.clock.step()

            val dcacheByteOffsetBits = 2
            val dcacheBlockBits = 1

            var scoreboard: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map() // (addr, data)
            val testCaseNum = 200

            var hit = 0
            var dirty = 0
            for( i <- 0 until testCaseNum) {
                val addr = nextInt(math.pow(2, 10).toInt) << dcacheByteOffsetBits
                read(addr)

                if(c.io.read.resp.valid.peekBoolean() == true) { // load hit
                    println("HIT")
                    c.io.read.resp.bits.data.expect(scoreboard(addr))
                    c.clock.step()
                    hit = hit + 1
                } else { // load miss
                    c.io.tlbus.req.valid.expect(1)
                    if(c.io.tlbus.req.bits.opcode.peekInt() == 4) {// load miss clean    Get
                        c.clock.step()
                        val refillData1 = nextInt(1000).toInt
                        val refillData2 = nextInt(1000).toInt
                        
                        val tempAddr = (addr >> (dcacheBlockBits + dcacheByteOffsetBits)) << (dcacheBlockBits + dcacheByteOffsetBits)
                        println(s"    addr:${addr} tempAddr:${tempAddr} tempAddr+4:${tempAddr+4} ")
                        scoreboard += ( tempAddr -> refillData1)
                        scoreboard += (tempAddr + 4 -> refillData2)

                        println(s">>>[load miss clean] at addr:${addr} expect:${scoreboard(addr)}")
                        
                        respRefill(refillData1, 1)
                        c.clock.step()
                        
                        respRefill(refillData2, 1)
                        c.io.read.resp.valid.expect(1)
                        c.io.read.resp.bits.data.expect(scoreboard(addr))
                        c.clock.step()

                        resp.valid.poke(0)
                        
                        println("PASS[load miss clean]<<<\n")
                    } else {
                        println(">>>[load miss dirty] ")
                        val tempAddr = (addr >> (dcacheBlockBits + dcacheByteOffsetBits)) << (dcacheBlockBits + dcacheByteOffsetBits)

                        c.io.tlbus.req.bits.opcode.expect(2) // load miss dirty   PutFullData
                        val wbData1 = c.io.tlbus.req.bits.data.peekInt().toInt
                        val wbAddr1 = c.io.tlbus.req.bits.address.peekInt().toInt
                        println(s"wbData1: ${wbData1}  wbAddr1: ${wbAddr1}")
                        c.clock.step()
                        val wbData2 = c.io.tlbus.req.bits.data.peekInt().toInt
                        val wbAddr2 = c.io.tlbus.req.bits.address.peekInt().toInt
                        println(s"wbData2: ${wbData2}  wbAddr2: ${wbAddr2}")
                        c.clock.step()

                        c.io.tlbus.resp.valid.poke(1)
                        c.io.tlbus.resp.bits.opcode.poke(0) // AccessAck
                        
                        c.clock.step()
                        c.io.tlbus.resp.valid.poke(0)
                        // c.clock.step()
                        
                        // c.io.tlbus.req.valid.expect(1) // !
                        c.io.tlbus.req.bits.address.expect(tempAddr)
                        c.io.tlbus.req.bits.opcode.expect(4) // Get
                        c.clock.step()
                        c.io.tlbus.resp.valid.poke(0)
                        val refillData1 = nextInt(1000).toInt
                        val refillData2 = nextInt(1000).toInt
                        // val tempAddr = (addr >> (dcacheBlockBits + dcacheByteOffsetBits)) << (dcacheBlockBits + dcacheByteOffsetBits)
                        println(s"    addr:${addr} tempAddr:${tempAddr} tempAddr+4:${tempAddr+4} ")
                        println(s"    refillData1:${refillData1}  refillData2:${refillData2}")
                        scoreboard += ( tempAddr -> refillData1)
                        scoreboard += (tempAddr + 4 -> refillData2)

                        respRefill(refillData1, 1)
                        c.clock.step()

                        respRefill(refillData2, 1)
                        c.io.read.resp.valid.expect(1)
                        c.io.read.resp.bits.data.expect(scoreboard(addr))
                        c.clock.step()
                        
                        c.io.tlbus.resp.valid.poke(0)
                        resp.valid.poke(0)
                        println("PASS[load miss dirty]<<<\n")
                        dirty = dirty + 1

                        // c.clock.step(500)
                    }
                }
            }
            println(s"hit times:${hit}   dirty times:${dirty}")
            c.clock.step(10)

        }
    }

    it should "test write miss and write hit" in {
        test(new DCache()(defaultConfig)).withAnnotations(annos) { c => 
            val resp = c.io.tlbus.resp

            def init(): Unit = {
                c.io.tlbus.req.ready.poke(1)
                c.io.write.resp.ready.poke(1)
                c.io.read.resp.ready.poke(1)
                c.io.tlbus.req.ready.poke(1)
            }

            def read(addr: Int): Unit = {
                c.io.read.req.valid.poke(1)
                c.io.read.req.bits.addr.poke(addr)
                c.clock.step()
                c.io.read.req.valid.poke(0)
            }

            def readBegin(addr: Int): Unit = {
                c.io.read.req.valid.poke(1)
                c.io.read.req.bits.addr.poke(addr)
                // c.clock.step()
                // c.io.read.req.valid.poke(0)
            }

            def readEnd(): Unit = {
                c.io.read.req.valid.poke(0)
            }

            def respRefill(data: Int, source: Int): Unit = {
                resp.valid.poke(1)
                resp.bits.data.poke(data)
                resp.bits.source.poke(source)
                resp.bits.opcode.poke(1) // AccessAckData
                c.clock.step()
            }

            def write(addr: Int, data: Int, mask: UInt): Unit = {
                c.io.write.req.valid.poke(1)
                c.io.write.req.bits.addr.poke(addr)
                c.io.write.req.bits.data.poke(data)
                c.io.write.req.bits.mask.poke(mask)
                c.clock.step()
                c.io.write.req.valid.poke(0)
            }

            def writeBegin(addr: Int, data: Int, mask: UInt): Unit = {
                c.io.write.req.valid.poke(1)
                c.io.write.req.bits.addr.poke(addr)
                c.io.write.req.bits.data.poke(data)
                c.io.write.req.bits.mask.poke(mask)
                // c.clock.step()
                // c.io.write.req.valid.poke(0)
            }

            def writeEnd(): Unit = {
                c.io.write.req.valid.poke(0)
            }


            def readHitTest(addr: Int, expectData: Int): Unit = {
                read(addr)
                // c.clock.step()
                if(c.io.read.resp.valid.peekBoolean() == true) {
                    c.io.read.resp.valid.expect(1)
                    val rdata = c.io.read.resp.bits.data.peekInt().toInt
                    assert(rdata == expectData || rdata == 1111, s"expect:${expectData}  get:${rdata} at addr:${addr}")
                }else{
                    while(c.io.tlbus.req.valid.peekBoolean() == false) {
                        print(".")
                        c.clock.step()
                    }
                    c.clock.step()
                    println("MISS")
                    respRefill(1111, 1)
                    respRefill(1111, 1)
                    resp.valid.poke(0)
                }
            }

            init()
            // simple write dirty test  !!! 4-way only
            // write(0, 100, "b1111".U)
            // c.io.write.resp.valid.expect(0)
            // c.io.tlbus.req.valid.expect(1)
            // c.clock.step()
            // respRefill(2222, 1)
            // respRefill(3333, 1)
            // c.io.write.resp.valid.expect(1)
            // resp.valid.poke(0)
            // c.clock.step()


            // write(1536, 101, "b1111".U)
            // c.io.write.resp.valid.expect(0)
            // c.io.tlbus.req.valid.expect(1)
            // c.clock.step()
            // respRefill(2222, 1)
            // respRefill(3333, 1)
            // c.io.write.resp.valid.expect(1)
            // resp.valid.poke(0)
            // c.clock.step()


            // write(3584, 102, "b1111".U)
            // c.io.write.resp.valid.expect(0)
            // c.io.tlbus.req.valid.expect(1)
            // c.clock.step()
            // respRefill(2222, 1)
            // respRefill(3333, 1)
            // c.io.write.resp.valid.expect(1)
            // resp.valid.poke(0)
            // c.clock.step()


            // write(7680, 103, "b1111".U)
            // c.io.write.resp.valid.expect(0)
            // c.io.tlbus.req.valid.expect(1)
            // c.clock.step()
            // respRefill(2222, 1)
            // respRefill(3333, 1)
            // c.io.write.resp.valid.expect(1)
            // resp.valid.poke(0)
            // c.clock.step()


            // write(512, 120, "b1111".U)
            // c.clock.step(2)
            // c.io.tlbus.resp.bits.opcode.poke(0) // AccessAck
            // c.io.tlbus.resp.valid.poke(1)
            // c.clock.step()
            // c.io.tlbus.resp.valid.poke(0)
            // c.io.tlbus.req.valid.expect(1)
            // c.clock.step()
            // respRefill(2222, 1)
            // respRefill(3333, 1)
            // resp.valid.poke(0)
            
            // c.clock.step(20)

            // -----------------------
            // readBegin()
            // writeBegin(12342, 100, "b1111".U)
            // c.clock.step()

            // c.io.write.resp.valid.expect(0)
            // c.io.tlbus.req.valid.expect(1)
            // c.clock.step()
            // respRefill(2222, 1)
            // respRefill(3333, 1)
            // c.io.write.resp.valid.expect(1)
            // resp.valid.poke(0)
            // c.clock.step()

            
            // writeEnd()
            // readEnd()
            // -----------------------


            val dcacheByteOffsetBits = 2
            val dcacheBlockBits = 1
            val off = dcacheBlockBits + dcacheByteOffsetBits

            var scoreboard: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map() // (addr, data)
            val testCaseNum = 200

            def tlValid: Boolean = c.io.tlbus.req.valid.peekBoolean()
            def tlOpcode: Int = c.io.tlbus.req.bits.opcode.peekInt().toInt
            val Get = 4
            val PutFullData = 2
            val AccessAck = 0
            val AccessAckData = 1

            var hit = 0
            var dirty = 0
            for(i <- 0 until testCaseNum) {
                val addr = nextInt(math.pow(2, 10).toInt) << dcacheByteOffsetBits
                val data = nextInt(math.pow(2, 20).toInt)
                write(addr, data, "b1111".U)

                if(tlValid == true) { // store miss
                    val refillData1 = nextInt(1000).toInt
                    val refillData2 = nextInt(1000).toInt
                    val tempAddr = (addr >> (dcacheBlockBits + dcacheByteOffsetBits)) << (dcacheBlockBits + dcacheByteOffsetBits)
                    println(s"    addr:${addr} tempAddr:${tempAddr} tempAddr+4:${tempAddr+4} ")
                    scoreboard += ( tempAddr -> refillData1)
                    scoreboard += (tempAddr + 4 -> refillData2)

                    if(tlOpcode == Get) { // store miss clean   Get
                        println(">>>>[store miss clean]")
                        c.clock.step()
                        respRefill(refillData1,1)
                        respRefill(refillData2,1)
                        resp.valid.poke(0)
                        c.io.write.resp.valid.expect(1)
                        c.clock.step()

                        scoreboard += (addr -> data)
                        println("PASS[store miss clean]<<<<")
                    } else if (tlOpcode == PutFullData) { // store miss diry  PutFullData
                        println(">>>>[store miss dirty]")
                        val writebackData1 = c.io.tlbus.req.bits.data.peekInt().toInt
                        val writebackAddr1 = c.io.tlbus.req.bits.address.peekInt().toInt
                        println(s"writeback Data1 is ${writebackData1} at addr:${writebackAddr1}")
                        c.clock.step()

                        val writebackData2 = c.io.tlbus.req.bits.data.peekInt().toInt
                        val writebackAddr2 = c.io.tlbus.req.bits.address.peekInt().toInt
                        println(s"writeback Data1 is ${writebackData1} at addr:${writebackAddr2}")
                        c.clock.step()

                        c.io.tlbus.resp.bits.opcode.poke(AccessAck) // AccessAck
                        c.io.tlbus.resp.valid.poke(1)
                        c.clock.step()
                        c.io.tlbus.resp.valid.poke(0)

                        c.io.tlbus.req.valid.expect(1)
                        c.io.tlbus.req.bits.opcode.expect(Get)
                        c.clock.step()

                        respRefill(refillData1, 1)
                        respRefill(refillData2, 1)
                        resp.valid.poke(0)

                        c.io.write.resp.valid.expect(1)
                        scoreboard += (addr -> data)
                        println("PASS[store miss dirty]<<<<")
                        dirty = dirty + 1
                        c.clock.step()
                    }
                } else { // store hit
                    println(">>>>[STORE HIT]")
                    c.clock.step()
                    c.io.write.resp.valid.expect(1)
                    
                    scoreboard += (addr -> data)
                    println("PASS[STORE HIT]<<<<")
                    hit = hit + 1
                    c.clock.step()
                }
            }
            println(s"hit:${hit}   dirty:${dirty}")

        }
    }

    it should "test both write and read" in {
        test(new DCache()(defaultConfig)).withAnnotations(annos) { c =>
            val resp = c.io.tlbus.resp

            def init(): Unit = {
                c.io.tlbus.req.ready.poke(1)
                c.io.write.resp.ready.poke(1)
                c.io.read.resp.ready.poke(1)
                c.io.tlbus.req.ready.poke(1)
            }

            def read(addr: Int): Unit = {
                c.io.read.req.valid.poke(1)
                c.io.read.req.bits.addr.poke(addr)
                c.clock.step()
                c.io.read.req.valid.poke(0)
            }

            def readBegin(addr: Int): Unit = {
                c.io.read.req.valid.poke(1)
                c.io.read.req.bits.addr.poke(addr)
                // c.clock.step()
                // c.io.read.req.valid.poke(0)
            }

            def readEnd(): Unit = {
                c.io.read.req.valid.poke(0)
            }

            def respRefill(data: Int, source: Int): Unit = {
                resp.valid.poke(1)
                resp.bits.data.poke(data)
                resp.bits.source.poke(source)
                resp.bits.opcode.poke(1) // AccessAckData
                c.clock.step()
            }

            def respRefill_1(data: Int, source: Int): Unit = {
                resp.valid.poke(1)
                resp.bits.data.poke(data)
                resp.bits.source.poke(source)
                resp.bits.opcode.poke(1) // AccessAckData
                // c.clock.step()
            }

            def write(addr: Int, data: Int, mask: UInt): Unit = {
                c.io.write.req.valid.poke(1)
                c.io.write.req.bits.addr.poke(addr)
                c.io.write.req.bits.data.poke(data)
                c.io.write.req.bits.mask.poke(mask)
                c.clock.step()
                c.io.write.req.valid.poke(0)
            }

            val dcacheByteOffsetBits = 2
            val dcacheBlockBits = 1
            val off = dcacheBlockBits + dcacheByteOffsetBits

            var scoreboard: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map() // (addr, data)
            val testCaseNum = 2000

            def tlValid: Boolean = c.io.tlbus.req.valid.peekBoolean()
            def tlOpcode: Int = c.io.tlbus.req.bits.opcode.peekInt().toInt
            val Get = 4
            val PutFullData = 2
            val AccessAck = 0
            val AccessAckData = 1

            val verbose = true

            init()
            var load = 0
            var load_hit = 0
            var load_miss = 0
            var load_miss_dirty = 0

            var store = 0
            var store_hit = 0
            var store_miss = 0
            var store_miss_dirty = 0
            for( i <- 0 until testCaseNum) {
                val addr = nextInt(math.pow(2, 10).toInt) << dcacheByteOffsetBits + 0x2000
                val data = nextInt(math.pow(2, 20).toInt)

                val reqType = nextInt(2)
                if(reqType == 0) { // load
                    load = load + 1
                    read(addr)
                    if(c.io.read.resp.valid.peekBoolean() == true) { // load hit
                        if(verbose) println("HIT")
                        c.io.read.resp.bits.data.expect(scoreboard(addr))
                        c.clock.step()
                        load_hit = load_hit + 1
                    } else { // load miss
                        c.io.tlbus.req.valid.expect(1)
                        if(c.io.tlbus.req.bits.opcode.peekInt() == 4) { // load miss clean    Get
                            c.clock.step()
                            val refillData1 = nextInt(1000).toInt
                            val refillData2 = nextInt(1000).toInt
                            
                            val tempAddr = (addr >> (dcacheBlockBits + dcacheByteOffsetBits)) << (dcacheBlockBits + dcacheByteOffsetBits)
                            if(verbose) println(s"    addr:${addr} tempAddr:${tempAddr} tempAddr+4:${tempAddr+4} ")
                            scoreboard += ( tempAddr -> refillData1)
                            scoreboard += (tempAddr + 4 -> refillData2)

                            if(verbose) println(s">>>[load miss clean] at addr:${addr} expect:${scoreboard(addr)}")
                            
                            respRefill_1(refillData1, 1)
                            c.clock.step()
                            
                            respRefill_1(refillData2, 1)
                            c.io.read.resp.valid.expect(1)
                            c.io.read.resp.bits.data.expect(scoreboard(addr))
                            c.clock.step()

                            resp.valid.poke(0)
                            
                            if(verbose) println("PASS[load miss clean]<<<\n")
                            load_miss = load_miss + 1
                        } else {
                            if(verbose) println(">>>[load miss dirty] ")
                            val tempAddr = (addr >> (dcacheBlockBits + dcacheByteOffsetBits)) << (dcacheBlockBits + dcacheByteOffsetBits)

                            c.io.tlbus.req.bits.opcode.expect(2) // load miss dirty   PutFullData
                            val wbData1 = c.io.tlbus.req.bits.data.peekInt().toInt
                            val wbAddr1 = c.io.tlbus.req.bits.address.peekInt().toInt
                            if(verbose) println(s"wbData1: ${wbData1}  wbAddr1: ${wbAddr1}")
                            c.clock.step()
                            val wbData2 = c.io.tlbus.req.bits.data.peekInt().toInt
                            val wbAddr2 = c.io.tlbus.req.bits.address.peekInt().toInt
                            if(verbose) println(s"wbData2: ${wbData2}  wbAddr2: ${wbAddr2}")
                            c.clock.step()

                            c.io.tlbus.resp.valid.poke(1)
                            c.io.tlbus.resp.bits.opcode.poke(0) // AccessAck
                            
                            c.clock.step()
                            c.io.tlbus.resp.valid.poke(0)
                            c.io.tlbus.req.bits.address.expect(tempAddr)
                            c.io.tlbus.req.bits.opcode.expect(4) // Get
                            c.clock.step()
                            c.io.tlbus.resp.valid.poke(0)
                            val refillData1 = nextInt(1000).toInt
                            val refillData2 = nextInt(1000).toInt
                            // val tempAddr = (addr >> (dcacheBlockBits + dcacheByteOffsetBits)) << (dcacheBlockBits + dcacheByteOffsetBits)
                            if(verbose) println(s"    addr:${addr} tempAddr:${tempAddr} tempAddr+4:${tempAddr+4} ")
                            if(verbose) println(s"    refillData1:${refillData1}  refillData2:${refillData2}")
                            scoreboard += ( tempAddr -> refillData1)
                            scoreboard += (tempAddr + 4 -> refillData2)

                            respRefill_1(refillData1, 1)
                            c.clock.step()

                            respRefill_1(refillData2, 1)
                            c.io.read.resp.valid.expect(1)
                            c.io.read.resp.bits.data.expect(scoreboard(addr))
                            c.clock.step()
                            
                            c.io.tlbus.resp.valid.poke(0)
                            resp.valid.poke(0)
                            if(verbose) println("PASS[load miss dirty]<<<\n")
                            load_miss_dirty = load_miss_dirty + 1
                        }
                    }
                } else { // store
                    store = store + 1
                    write(addr, data, "b1111".U)

                    if(tlValid == true) { // store miss
                        val refillData1 = nextInt(1000).toInt
                        val refillData2 = nextInt(1000).toInt
                        val tempAddr = (addr >> (dcacheBlockBits + dcacheByteOffsetBits)) << (dcacheBlockBits + dcacheByteOffsetBits)
                        if(verbose) println(s"    addr:${addr} tempAddr:${tempAddr} tempAddr+4:${tempAddr+4} ")
                        scoreboard += ( tempAddr -> refillData1)
                        scoreboard += (tempAddr + 4 -> refillData2)

                        if(tlOpcode == Get) { // store miss clean   Get
                            if(verbose) println(">>>>[store miss clean]")
                            c.clock.step()
                            respRefill(refillData1,1)
                            respRefill(refillData2,1)
                            resp.valid.poke(0)
                            c.io.write.resp.valid.expect(1)
                            c.clock.step()

                            scoreboard += (addr -> data)
                            if(verbose) println("PASS[store miss clean]<<<<")
                            store_miss = store_miss + 1
                        } else if (tlOpcode == PutFullData) { // store miss diry  PutFullData
                            if(verbose) println(">>>>[store miss dirty]")
                            val writebackData1 = c.io.tlbus.req.bits.data.peekInt().toInt
                            val writebackAddr1 = c.io.tlbus.req.bits.address.peekInt().toInt
                            if(verbose) println(s"writeback Data1 is ${writebackData1} at addr:${writebackAddr1}")
                            c.clock.step()

                            val writebackData2 = c.io.tlbus.req.bits.data.peekInt().toInt
                            val writebackAddr2 = c.io.tlbus.req.bits.address.peekInt().toInt
                            if(verbose) println(s"writeback Data1 is ${writebackData1} at addr:${writebackAddr2}")
                            c.clock.step()

                            c.io.tlbus.resp.bits.opcode.poke(AccessAck) // AccessAck
                            c.io.tlbus.resp.valid.poke(1)
                            c.clock.step()
                            c.io.tlbus.resp.valid.poke(0)

                            c.io.tlbus.req.valid.expect(1)
                            c.io.tlbus.req.bits.opcode.expect(Get)
                            c.clock.step()

                            respRefill(refillData1, 1)
                            respRefill(refillData2, 1)
                            resp.valid.poke(0)

                            c.io.write.resp.valid.expect(1)
                            scoreboard += (addr -> data)
                            if(verbose) println("PASS[store miss dirty]<<<<")
                            c.clock.step()
                            store_miss_dirty = store_miss_dirty + 1
                        }
                    } else { // store hit
                        if(verbose) println(">>>>[STORE HIT]")
                        c.clock.step()
                        c.io.write.resp.valid.expect(1)
                        
                        scoreboard += (addr -> data)
                        if(verbose) println("PASS[STORE HIT]<<<<")
                        c.clock.step()
                        store_hit = store_hit + 1
                    }
                }   
            }
            println(s"load: ${load}  load_hit:${load_hit}  load_miss:${load_miss}  load_miss_dirty:${load_miss_dirty}")
            println(s"store: ${store}  store_hit:${store_hit}  store_miss:${store_miss}  store_miss_dirty:${store_miss_dirty}")
        }
    }


}
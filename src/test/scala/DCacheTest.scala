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
            dcacheSets =  64,
            dcacheWays = 4,
        )
    })
    // it should "test read miss and read hit" in {
    //     test(new DCache_1()(defaultConfig)).withAnnotations(annos) { c => 
    //         val resp = c.io.tlbus.resp

    //         def read(addr: Int): Unit = {
    //             c.io.read.req.valid.poke(1)
    //             c.io.read.req.bits.addr.poke(addr)
    //             c.clock.step()
    //             c.io.read.req.valid.poke(0)
    //         }

    //         def read_1(addr: Int): Unit = {
    //             c.io.read.req.valid.poke(1)
    //             c.io.read.req.bits.addr.poke(addr)
    //         }

    //         def respRefill(data: Int, source: Int): Unit = {
    //             resp.valid.poke(1)
    //             resp.bits.data.poke(data)
    //             resp.bits.source.poke(source)
    //             resp.bits.opcode.poke(1) // AccessAckData
    //             // c.clock.step()
    //         }

    //         def respRefill_1(data: Int, source: Int): Unit = {
    //             resp.valid.poke(1)
    //             resp.bits.data.poke(data)
    //             resp.bits.source.poke(source)
    //             resp.bits.opcode.poke(1) // AccessAckData
    //             c.clock.step()
    //         }

    //         val testCaseNum = 100
    //         val dcacheByteOffsetBits = 2
    //         val dcacheBlockBits = 1

    //         val memSize = 1000
    //         var mem = (0 until memSize).map{ i => nextInt(math.pow(2,20).toInt)}
    //         val addrs = Seq.fill(testCaseNum)((nextInt(memSize).toInt  >> (dcacheByteOffsetBits)) << (dcacheByteOffsetBits) )
            
    //         var scoreboard: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map() // (addr, data)
            
    //         c.io.tlbus.req.ready.poke(1)
    //         c.io.read.resp.ready.poke(1)

    //         // var i = 0
    //         // println("\nread miss test")
    //         // while(i < testCaseNum-1) {
    //         //     if(!scoreboard.contains(addrs(i))) {
    //         //         val expectData = mem(addrs(i) >> (dcacheByteOffsetBits))
    //         //         println(s">>>[rd miss][${i}]expect: ${expectData} at addr:${addrs(i)}")
    //         //         read(addrs(i))

    //         //         if(c.io.read.resp.valid.peekBoolean() != true) {
    //         //             print("waitting tlbus_req_valid")
    //         //             while(c.io.tlbus.req.valid.peekBoolean() == false) {
    //         //                 print(".")
    //         //                 c.clock.step()
    //         //             }
    //         //             println()
    //         //             val missAddr = c.io.tlbus.req.bits.address.peekInt().toInt
    //         //             println(s"missAddr:${missAddr}")
                        
    //         //             c.clock.step()
    //         //             val randDelay = nextInt(math.pow(2,2).toInt)
    //         //             for(i <- 0 until randDelay) {
    //         //                 c.clock.step()
    //         //             }
    //         //             val refillData1 = mem( (missAddr >> (dcacheByteOffsetBits + dcacheBlockBits)) << dcacheBlockBits )
    //         //             respRefill(refillData1, 1)
    //         //             c.clock.step()
    //         //             println(s"refill 1: ${refillData1}")
                        
    //         //             resp.valid.poke(0)
    //         //             val randDelay2 = nextInt(math.pow(2,2).toInt)
    //         //             for(i <- 0 until randDelay2) {
    //         //                 c.clock.step()
    //         //             }
    //         //             val refillData2 = mem( ((missAddr >> (dcacheByteOffsetBits + dcacheBlockBits)) << dcacheBlockBits) + 1) 
    //         //             respRefill(refillData2, 1)
    //         //             println(s"refill 2: ${refillData2}")

    //         //             c.io.read.resp.valid.expect(1)
    //         //             c.io.read.resp.bits.data.expect(expectData)
    //         //             c.clock.step()
    //         //             resp.valid.poke(0)
                        
    //         //             println("PASS[rd miss]<<<")
    //         //             scoreboard += (addrs(i) -> expectData)
    //         //         }else{
    //         //             println("HIT")
    //         //             c.clock.step()
    //         //         }
    //         //     } else {
    //         //         c.clock.step()
    //         //     }
    //         //     i = i + 1
    //         // }

    //         // c.clock.step(20)
            
    //         // println("\nread hit test")  
    //         // var hit = 0
    //         // var miss = 0         
    //         // for((addr, data) <- scoreboard){
    //         //     println(s">>>[rd hit]expect: ${data} at addr: ${addr}")
    //         //     read(addr)
    //         //     if(c.io.read.resp.valid.peekBoolean() == true) {
    //         //         c.io.read.resp.valid.expect(1, s"expect: ${data} at addr: ${addr}")
    //         //         c.io.read.resp.bits.data.expect(data)
    //         //         println("PASS[rd hit]<<<")
    //         //         hit = hit + 1
    //         //     }else {
    //         //         println("block has been replaced, waitting tlbus_req_valid")
    //         //         while(c.io.tlbus.req.valid.peekBoolean() == false) {
    //         //             print(".")
    //         //             c.clock.step()
    //         //         }
    //         //         println()
    //         //         c.clock.step()                   

    //         //         respRefill(1111, 1)
    //         //         c.clock.step()
    //         //         resp.valid.poke(0)
    //         //         respRefill(2222, 1)

    //         //         c.io.read.resp.valid.expect(1)
    //         //         c.clock.step()
    //         //         resp.valid.poke(0)
    //         //         miss = miss + 1
    //         //     }

    //         //     c.clock.step()
    //         // }
    //         // println(s"\nhit times: ${hit}  miss times: ${miss}  hit rate: " ++ f"${(hit.toDouble / (miss + hit).toDouble).toDouble}%.2f\n")
            

    //         // read(0)
    //         // c.io.tlbus.req.valid.expect(1)
    //         // c.clock.step()
    //         // respRefill(2222, 1)
    //         // respRefill(3333, 1)
    //         // resp.valid.poke(0)
    //         // c.clock.step()

    //         // read(1536)
    //         // c.io.tlbus.req.valid.expect(1)
    //         // c.clock.step()
    //         // respRefill(2222, 1)
    //         // respRefill(3333, 1)
    //         // resp.valid.poke(0)
    //         // c.clock.step()

    //         // read(3584)
    //         // c.io.tlbus.req.valid.expect(1)
    //         // c.clock.step()
    //         // respRefill(2222, 1)
    //         // respRefill(3333, 1)
    //         // resp.valid.poke(0)
    //         // c.clock.step()

    //         // read(7680)
    //         // c.io.tlbus.req.valid.expect(1)
    //         // c.clock.step()
    //         // respRefill(2222, 1)
    //         // respRefill(3333, 1)
    //         // resp.valid.poke(0)
    //         // c.clock.step()

    //         // read(512)
    //         // c.io.tlbus.req.valid.expect(1)
    //         // c.io.tlbus.req.bits.opcode.expect(2)
    //         // val wbData1 = c.io.tlbus.req.bits.data.peekInt().toInt
    //         // val wbAddr1 = c.io.tlbus.req.bits.address.peekInt().toInt
    //         // println(s"wbData1: ${wbData1}  wbAddr1: ${wbAddr1}")
    //         // c.clock.step()
    //         // val wbData2 = c.io.tlbus.req.bits.data.peekInt().toInt
    //         // val wbAddr2 = c.io.tlbus.req.bits.address.peekInt().toInt
    //         // println(s"wbData2: ${wbData2}  wbAddr2: ${wbAddr2}")
    //         // c.clock.step()
    //         // c.io.tlbus.resp.valid.poke(1)
    //         // c.io.tlbus.resp.bits.opcode.poke(0) // AccessAck
    //         // c.clock.step()
    //         // c.io.tlbus.resp.valid.poke(0)

    //         // c.io.tlbus.req.valid.expect(1)
    //         // c.io.tlbus.req.bits.address.expect(512)
    //         // c.io.tlbus.req.bits.opcode.expect(4) // Get
    //         // c.clock.step()
    //         // respRefill(2222, 1)
    //         // // respRefill(3333, 1)
    //         // resp.valid.poke(1)
    //         // resp.bits.data.poke(3333)
    //         // resp.bits.source.poke(1)
    //         // resp.bits.opcode.poke(1) // AccessAckData
    //         // c.io.read.resp.valid.expect(1)
    //         // c.io.read.resp.bits.data.expect(2222)

    //         // c.clock.step()
    //         // resp.valid.poke(0)
    //         // c.clock.step()

    //         var scoreboard_1: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map() // (addr, data)
    //         val testCaseNum_1 = 200

    //         var hit = 0
    //         var dirty = 0
    //         for( i <- 0 until testCaseNum_1) {
                
    //             val addr = nextInt(math.pow(2, 10).toInt) << dcacheByteOffsetBits
    //             read_1(addr)
    //             c.clock.step()
    //             c.io.read.req.valid.poke(0)

    //             if(c.io.read.resp.valid.peekBoolean() == true) { // load hit
    //                 println("HIT")
    //                 c.io.read.resp.bits.data.expect(scoreboard_1(addr))
    //                 c.clock.step()
    //                 hit = hit + 1
    //             } else { // load miss
    //                 c.io.tlbus.req.valid.expect(1)
    //                 if(c.io.tlbus.req.bits.opcode.peekInt() == 4) {// load miss clean    Get
    //                     c.clock.step()
    //                     val refillData1 = nextInt(1000).toInt
    //                     val refillData2 = nextInt(1000).toInt
                        
    //                     val tempAddr = (addr >> (dcacheBlockBits + dcacheByteOffsetBits)) << (dcacheBlockBits + dcacheByteOffsetBits)
    //                     println(s"    addr:${addr} tempAddr:${tempAddr} tempAddr+4:${tempAddr+4} ")
    //                     scoreboard_1 += ( tempAddr -> refillData1)
    //                     scoreboard_1 += (tempAddr + 4 -> refillData2)

    //                     println(s">>>[load miss clean] at addr:${addr} expect:${scoreboard_1(addr)}")
                        
    //                     respRefill(refillData1, 1)
    //                     c.clock.step()
                        
    //                     respRefill(refillData2, 1)
    //                     c.io.read.resp.valid.expect(1)
    //                     c.io.read.resp.bits.data.expect(scoreboard_1(addr))
    //                     c.clock.step()

    //                     resp.valid.poke(0)
                        
    //                     println("PASS[load miss clean]<<<\n")
    //                 } else {
    //                     println(">>>[load miss dirty] ")
    //                     val tempAddr = (addr >> (dcacheBlockBits + dcacheByteOffsetBits)) << (dcacheBlockBits + dcacheByteOffsetBits)

    //                     c.io.tlbus.req.bits.opcode.expect(2) // load miss dirty   PutFullData
    //                     val wbData1 = c.io.tlbus.req.bits.data.peekInt().toInt
    //                     val wbAddr1 = c.io.tlbus.req.bits.address.peekInt().toInt
    //                     println(s"wbData1: ${wbData1}  wbAddr1: ${wbAddr1}")
    //                     c.clock.step()
    //                     val wbData2 = c.io.tlbus.req.bits.data.peekInt().toInt
    //                     val wbAddr2 = c.io.tlbus.req.bits.address.peekInt().toInt
    //                     println(s"wbData2: ${wbData2}  wbAddr2: ${wbAddr2}")
    //                     c.clock.step()

    //                     c.io.tlbus.resp.valid.poke(1)
    //                     c.io.tlbus.resp.bits.opcode.poke(0) // AccessAck
                        
    //                     c.clock.step()
    //                     c.io.tlbus.resp.valid.poke(0)
    //                     // c.clock.step()
                        
    //                     // c.io.tlbus.req.valid.expect(1) // !
    //                     c.io.tlbus.req.bits.address.expect(tempAddr)
    //                     c.io.tlbus.req.bits.opcode.expect(4) // Get
    //                     c.clock.step()
    //                     c.io.tlbus.resp.valid.poke(0)
    //                     val refillData1 = nextInt(1000).toInt
    //                     val refillData2 = nextInt(1000).toInt
    //                     // val tempAddr = (addr >> (dcacheBlockBits + dcacheByteOffsetBits)) << (dcacheBlockBits + dcacheByteOffsetBits)
    //                     println(s"    addr:${addr} tempAddr:${tempAddr} tempAddr+4:${tempAddr+4} ")
    //                     println(s"    refillData1:${refillData1}  refillData2:${refillData2}")
    //                     scoreboard_1 += ( tempAddr -> refillData1)
    //                     scoreboard_1 += (tempAddr + 4 -> refillData2)

    //                     respRefill(refillData1, 1)
    //                     c.clock.step()

    //                     respRefill(refillData2, 1)
    //                     c.io.read.resp.valid.expect(1)
    //                     c.io.read.resp.bits.data.expect(scoreboard_1(addr))
    //                     c.clock.step()
                        
    //                     c.io.tlbus.resp.valid.poke(0)
    //                     resp.valid.poke(0)
    //                     println("PASS[load miss dirty]<<<\n")
    //                     dirty = dirty + 1

    //                     // c.clock.step(500)
    //                 }
    //             }
    //         }
    //         println(s"hit times:${hit}   dirty times:${dirty}")
    //         c.clock.step(10)

    //     }
    // }



    it should "test write miss and write hit" in {
        test(new DCache_1()(defaultConfig)).withAnnotations(annos) { c => 
            val resp = c.io.tlbus.resp

            def init(): Unit = {
                c.io.tlbus.req.ready.poke(1)
                c.io.write.resp.ready.poke(1)
                c.io.read.resp.ready.poke(1)
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
            // simple write dirty test
            write(0, 100, "b1111".U)
            c.io.write.resp.valid.expect(0)
            c.io.tlbus.req.valid.expect(1)
            c.clock.step()
            respRefill(2222, 1)
            respRefill(3333, 1)
            c.io.write.resp.valid.expect(1)
            resp.valid.poke(0)
            c.clock.step()


            write(1536, 101, "b1111".U)
            c.io.write.resp.valid.expect(0)
            c.io.tlbus.req.valid.expect(1)
            c.clock.step()
            respRefill(2222, 1)
            respRefill(3333, 1)
            c.io.write.resp.valid.expect(1)
            resp.valid.poke(0)
            c.clock.step()


            write(3584, 102, "b1111".U)
            c.io.write.resp.valid.expect(0)
            c.io.tlbus.req.valid.expect(1)
            c.clock.step()
            respRefill(2222, 1)
            respRefill(3333, 1)
            c.io.write.resp.valid.expect(1)
            resp.valid.poke(0)
            c.clock.step()


            write(7680, 103, "b1111".U)
            c.io.write.resp.valid.expect(0)
            c.io.tlbus.req.valid.expect(1)
            c.clock.step()
            respRefill(2222, 1)
            respRefill(3333, 1)
            c.io.write.resp.valid.expect(1)
            resp.valid.poke(0)
            c.clock.step()


            write(512, 120, "b1111".U)
            c.clock.step(2)
            c.io.tlbus.resp.bits.opcode.poke(0) // AccessAck
            c.io.tlbus.resp.valid.poke(1)
            c.clock.step()
            c.io.tlbus.resp.valid.poke(0)
            c.io.tlbus.req.valid.expect(1)
            c.clock.step()
            respRefill(2222, 1)
            respRefill(3333, 1)
            resp.valid.poke(0)
            
            c.clock.step(20)

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
            val testCaseNum = 2

            def tlValid: Boolean = c.io.tlbus.req.valid.peekBoolean()
            def tlOpcode: Int = c.io.tlbus.req.bits.opcode.peekInt().toInt
            val Get = 4
            val PutFullData = 2

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
                        c.clock.step()
                        respRefill(refillData1,1)
                        respRefill(refillData2,1)
                        c.clock.step()
                        c.io.write.resp.valid.expect(1)
                        resp.valid.poke(0)
                    } else if (tlOpcode == PutFullData) { // store miss diry  PutFullData
                        
                    }
                } else { // store hit

                }

                if(c.io.write.resp.valid.peekBoolean() == true) { // store hit
                    println("STORE HIT")
                    c.clock.step()
                } else { // store miss
                    
                }
            }

        }
    }






    // it should "test DCache write miss and write hit" in {
    //     test(new DCache_1()(defaultConfig)).withAnnotations(annos) { c => 
    //         val resp = c.io.tlbus.resp

    //         def init(): Unit = {
    //             c.io.tlbus.req.ready.poke(1)
    //             c.io.write.resp.ready.poke(1)
    //             c.io.read.resp.ready.poke(1)
    //         }

    //         def read(addr: Int): Unit = {
    //             c.io.read.req.valid.poke(1)
    //             c.io.read.req.bits.addr.poke(addr)
    //             c.clock.step()
    //             c.io.read.req.valid.poke(0)
    //         }

    //         def respRefill(data: Int, source: Int): Unit = {
    //             resp.valid.poke(1)
    //             resp.bits.data.poke(data)
    //             resp.bits.source.poke(source)
    //             resp.bits.opcode.poke(1) // AccessAckData
    //             c.clock.step()
    //         }

    //         def write(addr: Int, data: Int, mask: UInt): Unit = {
    //             c.io.write.req.valid.poke(1)
    //             c.io.write.req.bits.addr.poke(addr)
    //             c.io.write.req.bits.data.poke(data)
    //             c.io.write.req.bits.mask.poke(mask)
    //             c.clock.step()
    //             c.io.write.req.valid.poke(0)
    //         }

    //         def readHitTest(addr: Int, expectData: Int): Unit = {
    //             read(addr)
    //             // c.clock.step()
    //             if(c.io.read.resp.valid.peekBoolean() == true) {
    //                 c.io.read.resp.valid.expect(1)
    //                 val rdata = c.io.read.resp.bits.data.peekInt().toInt
    //                 assert(rdata == expectData || rdata == 1111, s"expect:${expectData}  get:${rdata} at addr:${addr}")
    //             }else{
    //                 while(c.io.tlbus.req.valid.peekBoolean() == false) {
    //                     print(".")
    //                     c.clock.step()
    //                 }
    //                 c.clock.step()
    //                 println("MISS")
    //                 respRefill(1111, 1)
    //                 respRefill(1111, 1)
    //                 resp.valid.poke(0)
    //             }
    //         }

            
    //         val dcacheByteOffsetBits = 2
    //         val dcacheBlockBits = 1
    //         val off = dcacheBlockBits + dcacheByteOffsetBits

    //         val testCaseNum = 100
    //         import scala.collection.mutable.Set
    //         var addrs_1: Set[Int] = Set()
    //         while(addrs_1.size < testCaseNum){ addrs_1 += nextInt(math.pow(2,20).toInt) >> off << off }
    //         val addrs = addrs_1.toList
    //         val datas = (0 until testCaseNum).map{ i => nextInt(math.pow(2,20).toInt) }

    //         var scoreboard: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map() // (addr, data)

    //         init()

    //         for(i <- 0 until testCaseNum){
    //             if(!scoreboard.contains(addrs(i))) {
    //                 val refillData1 = nextInt(math.pow(2,20).toInt)
    //                 val refillData2 = nextInt(math.pow(2,20).toInt)
    //                 println(s">>>[wr miss]expect: ${refillData1} at addr:${addrs(i)}")

    //                 write(addrs(i), datas(i), "b1111".U)
    //                 c.io.write.resp.valid.expect(0)
    //                 print("waitting tlbus_req_valid") 
    //                 while(c.io.tlbus.req.valid.peekBoolean() == false) {
    //                     print(".")
    //                     c.clock.step()
    //                 }
    //                 println()
    //                 c.io.tlbus.req.bits.address.expect(addrs(i) >> off << off)
    //                 c.clock.step()
                    
                    
    //                 val missAddr = c.io.tlbus.req.bits.address.peekInt().toInt
                    
    //                 respRefill(refillData1, 1)
    //                 scoreboard += (addrs(i) -> datas(i))
                    
    //                 respRefill(refillData2, 1)
    //                 scoreboard += (addrs(i) + 4 -> refillData2)
                    
    //                 c.io.read.resp.valid.expect(0)
    //                 c.io.write.resp.valid.expect(1)
    //                 resp.valid.poke(0)

    //                 c.clock.step() // delay one cycle for writting data
    //                 println("PASS[wr miss]<<<")
                    
    //             } else {
    //                 c.clock.step()
    //             }
    //         }

    //         c.clock.step(20)
    //         println("\n readback test")
    //         for((addr, data) <- scoreboard) {
    //             println(s">>>[rd hit]expect: ${data} at addr:${addr}")
    //             readHitTest(addr, data)
    //             c.clock.step()
    //             println("PASS<<[rd hit]")
    //         }

    //         c.clock.step(20)
    //         println("\n write hit test")
    //         var dirtys: List[Int] = List()
    //         for((addr, data) <- scoreboard) {
    //             println(s">>>[wr hit]expect: ${data} at addr:${addr}")
    //             write(addr, 2222, "b1111".U)
    //             if(c.io.tlbus.req.valid.peekBoolean() == true){
    //                 c.clock.step()
    //                 println("MISS")
    //                 respRefill(1111, 1)
    //                 respRefill(1111, 1)
    //                 resp.valid.poke(0)
    //                 scoreboard(addr) = 1111
    //                 scoreboard(addr+4) = 1111

    //                 dirtys = dirtys :+ 0 
    //             }else {
    //                 c.clock.step()
    //                 if(c.io.write.resp.valid.peekBoolean() == true) {
    //                     c.clock.step()
    //                     scoreboard(addr) = 2222
    //                 }
    //                 println("PASS<<[wr hit]")
    //                 dirtys = dirtys :+ 1 // write dirty block
    //             }
    //         }
            
    //         var scoreboard2: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map() // (addr, data)
            
    //         c.clock.step(20)
    //         println("\n write miss dirty test")
    //         for(((addr,data), dirty) <- scoreboard zip dirtys) {
    //             println(s">>>[wr miss dirty] addr: ${addr}  data:${data}  dirty:${dirty}")
    //             if(dirty == 1) {
    //                 val randAddr = nextInt(math.pow(2,20).toInt)
    //                 val randData = nextInt(math.pow(2,20).toInt)
    //                 write(randAddr, randData, "b1111".U)
    //                 if(c.io.write.resp.valid.peekBoolean() == true) {
    //                     println("randAddr HIT")
    //                 } else {
    //                     val reqOpcode = c.io.tlbus.req.bits.opcode.peekInt().toInt
    //                     if(reqOpcode == 4)  { // Get
    //                         println("ONLY MISS")
    //                         respRefill(1111, 1)
    //                         respRefill(1111, 1)
    //                         resp.valid.poke(0)
    //                     } else if(reqOpcode == 2) {// PutFullData
                            
    //                         val writebackData1 = c.io.tlbus.req.bits.data.peekInt().toInt
    //                         val writebackAddr = c.io.tlbus.req.bits.address.peekInt().toInt
    //                         println(s"writeback Data1 is ${writebackData1} at addr:${writebackAddr}")
    //                         c.clock.step()
                            
    //                         for(i <- 0 until nextInt(5)) { c.clock.step() }
    //                         c.io.tlbus.resp.valid.poke(1)
    //                         c.io.tlbus.resp.bits.opcode.poke(0) // AccessAck = 0.U

    //                         while(c.io.tlbus.req.valid.peekBoolean() == false) {
    //                             print(".")
    //                             c.clock.step()
    //                         }
    //                         println()
    //                         c.clock.step()

    //                         println("PASS<<<[wr miss dirty]")
    //                     }
    //                 }
    //             } else {
    //                 c.clock.step()
    //             }
    //         }
    //     }
    // }

}
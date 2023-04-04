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
import chisel3.util.log2Ceil


class DCacheTest extends AnyFlatSpec with ChiselScalatestTester{
    behavior of "DCache"
    // val annos = Seq(VcsBackendAnnotation, WriteVcdAnnotation)
    val annos = Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)
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
            dcacheWays = 2,
            dcacheBlockSize = 8,
        )
    })
    // it should "test read miss and read hit" in {
    //     test(new DCache_1()(defaultConfig)).withAnnotations(annos) { c => 
            
    //         case class p()(implicit val p: Parameters) extends HasMyCpuParameters
    //         val param = p()(c.p)
    //         val resp = c.io.tlbus.resp

    //         def init() = {
    //             c.io.tlbus.req.ready.poke(1)
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
    //             // c.clock.step()
    //         }

    //         def randData() = nextInt(math.pow(2,20).toInt)
            
    //         def addrToBlockAddr(addr: Int): Int = {
    //             (addr >> (param.dcacheBlockBits + param.dcacheByteOffsetBits)) << (param.dcacheBlockBits + param.dcacheByteOffsetBits)
    //         }

    //         var scoreboard: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map() // (addr, data)
    //         val testCaseNum = 200

    //         var hitTimes = 0
    //         init()
    //         for( i <- 0 until testCaseNum) {
    //             val addr = nextInt(math.pow(2, 10).toInt) << param.dcacheByteOffsetBits

    //             read(addr)

    //             while(!c.io.tlbus.req.valid.peekBoolean() && !c.io.read.resp.valid.peekBoolean()) {
    //                 c.clock.step()
    //             }
    //             val missClean = c.io.tlbus.req.valid.peekBoolean() && c.io.tlbus.req.bits.opcode.peekInt().toInt == 4 // Get
    //             // val missDirty = c.io.tlbus.req.valid.peekBoolean() && c.io.tlbus.req.bits.opcode.peekInt().toInt == 2 // PutFullData
    //             val hit = c.io.read.resp.valid.peekBoolean()

    //             val reqBeat = c.io.tlbus.req.bits.size.peekInt().toInt >> log2Ceil(param.busBeatSize)
                
                
    //             if(missClean) {
    //                 c.clock.step()
    //                 println(">>>load miss clean")
    //                 for(i <- 0 until reqBeat) {
    //                     val refillData = randData()
    //                     val blockAddr = addrToBlockAddr(addr)
    //                     scoreboard += (blockAddr + (i << param.blockOffsetBits) -> refillData)

    //                     respRefill(refillData, 1)
    //                     if(i == reqBeat - 1) {
    //                         c.io.read.resp.valid.expect(1)
    //                         c.io.read.resp.bits.data.expect(scoreboard(addr))
    //                     }
    //                     c.clock.step()
    //                     resp.valid.poke(0)
    //                 }
    //             } else if(hit) {
    //                 println(">>>load HIT")
    //                 c.io.read.resp.valid.expect(1)
    //                 c.io.read.resp.bits.data.expect(scoreboard(addr))
    //                 c.clock.step()
    //                 hitTimes = hitTimes + 1
    //             }
    //         }
    //         println(s"hit times:${hitTimes}   totalTimes:${testCaseNum}")
    //         c.clock.step(10)
    //     }
    // }

    // it should "test write miss and write hit" in {
    //     test(new DCache_1()(defaultConfig)).withAnnotations(annos) { c => 

    //         case class p()(implicit val p: Parameters) extends HasMyCpuParameters
    //         val param = p()(c.p)
    //         val resp = c.io.tlbus.resp

    //         def init(): Unit = {
    //             c.io.tlbus.req.ready.poke(1)
    //             c.io.write.resp.ready.poke(1)
    //             c.io.read.resp.ready.poke(1)
    //             c.io.tlbus.req.ready.poke(1)
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
    //             // c.clock.step()
    //         }

    //         def write(addr: Int, data: Int, mask: Int): Unit = {
    //             c.io.write.req.valid.poke(1)
    //             c.io.write.req.bits.addr.poke(addr)
    //             c.io.write.req.bits.data.poke(data)
    //             c.io.write.req.bits.mask.poke(mask)
    //             c.clock.step()
    //             c.io.write.req.valid.poke(0)
    //         }

    //         def fill(value: Int, times: Int): BigInt = {
    //             require(times >= 0, "Times should be non-negative")
    //             if (times == 0) {
    //             BigInt(0)
    //             } else {
    //             val binaryValue = value.toBinaryString
    //             val filledBinaryValue = binaryValue * times
    //             BigInt(filledBinaryValue, 2)
    //             }
    //         }

    //         def randData() = nextInt(math.pow(2,20).toInt)

    //         def addrToBlockAddr(addr: Int): Int = {
    //             (addr >> (param.dcacheBlockBits + param.dcacheByteOffsetBits)) << (param.dcacheBlockBits + param.dcacheByteOffsetBits)
    //         }
            

    //         init()

    //         // val off = param.dcacheBlockBits + param.dcacheByteOffsetBits

    //         var scoreboard: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map() // (addr, data)
    //         val testCaseNum = 200

    //         def tlValid: Boolean = c.io.tlbus.req.valid.peekBoolean()
    //         def tlOpcode: Int = c.io.tlbus.req.bits.opcode.peekInt().toInt
    //         val Get = 4
    //         val PutFullData = 2
    //         val AccessAck = 0
    //         val AccessAckData = 1
            

    //         var hitTimes = 0
    //         var dirtyTimes = 0
    //         for(i <- 0 until testCaseNum) {
    //             val addr = nextInt(math.pow(2, 20).toInt) << param.dcacheByteOffsetBits
    //             val data = nextInt(math.pow(2, 20).toInt)
    //             write(addr, data, fill(1, param.dcacheBlockBytes).toInt)
                
    //             while(!c.io.tlbus.req.valid.peekBoolean() && !c.io.write.resp.valid.peekBoolean()) {
    //                 c.clock.step()
    //             }

    //             val reqBeat = c.io.tlbus.req.bits.size.peekInt().toInt >> log2Ceil(param.busBeatSize)
    //             val missClean = c.io.tlbus.req.valid.peekBoolean() && c.io.tlbus.req.bits.opcode.peekInt().toInt == 4 // Get
    //             val missDirty = c.io.tlbus.req.valid.peekBoolean() && c.io.tlbus.req.bits.opcode.peekInt().toInt == 2 // PutFullData
    //             val hit = c.io.write.resp.valid.peekBoolean()

    //             if(missClean) {
    //                 c.clock.step()
    //                 println(">>>store miss clean")
    //                 for(i <- 0 until reqBeat) {
    //                     val refillData = randData()
    //                     val blockAddr = addrToBlockAddr(addr)
    //                     scoreboard += (blockAddr + (i << param.blockOffsetBits) -> refillData)

    //                     respRefill(refillData, 1)
    //                     c.clock.step()
    //                     resp.valid.poke(0)
    //                 }
    //                 c.clock.step()
    //                 scoreboard += (addr -> data)

    //                 // read back
    //                 read(addr)
    //                 while(!c.io.read.resp.valid.peekBoolean()) c.clock.step()
    //                 c.io.read.resp.bits.data.expect(scoreboard(addr))
    //                 c.clock.step()
    //                 println("<<<<[PASS]")
    //             } else if(missDirty) {
    //                 // c.clock.step()
    //                 println(">>>store miss dirty")
    //                 for(i <- 0 until reqBeat) {
    //                     c.io.tlbus.req.valid.expect(1)
    //                     c.io.tlbus.req.bits.opcode.expect(PutFullData)
    //                     c.io.tlbus.req.bits.data.expect(scoreboard(c.io.tlbus.req.bits.address.peekInt().toInt))
    //                     c.clock.step()
    //                 }
    //                 c.io.tlbus.resp.valid.poke(1)
    //                 c.io.tlbus.resp.bits.opcode.poke(1) // AccessAckData
    //                 c.clock.step()
    //                 c.io.tlbus.resp.valid.poke(0)

    //                 while(!c.io.tlbus.req.valid.peekBoolean()) c.clock.step()
    //                 c.io.tlbus.req.bits.opcode.expect(4) // Get
    //                 c.clock.step()

    //                 for(i <- 0 until reqBeat) {
    //                     val refillData = randData()
    //                     val blockAddr = addrToBlockAddr(addr)
    //                     scoreboard += (blockAddr + (i << param.blockOffsetBits) -> refillData)
    //                     respRefill(refillData, 1)
    //                     c.clock.step()
    //                     resp.valid.poke(0)
    //                 }
    //                 c.io.write.resp.valid.expect(1)
    //                 c.clock.step()
    //                 scoreboard += (addr -> data)

    //                 // read back
    //                 read(addr)
    //                 while(!c.io.read.resp.valid.peekBoolean()) c.clock.step()
    //                 c.io.read.resp.bits.data.expect(scoreboard(addr))
    //                 c.clock.step()
    //                 println("<<<<[PASS]")

    //                 dirtyTimes = dirtyTimes + 1
    //             } else if(hit) {
    //                 println(">>>> store HIT")
    //                 scoreboard += (addr -> data)
    //                 while(!c.io.write.resp.valid.peekBoolean()) c.clock.step()
    //                 c.clock.step()

    //                 hitTimes = hitTimes + 1
    //             }
    //         }
    //         println(s"hitTimes: ${hitTimes}  dirtyTimes: ${dirtyTimes}  totalTimes: ${testCaseNum}")
    //         c.clock.step(10)
    //     }
    // }

    it should "test both write and read" in {
        test(new DCache_1()(defaultConfig)).withAnnotations(annos) { c =>

            case class p()(implicit val p: Parameters) extends HasMyCpuParameters
            val param = p()(c.p)
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
                // c.clock.step()
            }

            def write(addr: Int, data: Int, mask: Int): Unit = {
                c.io.write.req.valid.poke(1)
                c.io.write.req.bits.addr.poke(addr)
                c.io.write.req.bits.data.poke(data)
                c.io.write.req.bits.mask.poke(mask)
                c.clock.step()
                c.io.write.req.valid.poke(0)
            }

            def fill(value: Int, times: Int): BigInt = {
                require(times >= 0, "Times should be non-negative")
                if (times == 0) {
                BigInt(0)
                } else {
                val binaryValue = value.toBinaryString
                val filledBinaryValue = binaryValue * times
                BigInt(filledBinaryValue, 2)
                }
            }

            def randData() = nextInt(math.pow(2,20).toInt)

            def addrToBlockAddr(addr: Int): Int = {
                (addr >> (param.dcacheBlockBits + param.dcacheByteOffsetBits)) << (param.dcacheBlockBits + param.dcacheByteOffsetBits)
            }

            val dcacheByteOffsetBits = 2
            val dcacheBlockBits = 1
            val off = dcacheBlockBits + dcacheByteOffsetBits

            var scoreboard: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map() // (addr, data)
            var dirtyBoard: scala.collection.mutable.Map[Int, Boolean] = scala.collection.mutable.Map() // (addr, dirty)
            val testCaseNum = 10000

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

            // ----------------------------------------------------------------
            // def storeMissClean(addr: Int) = {
            //     write(addr, randData, fill(1, param.dcacheBlockBytes).toInt)
            //     while(!c.io.tlbus.req.valid.peekBoolean() && !c.io.read.resp.valid.peekBoolean()) {
            //                 c.clock.step()
            //     }
            //     val reqBeat = c.io.tlbus.req.bits.size.peekInt().toInt >> log2Ceil(param.busBeatSize)
            //     c.clock.step()
            //     for(i <- 0 until reqBeat) {
            //         val refillData = randData()
            //         val blockAddr = addrToBlockAddr(addr)
            //         scoreboard += (blockAddr + (i << param.blockOffsetBits) -> refillData)

            //         respRefill(refillData, 1)
            //         c.clock.step()
            //         resp.valid.poke(0)
            //     }
            //     c.clock.step()
            // }

            // storeMissClean(0)
            // storeMissClean(2048)

            // c.clock.step(10)
            // read(4096) // load miss dirty



            // c.clock.step(100)

            // ----------------------------------------------------------------

            for( i <- 0 until testCaseNum) {
                val addr = nextInt(math.pow(2, 15).toInt) << param.dcacheByteOffsetBits
                val data = nextInt(math.pow(2, 20).toInt)

                val reqType = nextInt(2)
                if(reqType == 0) { // read
                    load = load + 1
                    read(addr)

                    while(!c.io.tlbus.req.valid.peekBoolean() && !c.io.read.resp.valid.peekBoolean()) {
                        c.clock.step()
                    }
                    val missClean = c.io.tlbus.req.valid.peekBoolean() && c.io.tlbus.req.bits.opcode.peekInt().toInt == 4 // Get
                    val missDirty = c.io.tlbus.req.valid.peekBoolean() && c.io.tlbus.req.bits.opcode.peekInt().toInt == 2 // PutFullData
                    val hit = c.io.read.resp.valid.peekBoolean()

                    val reqBeat = c.io.tlbus.req.bits.size.peekInt().toInt >> log2Ceil(param.busBeatSize)
                    
                    
                    if(missClean) {
                        c.clock.step()
                        println(">>>load miss clean")
                        for(i <- 0 until reqBeat) {
                            val refillData = randData()
                            val blockAddr = addrToBlockAddr(addr)
                            scoreboard += (blockAddr + (i << param.blockOffsetBits) -> refillData)

                            respRefill(refillData, 1)
                            if(i == reqBeat - 1) {
                                c.io.read.resp.valid.expect(1)
                                c.io.read.resp.bits.data.expect(scoreboard(addr))
                            }
                            c.clock.step()
                            resp.valid.poke(0)
                            load_miss = load_miss + 1
                        }
                    } else if(missDirty) {
                        println(">>> load miss dirty")
                        for(i <- 0 until reqBeat) {
                            c.io.tlbus.req.valid.expect(1)
                            c.io.tlbus.req.bits.opcode.expect(PutFullData)
                            c.io.tlbus.req.bits.data.expect(scoreboard(c.io.tlbus.req.bits.address.peekInt().toInt))
                            c.clock.step()
                        }

                        c.io.tlbus.resp.valid.poke(1)
                        c.io.tlbus.resp.bits.opcode.poke(1) // AccessAckData
                        c.clock.step()
                        c.io.tlbus.resp.valid.poke(0)

                        while(!c.io.tlbus.req.valid.peekBoolean()) c.clock.step()
                        c.io.tlbus.req.bits.opcode.expect(4) // Get
                        c.clock.step()

                        for(i <- 0 until reqBeat) {
                            val refillData = randData()
                            val blockAddr = addrToBlockAddr(addr)
                            scoreboard += (blockAddr + (i << param.blockOffsetBits) -> refillData)
                            respRefill(refillData, 1)
                            if( i == reqBeat - 1) {
                                c.io.read.resp.valid.expect(1)
                                c.io.read.resp.bits.data.expect(scoreboard(addr))
                            }
                            c.clock.step()
                            resp.valid.poke(0)
                        }

                        load_miss_dirty = load_miss_dirty + 1
                    } else if(hit) {
                        println(">>>load HIT")
                        c.io.read.resp.valid.expect(1)
                        c.io.read.resp.bits.data.expect(scoreboard(addr))
                        c.clock.step()

                        load_hit = load_hit + 1
                    }
                    // if(dirtyBoard.getOrElse(addr, false))
                    //     assert( dirtyBoard(addr) & (missDirty || hit))
                } else { // write
                    store = store + 1
                    write(addr, data, fill(1, param.dcacheBlockBytes).toInt)
                
                    while(!c.io.tlbus.req.valid.peekBoolean() && !c.io.write.resp.valid.peekBoolean()) {
                        c.clock.step()
                    }

                    val reqBeat = c.io.tlbus.req.bits.size.peekInt().toInt >> log2Ceil(param.busBeatSize)
                    val missClean = c.io.tlbus.req.valid.peekBoolean() && c.io.tlbus.req.bits.opcode.peekInt().toInt == 4 // Get
                    val missDirty = c.io.tlbus.req.valid.peekBoolean() && c.io.tlbus.req.bits.opcode.peekInt().toInt == 2 // PutFullData
                    val hit = c.io.write.resp.valid.peekBoolean()
                    
                    dirtyBoard += (addr -> true)
                    if(missDirty) dirtyBoard += (addr -> false)

                    if(missClean) {
                        c.clock.step()
                        println(">>>store miss clean")
                        for(i <- 0 until reqBeat) {
                            val refillData = randData()
                            val blockAddr = addrToBlockAddr(addr)
                            scoreboard += (blockAddr + (i << param.blockOffsetBits) -> refillData)

                            respRefill(refillData, 1)
                            c.clock.step()
                            resp.valid.poke(0)
                        }
                        c.clock.step()
                        scoreboard += (addr -> data)

                        // read back
                        read(addr)
                        while(!c.io.read.resp.valid.peekBoolean()) c.clock.step()
                        c.io.read.resp.bits.data.expect(scoreboard(addr))
                        c.clock.step()
                        println("<<<<[PASS]")

                        store_miss = store_miss + 1
                    } else if(missDirty) {
                        // c.clock.step()
                        println(">>>store miss dirty")
                        for(i <- 0 until reqBeat) {
                            c.io.tlbus.req.valid.expect(1)
                            c.io.tlbus.req.bits.opcode.expect(PutFullData)
                            c.io.tlbus.req.bits.data.expect(scoreboard(c.io.tlbus.req.bits.address.peekInt().toInt))
                            c.clock.step()
                        }
                        c.io.tlbus.resp.valid.poke(1)
                        c.io.tlbus.resp.bits.opcode.poke(1) // AccessAckData
                        c.clock.step()
                        c.io.tlbus.resp.valid.poke(0)

                        while(!c.io.tlbus.req.valid.peekBoolean()) c.clock.step()
                        c.io.tlbus.req.bits.opcode.expect(4) // Get
                        c.clock.step()

                        for(i <- 0 until reqBeat) {
                            val refillData = randData()
                            val blockAddr = addrToBlockAddr(addr)
                            scoreboard += (blockAddr + (i << param.blockOffsetBits) -> refillData)
                            respRefill(refillData, 1)
                            c.clock.step()
                            resp.valid.poke(0)
                        }
                        c.io.write.resp.valid.expect(1)
                        c.clock.step()
                        scoreboard += (addr -> data)

                        // read back
                        read(addr)
                        while(!c.io.read.resp.valid.peekBoolean()) c.clock.step()
                        c.io.read.resp.bits.data.expect(scoreboard(addr))
                        c.clock.step()
                        println("<<<<[PASS]")
                        
                        store_miss_dirty = store_miss_dirty + 1
                    } else if(hit) {
                        println(">>>> store HIT")
                        scoreboard += (addr -> data)
                        while(!c.io.write.resp.valid.peekBoolean()) c.clock.step()
                        c.clock.step()

                        store_hit = store_hit + 1
                    }
                }
            }

            println(s"load: ${load}  load_hit:${load_hit}  load_miss:${load_miss}  load_miss_dirty:${load_miss_dirty}")
            println(s"store: ${store}  store_hit:${store_hit}  store_miss:${store_miss}  store_miss_dirty:${store_miss_dirty}")
            assert(load_miss_dirty != 0)
            assert(store_miss_dirty != 0)
        }
    }


}

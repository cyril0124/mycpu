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
    //         val testCaseNum = 20

    //         def reset(): Unit = {
    //             c.reset.poke(true.B)
    //             c.clock.step(2)
    //             c.reset.poke(false.B)
    //             c.clock.step(2)
    //         }

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

    //         def rwTest(addr: Int, data: Int, mask: UInt): Unit = {
    //             write(addr, data, mask)
    //             val rdata = read(addr)
    //             c.io.rdata.expect(data.U, s"in addr ${addr}")
    //         }

    //         println()
    //         reset()
    //         for( i <- 0 until testCaseNum) {
    //             val addr = nextInt(1024) / 4 * 4
    //             val data = nextInt(math.pow(2, 4*8).toInt)
    //             rwTest(addr, data, "b1111".U)
    //         }

    //         println()
    //         reset()
    //         for( i <- 0 until testCaseNum) {
    //             val addr = nextInt(1024) / 4 * 4
    //             val data = nextInt(math.pow(2, 3*8).toInt)
    //             rwTest(addr, data, "b0111".U)
    //         }
            
    //         println()
    //         reset()
    //         for( i <- 0 until testCaseNum) {
    //             val addr = nextInt(1024) / 4 * 4
    //             val data = nextInt(math.pow(2, 3*8).toInt)
    //             rwTest(addr, data, "b0011".U)
    //         }
            
    //         println()
    //         reset()
    //         for( i <- 0 until testCaseNum) {
    //             val addr = nextInt(1024) / 4 * 4
    //             val data = nextInt(math.pow(2, 1*8).toInt)
    //             rwTest(addr, data, "b0001".U)
    //         }
    //     }
    // }

    // it should "test DataBank" in {
    //     test(new DCacheDataBank(UInt(64.W))).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
    //         var scoreboard: scala.collection.mutable.Map[(Int, Int),Int] = scala.collection.mutable.Map()

    //         val testCaseNum = 200
    //         val wdata = Seq.fill(testCaseNum)(nextInt(math.pow(2, 32).toInt))
    //         val en = Seq.fill(testCaseNum)(nextInt(2))
    //         val set = Seq.fill(testCaseNum)(nextInt(64))
    //         val way = Seq.fill(testCaseNum)(nextInt(4))

    //         def write(set: Int, way: Int, data: Int, memType: UInt): Unit = {
    //             c.io.r.en.poke(0.U)
    //             c.io.w.en.poke(1.U)
    //             c.io.w.set.poke(set.U)
    //             c.io.w.way.poke(way.U)
    //             c.io.w.data.poke(data.U)
    //             c.io.w.memType.poke(memType)
    //             c.clock.step()
    //         }

    //         def writeWithEn(set: Int, way: Int, data: Int, memType: UInt, en: Int): Unit = {
    //             if(en == 0) {
    //                 c.io.r.en.poke(0.U)
    //                 c.io.w.en.poke(0.U)
    //                 c.io.w.set.poke(set.U)
    //                 c.io.w.way.poke(way.U)
    //                 c.io.w.data.poke(data.U)
    //                 c.io.w.memType.poke(memType)
    //                 c.clock.step()
    //             }
    //             else
    //                 write(set,way,data,memType)
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

    //         def readWithEn(set: Int, way: Int, memType: UInt, en: Int): UInt = {
    //             if(en == 0) {
    //                 c.io.r.en.poke(0.U)
    //                 c.clock.step()
    //                 0.U
    //             }
    //             else
    //                 read(set,way,memType)
    //         }

    //         for(i <- 0 until testCaseNum){
    //             val mset = set(i)
    //             val mway = way(i)
    //             val mwdata = wdata(i)
    //             val men = en(i)
    //             if(men == 1) {
    //                 write(mset,mway,mwdata,"b010".U)
    //                 if(scoreboard.contains((mset, mway))) {
    //                     scoreboard((mset, mway)) = mwdata
    //                     println(s"update ${mset}, ${mway} ${scoreboard.get((mset, mway)).get} ==> ${mwdata}")
    //                 }
    //                 else
    //                     scoreboard += ((mset, mway) -> mwdata)
    //             }else {
    //                 if(!scoreboard.contains((mset, mway)))
    //                     scoreboard += ((mset, mway) -> 0)
    //             }
    //         }

    //         println("all test case:")
    //         scoreboard.foreach(println)
    //         println()

    //         c.io.w.en.poke(0.U)
    //         for(i <- 0 until testCaseNum){
    //             val mset = set(i)
    //             val mway = way(i)
    //             val men = en(i)
    //             val expect = scoreboard.get((mset, mway)).get
    //             print(s"(${mset}, ${mway}), ${expect} en: ${men}")
    //             if(men == 1) {
    //                 print(s" expect: ${expect} ")
    //                 val rdata = read(mset,mway,"b010".U)
    //                 if(rdata.litValue != expect){
    //                     assert(false, s"error expect: ${expect} but get: ${c.io.r.data.peek().litValue} in (${mset}, ${mway})\n")
    //                 }
    //                 println(s"\tok (${mset},${mway}) => ${expect}")
    //             }else {
    //                 println()
    //             }
    //         }
    //     }
    // }

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            enableDebug = false
        )
    })
    it should "test DCache" in {
        test(new DCache()(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
            def read(addr: Int, memType: UInt): Unit = {
                c.io.read.req.valid.poke(1)
                c.io.read.req.bits.addr.poke(addr)
                c.io.read.req.bits.memType.poke(memType)
            }
            read(8, "b010".U)
            c.clock.step()
            c.io.read.req.valid.poke(0)
            c.io.missReq.valid.expect(true.B)
            c.io.missReq.bits.addr.expect(8)
            c.clock.step()
            c.io.refillResp.valid.poke(1)
            c.io.refillResp.bits.data.poke(123)
            c.clock.step()
            c.io.refillResp.valid.poke(0)
            c.clock.step()
            read(8, "b010".U)
            c.clock.step()
        }
    }

}
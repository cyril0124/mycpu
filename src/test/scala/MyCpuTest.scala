package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random.nextInt
import scala.math

import scala.io.{BufferedSource, Source}

class MyCpuTest extends AnyFlatSpec with ChiselScalatestTester {

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    behavior of "MyCpu"

    it should "test all " in {
        test(new MyCpu()(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
            // read from the configuration file
            val testCaseSource: BufferedSource = Source.fromFile("/home/cyril/workspace/riscv/mycpu/test/rv32i/cfg.txt")
            val testCaseSourceList = testCaseSource.getLines().toList
            val testCaseDir = testCaseSourceList(0).toString
            val testCase = testCaseSourceList(1).toString
            println("test case is "+testCase)

            // parse program
            val source: BufferedSource = Source.fromFile(testCaseDir + "/" + testCase)
            val lines = source.getLines()
            val list = lines.toList
            val simList = list.map{s => "[;,\\s]\\s*".r.split(s)}.filter{s => s.mkString.length > 5}.filter{s => !s.mkString.contains("--")}
            val simListLen = simList.length
            val pcOffset = 0x1000
            var idx:Int = 0

            def hexToInt(s: String): Int = {
                s.toList.map("0123456789abcdef".indexOf(_)).reduceLeft(_ * 16 + _)
            }
            
            c.io.start.poke(1.U)
            c.clock.setTimeout(0)
            var times = 0
            var done = false
            while(times < 1000 & done == false){
                if(c.io.envOut.valid.peek().litToBoolean == true){
                    done = true
                    println("ECALL!")
                }

                val inst = hexToInt(simList(idx+0)(1))
                val pc = hexToInt(simList(idx+1)(2)) - pcOffset
                val reg = (2 to 9).map{ i => 
                            List(hexToInt(simList(idx+i)(2)), hexToInt(simList(idx+i)(4)), hexToInt(simList(idx+i)(6)), hexToInt(simList(idx+i)(8)))
                        }.reduce(_++_)
                idx = idx + 10

                if(idx >= simListLen) {
                    done = true
                    println("run out of simList")
                }

                val mInst = c.io.cpuState.inst.peek().litValue.toInt
                val mPc = c.io.cpuState.pc.peek().litValue.toInt
                val mReg = (0 until 32).map{ i => 
                                c.io.cpuState.intRegState(i).peek().litValue.toInt
                            }
                
                // compare instruction
                if(mInst != inst) {
                    done = true
                    println(f"\bERROR at pc = ${mPc}%08x\tinst = x ${mInst}%08x  ==> V ${inst}%08x")
                    mReg.zipWithIndex.foreach {
                        case (r, i) => 
                        print(f"x${i} = ${mReg(i)}%08x ==> ${reg(i)}%08x  ")
                        if( (i+1)%4 == 0) println()
                    }
                    assert(false)
                }

                // compare registers
                val regCmpVec = mReg.zip(reg).map{case(a,b) => if(a == b) 0 else 1 }
                val regCmp = regCmpVec.reduce(_+_)
                if(regCmp != 0 && pc > 15) {
                    done = true
                    println(f"\nERROR at pc = ${mPc}%08x\tinst = m ${mInst}%08x  ==> ${inst}%08x")
                    mReg.zipWithIndex.foreach {
                        case (r, i) => 
                        print(f"x${i} = m ${mReg(i)}%08x ==> ${reg(i)}%08x ")
                        if(regCmpVec(i) == 1) print("<< ") else print(" ")
                        if( (i+1)%4 == 0) println()
                    }
                    assert(false)
                }

                c.clock.step()
                times = times + 1
            }
        }
    }
}



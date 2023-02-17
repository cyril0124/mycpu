package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random.nextInt
import scala.math

import scala.io.{BufferedSource, Source}
import ujson._
import scala.sys.process.Process


object MyUtils {
    def hexToInt(s: String): Int = {
        s.toList.map("0123456789abcdef".indexOf(_)).reduceLeft(_ * 16 + _)
    }
}

import MyUtils._

class MyCpuTest extends AnyFlatSpec with ChiselScalatestTester {

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    behavior of "MyCpu"

    it should "test all " in {
        test(new MyCpu()(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
            // read configuration file
            val cfg:String = Source.fromFile("/home/cyril/workspace/riscv/mycpu/test/test_case_cfg.json").mkString
            val cfgData = ujson.read(cfg)
            val testCaseNum = cfgData("test_case_num")
            val testCases = (0 until testCaseNum.num.toInt).map{ i => cfgData((i+1).toString) }
            
            // running test case
            for(testCase <- testCases){
                // get test case parameters
                val testCaseDir = testCase("dir").str
                val testCaseName = testCase("name").str
                val testCaseErrCode = testCase("err_code").num.toInt // TODO: compare error code
                println("test case is "+testCaseName)

                // parse reference program
                val source: BufferedSource = Source.fromFile(testCaseDir + "/" + testCaseName)
                val lines = source.getLines()
                val list = lines.toList
                val simList = list.map{s => "[;,\\s]\\s*".r.split(s)}.filter{s => s.mkString.length > 5}.filter{s => !s.mkString.contains("--")}
                val simListLen = simList.length
                val pcOffset = 0x1000
                var idx:Int = 0

                // read real program into instruction memory of mycpu
                println("load program "+ testCaseName + "......")
                val prjDir = "/home/cyril/workspace/riscv/mycpu"
                val scriptsDir = prjDir+"/scripts/disassemble_read"
                Process("python3 " +scriptsDir + "/main.py " +testCaseDir + "/"+ testCaseName.dropRight(4) +".o.lst "+scriptsDir+"/out").!
                val imemDir =  prjDir + "/src/main/resources"
                Process("mv " + imemDir + "/Imem.hex.txt " + imemDir + "/Imem.hex.txt.bak").!
                Process("cp " + scriptsDir + "/out " + imemDir + "/Imem.hex.txt").!
                
                def cpuReset(): Unit = {
                    c.io.start.poke(0.U)
                    c.reset.poke(true.B)
                    c.clock.step()
                    c.reset.poke(false.B)
                    c.clock.step()
                }

                def cpuInit(): Unit = {
                    c.clock.setTimeout(0)
                    cpuReset()
                    c.io.start.poke(1.U)
                    // c.clock.step()
                }

                // start test
                var times = 0
                var done = false
                val maxTimes = 10000
                idx = 0
                cpuInit()
                while(times <= maxTimes && done == false){

                    if(c.io.envOut.valid.peek().litToBoolean == true){
                        done = true
                        println("ECALL!")
                    }

                    // parse reference instruction execution result
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

                    // read real instruction execution result
                    val mInst = c.io.cpuState.inst.peek().litValue.toInt
                    val mPc = c.io.cpuState.pc.peek().litValue.toInt
                    val mReg = (0 until 32).map{ i => 
                                    c.io.cpuState.intRegState(i).peek().litValue.toInt
                                }
                    
                    // compare instruction
                    // print("hello\n")
                    if(mInst != inst && done == false) {
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
                    if(regCmp != 0 && done == false) {
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
                println("\n")
            }
            // TODO: report test case runtime info
        }
    }
}



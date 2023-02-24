package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec

import scala.io.{BufferedSource, Source}
import ujson._
import scala.sys.process.Process

import MyUtils._

class CoreTest extends AnyFlatSpec with ChiselScalatestTester {

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            enableDebug = false
        )
    })

    behavior of "Core"
    it should "test all " in {
        test(new Core()(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
            // c.io.in.start.poke(true.B)
            // c.clock.step(100)

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
                    c.io.in.start.poke(0.U)
                    c.reset.poke(true.B)
                    c.clock.step()
                    c.reset.poke(false.B)
                    c.clock.step()
                }

                def cpuInit(): Unit = {
                    c.clock.setTimeout(0)
                    cpuReset()
                    c.io.in.start.poke(1.U)
                    // c.clock.step()
                }

                // start test
                var times = 0
                var done = false
                val maxTimes = 10000
                idx = 0
                cpuInit()
                
                def instCommit(): Boolean = c.io.out.state.instState.commit.peek().litToBoolean

                while (!instCommit()) {
                    // println("hello")
                    c.clock.step()
                }

                while(times <= maxTimes && done == false){
                    if(instCommit == true){
                        // if(c.io.envOut.valid.peek().litToBoolean == true){
                        //     done = true
                        //     println("ECALL!")
                        // }

                        // parse reference instruction execution result
                        val inst = hexToInt(simList(idx+0)(1))
                        val pc = hexToInt(simList(idx+1)(2)) - pcOffset
                        val reg = (2 to 9).map{ i => 
                                    List(hexToInt(simList(idx+i)(2)), hexToInt(simList(idx+i)(4)), hexToInt(simList(idx+i)(6)), hexToInt(simList(idx+i)(8)))
                                }.reduce(_++_)
                        

                        if(idx >= simListLen) {
                            done = true
                            println("run out of simList")
                        }

                        // read real instruction execution result
                        val mInst = c.io.out.state.instState.peek().litValue.toInt
                        val mPc = c.io.out.state.instState.pc.peek().litValue.toInt
                        val mReg = (0 until 32).map{ i => 
                                        c.io.out.state.intRegState.regState(i).peek().litValue.toInt
                                    }
                        
                        // compare instruction
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
                        
                        times = times + 1
                        idx = idx + 10
                        c.clock.step()
                        
                        print(s"[${times}] inst commit and success\n")
                    }
                    else {
                        c.clock.step()
                    }
                }
                // one test case complete
                println("\n")
            }


        }
    }

}
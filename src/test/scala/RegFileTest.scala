package mycpu

import chisel3._
import chiseltest._
import  org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random.nextInt
import scala.math

// import chiseltest.experimental.TestOptionBuilder._
// import chiseltest.internal.WriteVcdAnnotation

object MyUtil {
    def shuffleArray(array:Array[Int]): Array[Int] = {
        for(idx <- array.indices) {
            val randomIdx = nextInt(array.length)
            val tempSwap = array(randomIdx)
            array(randomIdx) = array(idx)
            array(idx) = tempSwap
        }
        array
    }
}

object RegFileTest {

    def writeTest(dut:RegFile[UInt], scoreboard:Array[Int]):Unit = {
        val dwidth = dut.io.w.head.data.getWidth
        val wportNum = dut.io.w.length
        val set = scoreboard.length
        val wclocks = if(set % wportNum == 0) set / wportNum else set / wportNum + 1
        val wsetIdx = MyUtil.shuffleArray((0 until set).toArray)
        val wportAddrs = wsetIdx.toList.grouped(wportNum).toList

        for( wportAddr <- wportAddrs) {
            for( (wport, addr) <- dut.io.w.zip(wportAddr) ) {
                if(addr < set) {
                    val data = nextInt(math.pow(2, dwidth).toInt)
                    wport.addr.poke(addr.U)
                    wport.en.poke(true.B)
                    wport.data.poke(data.U)
                    scoreboard(addr) = data
                    dut.clock.step()
                    wport.en.poke(false.B)
                }
            }
        }
    }

    def readTest(dut:RegFile[UInt], scoreboard:Array[Int]):Unit = {
        val rportNum = dut.io.r.length
        
        for(score <- scoreboard.indices.toList.grouped(rportNum).toList) {
            // println(s"${score} ${score.length}\n")

            for( (s,rport) <- score.zip(dut.io.r.take(score.length))) {
                rport.addr.poke(s.U)
                rport.en.poke(true.B)
            }
            dut.clock.step()
            for( (s,rport) <- score.zip(dut.io.r.take(score.length))) {
                rport.addr.poke(0.U)
                rport.en.poke(false.B)
                rport.data.expect(scoreboard(s).U)
            }

        }

    }

    def checkBypass(dut:RegFile[UInt], scoreboard:Array[Int]):Unit = {
        val dwidth = dut.io.w.head.data.getWidth
        val rportIdx = Array[Int](dut.io.r.length)
        dut.io.r.indices.copyToArray(rportIdx)
        val wportIdx = Array[Int](dut.io.w.length)
        dut.io.w.indices.copyToArray(wportIdx)
        val setIdx = Array[Int](scoreboard.length)
        scoreboard.indices.copyToArray(setIdx)
        val setIdxShuffled = MyUtil.shuffleArray(setIdx)
        val bypassReadPorts = MyUtil.shuffleArray(rportIdx).toSeq.slice(0,2)
        val bypassWritePorts = MyUtil.shuffleArray(wportIdx).toSeq.head
        val bypassData = nextInt(math.pow(2, dwidth).toInt)
        val bypassAddr = nextInt(scoreboard.length)
        val regularReadPorts = rportIdx.slice(2,dut.io.r.length)
        val regularReadAddrs = setIdxShuffled.filter(_ != bypassAddr).slice(0, regularReadPorts.length)
        val regularReadPortsWithAddrs = (regularReadPorts zip regularReadAddrs).toMap
        for((w, idx) <- dut.io.w.zipWithIndex){
        val data = nextInt(math.pow(2, dwidth).toInt)
        w.data.poke(if(idx == bypassWritePorts) bypassData.U else data.U)
        w.addr.poke(if(idx == bypassWritePorts) bypassAddr.U else 0.U)
        w.en.poke(if(idx == bypassWritePorts) true.B else false.B)
        if(idx == bypassWritePorts){
            scoreboard(idx) = bypassData
        }
        }
        for((r, idx) <- dut.io.r.zipWithIndex){
        val addr = if(bypassReadPorts.contains(idx)) {
            bypassAddr.U
        } else if(regularReadPorts.contains(idx)){
            regularReadPortsWithAddrs(idx).U
        } else {
            0.U
        }
        r.addr.poke(addr)
        r.en.poke(true.B)
        }
        dut.clock.step()
        for((r, idx) <- dut.io.r.zipWithIndex){
        r.addr.poke(0.U)
        r.en.poke(false.B)
        if(bypassReadPorts.contains(idx)){
            r.data.expect(bypassData.U)
        } else if(regularReadPorts.contains(idx)) {
            r.data.expect(scoreboard(regularReadPortsWithAddrs(idx)).U)
        }
        }
    }

}

class RegFileTest extends AnyFlatSpec with ChiselScalatestTester{
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    behavior of "RegFile"
    val dataWidth = nextInt(64) + 1
    val readPort = nextInt(10) + 3
    val writePort = nextInt(4) + 1
    val set = nextInt(128) + 1

    it should "test all sets writing and reading" in {
        test(new RegFile(UInt(dataWidth.W))(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { m =>
            var scoreboard = new Array[Int](set)
            RegFileTest.writeTest(m, scoreboard)
            RegFileTest.readTest(m, scoreboard)
        }
    }

    it should "test write bypass behaviors" in {
        test(new RegFile(UInt(dataWidth.W))(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { m =>
            var scoreboard = new Array[Int](set)
            RegFileTest.writeTest(m, scoreboard)
            for(_ <- 0 until 32) RegFileTest.checkBypass(m, scoreboard)
        }
    }

}

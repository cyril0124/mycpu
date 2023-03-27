package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random.nextInt
import chisel3.util.log2Ceil

class FetchTest extends AnyFlatSpec with ChiselScalatestTester {

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    behavior of "Fetch"
    
    // class FetchIO_1()(implicit val p: Parameters) extends MyBundle{
    //     val in = new Bundle{
    //         val start = Input(Bool())
    //         val execute = Flipped(DecoupledIO(new Execute2Fetch))
    //     }
    //     val out = DecoupledIO(new FetchOut)
    //     val ctrl = Input(new PipelineCtrlBundle)
        
    //     // val rom = new TLMasterBusUL
    //     val tlbus = new TLMasterBusUL

    //     val trapVec = Input(UInt(xlen.W))
    //     val mepc = Input(UInt(xlen.W))
    //     val excp = Flipped(ValidIO(new ExceptionIO))
    // }

    it should "test Fetch stage" in {
        test(new Fetch_1()(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
            def init() = {
                c.io.in.start.poke(1)
                c.io.out.ready.poke(1)
                c.io.tlbus.req.ready.poke(1)
            }

            def ranData = nextInt(1000)

            def icacheRefillMiss(block: => Any = None) = {
                while(!c.io.tlbus.req.valid.peekBoolean()) {
                    c.clock.step()
                    block
                }
                val reqBeat = c.io.tlbus.req.bits.size.peekInt().toInt >> 2
                c.clock.step()
                for(i <- 0 until reqBeat) {
                    c.io.tlbus.resp.valid.poke(1)
                    c.io.tlbus.resp.bits.data.poke(ranData)
                    c.io.tlbus.resp.bits.opcode.poke(1) // AccessAckData
                    c.clock.step()
                }
                c.io.tlbus.resp.valid.poke(0)
            }

            def randReady() = {
                for(i <- 0 until nextInt(10)) {
                    c.io.out.ready.poke(0)
                    c.clock.step()
                }
                c.io.out.ready.poke(1)
                c.clock.step()
            }

            def waitTlbusReq() = {
                var times = 0
                while(!c.io.tlbus.req.valid.peekBoolean() && times < 100) {
                    c.clock.step()
                    times = times + 1
                }
                if(times >= 100) println("TIME OUT waitting tlbus req!")
                c.clock.step()
            }

            // var scoreboard: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map() // (pc, inst)

            init()
            icacheRefillMiss(println("hello"))
            
            randReady()
            
            for(i <- 0 until 4) {
                icacheRefillMiss()
                randReady()
                randReady()
                randReady()
                randReady()
            }

            c.io.in.execute.bits.brTaken.poke(1)
            c.io.in.execute.bits.targetAddr.poke(200)
            c.clock.step()
            val s = c.io.in.execute.bits.brTaken.poke(0)
            icacheRefillMiss(s)
            c.io.in.execute.bits.brTaken.poke(0)


            c.clock.step(100)
        }
    }
}

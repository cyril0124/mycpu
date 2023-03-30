package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

/*
    x
    x
    x => x x x x 
    x
*/
class TLSerializer[T <: Data](gen:T, nrIn: Int, latch: Boolean = false) extends Module {
    val io = IO(new Bundle{
        val in = Flipped(Decoupled(Vec(nrIn, gen)))
        val out = Decoupled(gen)
        val fireAll = Output(Bool())
        val beatCounter = Output(UInt(log2Ceil(nrIn).W))
    })

    val dataArray = if(latch) RegEnable(io.in.bits, io.in.fire) else io.in.bits
    val dataValid = if(latch) RegEnable(true.B, io.in.fire) else io.in.valid

    io.in.ready := true.B
    
    val beatCounter = Counter(nrIn)
    val lastBeat = beatCounter.value === (nrIn - 1).U
    val beatOH = UIntToOH(beatCounter.value)
    when(dataValid) {
        when(io.out.fire && lastBeat) {
            beatCounter.reset()
            if(latch) dataValid := false.B
        }.elsewhen(io.out.fire) {
            beatCounter.inc()
        }
    }

    io.out.valid := dataValid
    io.out.bits := Mux1H(beatOH, dataArray)

    io.fireAll := io.out.fire && lastBeat
    io.beatCounter := beatCounter.value
}

/*              x
    x x x x =>  x
                x
                x
*/
class TLDeSerializer[T <: Data](gen:T, nrOut: Int) extends Module {
    val io = IO(new Bundle{
        val in = Flipped(Decoupled(gen))
        val out = Decoupled(Vec(nrOut, gen))
        val latchAll = Output(Bool())
    })

    val notAccept = RegInit(false.B)
    when(io.latchAll && !io.out.fire){
        notAccept := true.B
    }.elsewhen(io.out.fire) {
        notAccept := false.B
    }

    io.in.ready := !notAccept
    
    val beatCounter = Counter(nrOut)
    val lastBeat = beatCounter.value === (nrOut - 1).U
    val beatOH = UIntToOH(beatCounter.value)
    when(io.in.fire && lastBeat) {
        beatCounter.reset()
    }.elsewhen(io.in.fire) {
        beatCounter.inc()
    }

    val outArray = RegInit(VecInit((0 until nrOut).map{ i => 0.U.asTypeOf(gen)}))
    when(io.in.fire) {
        outArray(beatCounter.value) := io.in.bits
    }

    val out = WireInit(VecInit((0 until nrOut).map{ i => if(i != nrOut - 1) outArray(i) else io.in.bits}))
    io.out.bits := Mux(!notAccept, out, outArray)
    io.out.valid := io.latchAll || notAccept

    io.latchAll := io.in.fire && lastBeat
}

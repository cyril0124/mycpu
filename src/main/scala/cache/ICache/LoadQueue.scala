package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import os.read



class LoadQueue[T <: Data](gen: T, entries: Int = 4, flow: Boolean = false)(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val enq = Flipped(Decoupled(gen))
        val inAddr = Input(UInt(xlen.W))
        val deq = Decoupled(gen)
        val outAddr = Output(UInt(xlen.W))
        val outConlict = Output(Bool())
        val refillInfo = new Bundle{
            val reqFire = Input(Bool())
            val reqAddr = Input(UInt(xlen.W))
            val respFire = Input(Bool())
        }
    })

    def addrConflict(a: UInt, b: UInt): Bool = {
        a(xlen-1, dcacheByteOffsetBits + dcacheBlockBits) === b(xlen-1, dcacheByteOffsetBits + dcacheBlockBits)
    }

    val data = Reg(Vec(entries, gen))
    val addr = RegInit(VecInit(Seq.fill(entries)(0.U(xlen.W))))
    val conflict = RegInit(VecInit(Seq.fill(entries)(false.B)))
    val ready = RegInit(VecInit(Seq.fill(entries)(true.B)))

    val inPtr = Counter(entries)
    val outPtr = Counter(entries)
    val enq = WireDefault(io.enq.fire)
    val deq = WireDefault(io.deq.fire)
    val maybeFull = RegInit(false.B)
    val ptrMatch = inPtr.value === outPtr.value
    val empty = ptrMatch && !maybeFull
    val full = ptrMatch && maybeFull

    when(enq) {
        inPtr.inc()
        data(inPtr.value) := io.enq.bits
        addr(inPtr.value) := io.inAddr
        conflict(inPtr.value) := false.B
        ready(inPtr.value) := true.B
    }

    when(deq) {
        outPtr.inc()
    }

    when(enq =/= deq) {
        maybeFull := enq
    }
    
    val cf = addrConflict(io.outAddr, io.refillInfo.reqAddr) && io.refillInfo.reqFire
    dontTouch(cf)
    io.deq.valid := !empty && ready(outPtr.value) && !(cf) // !(io.refillInfo.reqAddr === io.outAddr && io.refillInfo.reqFire)
    io.enq.ready := !full 

    io.deq.bits := data(outPtr.value)
    io.outAddr := addr(outPtr.value)
    io.outConlict := conflict(outPtr.value)
    dontTouch(io.outConlict)

    if (flow) {
        when(io.enq.valid) { 
            io.outAddr := io.inAddr
            io.deq.valid := !(cf)
            io.outConlict := cf
        }
        when(empty) {
            io.deq.bits := io.enq.bits
            io.outAddr := io.inAddr
            deq := false.B
            when(io.deq.ready) { enq := false.B }
        }
    }

    when(io.refillInfo.reqFire) {
        addr.zip(conflict).zip(ready).foreach{
            case ((a, c), r) =>
                c := addrConflict(a, io.refillInfo.reqAddr)
                r := ~addrConflict(a, io.refillInfo.reqAddr)
        }
    }

    when(io.refillInfo.respFire) {
        ready.foreach{
            r => r := Mux(r, true.B, true.B)
        }
    }

    

}

object LoadQueueGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    println("Generating the LoadQueue hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new LoadQueue(UInt(32.W))(defaultConfig), Array("--target-dir", "build"))
}


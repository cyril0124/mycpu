package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import dataclass.data


class DataBank[T <: Data](gen: T, nrSet: Int = 64, nrWay: Int = 4) extends Module {
    val io = IO(new Bundle{
        val w = new Bundle{
            val en = Input(Bool())
            val set = Input(UInt(log2Ceil(nrSet).W))
            val way = Input(UInt(nrWay.W))
            val data = Input(gen)
            val mask = Input(UInt((gen.getWidth / 8).W))
        }
        val r = new Bundle{
            val en = Input(Bool())
            val set = Input(UInt(log2Ceil(nrSet).W))
            val data = Output(Vec(nrWay, gen))
        }
    })

    val genWidth = gen.getWidth
    val maskSegments = genWidth / 8
    assert(genWidth % 8 == 0, s"gen width should be mod of 8! genWidth ==> ${genWidth}")
    
    val bankRam = Seq.fill(nrWay)(Module(new SRAMTemplate(genWidth, nrSet, maskSegments))) // sync read

    // write chosen way one hot code
    for( i <- 0 until nrWay){
        bankRam(i).io.w.en := io.w.way(i) & io.w.en
        bankRam(i).io.w.addr := io.w.set
        bankRam(i).io.w.data := io.w.data
        if(bankRam(i).io.w.mask.isDefined) bankRam(i).io.w.mask.get := io.w.mask        
    }
    
    val rdata = WireInit(0.U.asTypeOf(io.r.data))
    for( i <- 0 until nrWay){
        bankRam(i).io.r.en := io.r.en
        bankRam(i).io.r.addr := io.r.set
        io.r.data(i) := bankRam(i).io.r.data
    }
}

class DataBankArrayRead()(implicit val p: Parameters) extends MyBundle {
    val req = Flipped(Decoupled(new Bundle{
            val set = UInt(log2Ceil(dcacheSets).W)
            val blockSelOH = UInt(dcacheBlockSize.W)
        }))
    val resp = ValidIO(new Bundle{
        val data = Vec(dcacheWays, UInt(xlen.W))
        val blockData = Vec(dcacheBlockSize, UInt((xlen*dcacheWays).W))
    })
}

class DataBankArrayWrite()(implicit val p: Parameters) extends MyBundle {
    val req = Flipped(Decoupled(new Bundle{
            val data = UInt(xlen.W)
            val set = UInt(log2Ceil(dcacheSets).W)
            val blockSelOH = UInt(dcacheBlockSize.W)
            val way = UInt(dcacheWays.W)
            val mask = UInt(dcacheBlockBytes.W)
    }))
}

class DataBankArrayIO()(implicit val p: Parameters) extends MyBundle {
    val read = new DataBankArrayRead
    val write = new DataBankArrayWrite
}

class DataBankArray()(implicit val p: Parameters) extends MyModule {
    val io = IO(new DataBankArrayIO)
    io.read.req.ready := true.B
    io.write.req.ready := true.B

    val dataBanks = Seq.fill(dcacheBlockSize)(Module(new DataBank(UInt((dcacheBlockBytes * 8).W), dcacheSets, dcacheWays)))
    
    val rdBlockSelOH = io.read.req.bits.blockSelOH
    val wrBlockSelOH = io.write.req.bits.blockSelOH
    dontTouch(io.read.req)

    for(i <- 0 until dcacheBlockSize) {
        dataBanks(i).io.r.en := io.read.req.fire & rdBlockSelOH(i) // TODO: enble parallel access
        dataBanks(i).io.r.set := io.read.req.bits.set
        
        dataBanks(i).io.w.en := io.write.req.fire & wrBlockSelOH(i) // TODO: enble parallel access
        dataBanks(i).io.w.data := io.write.req.bits.data
        dataBanks(i).io.w.way := io.write.req.bits.way
        dataBanks(i).io.w.set := io.write.req.bits.set
        dataBanks(i).io.w.mask := io.write.req.bits.mask
    }

    val blockData = VecInit((0 until dcacheBlockSize).map{i => dataBanks(i).io.r.data})
    io.read.resp.bits.data :=  Mux1H(rdBlockSelOH, blockData)
    io.read.resp.bits.blockData := blockData.map(b => b.asUInt) // CacheLine Data, each CacheLine contains multiple data block, each block is 32-bit(4-byte)

    io.read.resp.valid := true.B

    def init(): Unit = {
        io.read.req <> DontCare
        io.write.req <> DontCare
    }

    def read(set: UInt, en: Bool): Vec[UInt] = {
        io.read.req.valid := en
        io.read.req.bits.set := set
        io.read.resp.bits.data
    }

    def write(set: UInt, way: UInt, mask: UInt, data: UInt, en: Bool): Unit = {
        io.write.req.valid := en
        io.write.req.bits.set := set
        io.write.req.bits.data := data
        io.write.req.bits.mask := mask
        io.write.req.bits.way := way
    }

}


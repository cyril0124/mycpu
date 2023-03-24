package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class DCacheMeta extends Bundle{
    val dirty = Bool()
    val valid = Bool()
}

class DirectoryReadBus()(implicit val p: Parameters) extends MyBundle {
    val req = Flipped(Decoupled(new Bundle{
        val addr = UInt(xlen.W)
    }))
    val resp = ValidIO(new Bundle{
        val hit = Bool()
        val chosenWay = UInt(dcacheWays.W)
        val isDirtyWay = Bool()
    })
}

class DirectoryWriteBus()(implicit val p: Parameters) extends MyBundle {
    val req = Flipped(Decoupled( new Bundle{
        val addr = UInt(xlen.W)
        val way = UInt(dcacheWays.W)
        // val meta = Vec(dcacheWays, UInt((new DCacheMeta).getWidth.W))
        val meta = UInt((new DCacheMeta).getWidth.W)
    }))
}

class DirectoryIO()(implicit val p: Parameters) extends MyBundle {
    val read = new DirectoryReadBus
    val write = new DirectoryWriteBus
}

class DCacheDirectory()(implicit val p: Parameters) extends MyModule {
    val io = IO(new DirectoryIO)

    val r = io.read
    val w = io.write
    
    // val rAddr = r.req.bits.addr
    val rAddr = Mux(r.req.fire, r.req.bits.addr, RegEnable(r.req.bits.addr, r.req.fire))
    val rSet = addrToDCacheSet(rAddr)
    val rTag = addrToDCacheTag(rAddr)

    // val wAddr = w.req.bits.addr
    val wAddr = Mux(w.req.fire, w.req.bits.addr, RegEnable(w.req.bits.addr, r.req.fire))
    val wSet = addrToDCacheSet(wAddr)
    val wTag = addrToDCacheTag(wAddr)
    val wWay = w.req.bits.way
    val wMeta = w.req.bits.meta

    assert(PopCount(wWay) < 2.U, cf"Error directory write way has multiple valid bit! ==>${PopCount(wWay)}")

    val tagArray = Module(new SRAMTemplate(dcacheTagBits * dcacheWays, dcacheSets, dcacheWays))
    val tagValidArray = Module(new SRAMTemplate(1 * dcacheWays, dcacheSets, dcacheWays))
    val metaArray = Module(new SRAMTemplate((new DCacheMeta).getWidth * dcacheWays, dcacheSets, dcacheWays)) 
    
    io.read.req.ready := true.B 
    io.write.req.ready := true.B 

    val tagRdVec = Wire(Vec(dcacheWays, UInt(dcacheTagBits.W)))
    tagArray.io.r.en := io.read.req.fire
    tagArray.io.r.addr := rSet
    tagRdVec := tagArray.io.r.data.asTypeOf(Vec(dcacheWays, UInt(dcacheTagBits.W)))

    val tagValidRdVec = Wire(Vec(dcacheWays, Bool()))
    tagValidArray.io.r.en := io.read.req.fire
    tagValidArray.io.r.addr := rSet
    tagValidRdVec := tagValidArray.io.r.data.asTypeOf(Vec(dcacheWays, Bool()))
        

    val metaRdVec = Wire(Vec(dcacheWays, new DCacheMeta))
    metaArray.io.r.en := io.read.req.fire
    metaArray.io.r.addr := rSet
    metaRdVec := metaArray.io.r.data.asTypeOf(Vec(dcacheWays, new DCacheMeta))

    // hit or miss
    val tagValidVec = tagValidRdVec.map( t => t === 1.U)
    val tagMatchVec = tagRdVec.zip(tagValidVec).map{ case(t, v) => t === rTag && v }
    val metaValidVec = metaRdVec.map( m => m.valid )
    val metaDirtyVec = metaRdVec.map( m => m.dirty ) 
    val matchWayOH = Cat(tagMatchVec.zip(metaValidVec).map{ case(t, m) => t && m }.reverse) // reverse is necessary when Cat an OneHot code
    val invalidWayVec = metaRdVec.map( m => m.valid === false.B )
    val invalidWayOH = PriorityMux(invalidWayVec.zipWithIndex.map(x => x._1 -> UIntToOH(x._2.U, dcacheWays)) )
    val hasInvalidWay = Cat(invalidWayVec).orR
    val replaceWay = ReplacePolicy("random", nrWay = dcacheWays) // "b0100".U // TODO： replace policy... PLRU
    val replaceWayReg = RegEnable(replaceWay, io.read.req.valid === false.B)

    val isHit = Cat(matchWayOH).orR //&& io.read.req.fire 
    // val choseWayOH = Mux(isHit, matchWayOH, Mux(hasInvalidWay, invalidWayOH, replaceWay))
    val choseWayOH = Mux(isHit, matchWayOH, Mux(hasInvalidWay, invalidWayOH, replaceWayReg))
    val isDirtyWay = ( choseWayOH & Cat(metaDirtyVec.reverse) & Cat(metaValidVec.reverse) ).orR //&& io.read.req.fire // the chosen way is a dirty and valid way

    assert(PopCount(choseWayOH) === 1.U, "Error chosenWay has multiple valid bit!")

    // directory read result
    io.read.resp.valid := true.B
    io.read.resp.bits.isDirtyWay := isDirtyWay
    io.read.resp.bits.chosenWay := choseWayOH
    io.read.resp.bits.hit := isHit
    
    // directory write operation
    tagArray.io.w.en := io.write.req.fire
    tagArray.io.w.addr := wSet
    tagArray.io.w.mask.get := wWay
    tagArray.io.w.data := Fill(dcacheWays, wTag)//wTag

    tagValidArray.io.w.en := io.write.req.fire
    tagValidArray.io.w.addr := wSet
    tagValidArray.io.w.mask.get := wWay
    tagValidArray.io.w.data := Fill(dcacheWays, true.B) // true.B //io.write.req.fire
    
    metaArray.io.w.en := io.write.req.fire
    metaArray.io.w.addr := wSet
    metaArray.io.w.mask.get := wWay
    metaArray.io.w.data := Fill(dcacheWays, wMeta.asUInt)// wMeta.asUInt

}

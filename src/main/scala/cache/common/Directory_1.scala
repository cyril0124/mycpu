package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._


class DCacheDirectory_1()(implicit val p: Parameters) extends MyModule {
    val io = IO(new DirectoryIO)

    val r = io.read
    val w = io.write
    
    // val rAddr = Mux(r.req.fire, r.req.bits.addr, RegEnable(r.req.bits.addr, r.req.fire))
    val rAddr = r.req.bits.addr
    val rSet  = addrToDCacheSet(rAddr)
    val rTag  = addrToDCacheTag(rAddr)
    val ren   = r.req.fire

    // val wAddr = Mux(w.req.fire, w.req.bits.addr, RegEnable(w.req.bits.addr, r.req.fire))
    val wAddr = w.req.bits.addr
    val wSet  = addrToDCacheSet(wAddr)
    val wTag  = addrToDCacheTag(wAddr)
    val wWay  = w.req.bits.way
    val wMeta = w.req.bits.meta
    val wen   = w.req.fire

    dontTouch(rSet)
    dontTouch(rTag)
    dontTouch(wSet)
    dontTouch(wTag)
    dontTouch(wWay)

    assert(PopCount(wWay) < 2.U, cf"Error directory write way has multiple valid bit! ==>${PopCount(wWay)}")

    // TODO: using single port policy
    val tagArray           = SRAM_1(dcacheTagBits, dcacheSets, dcacheWays, bramPolicy = "write_first",singlePort = false, resetMem = simulation)
    // val tagValidArray      = SRAM_1(1, dcacheSets, dcacheWays, bramPolicy = "write_first", singlePort = false, resetMem = simulation)
    val metaArray          = SRAM_1((new DCacheMeta).getWidth, dcacheSets, dcacheWays, bramPolicy = "write_first", singlePort = false, resetMem = simulation)
    
    io.read.req.ready       := true.B 
    io.write.req.ready      := true.B 

    val tagRdVec           = Wire(Vec(dcacheWays, UInt(dcacheTagBits.W)))
    tagRdVec := tagArray.read(rSet, ren)
    // tagRdVec := tagArray.read(rSet)

    // val tagValidRdVec        = Wire(Vec(dcacheWays, Bool()))
    // tagValidRdVec := tagValidArray.read(rSet, io.read.req.fire)
    // tagValidRdVec := tagValidArray.read(rSet).asTypeOf(chiselTypeOf(tagValidRdVec))

    val metaRdVec            = Wire(Vec(dcacheWays, new DCacheMeta))
    metaRdVec := metaArray.read(rSet, ren).asTypeOf(chiselTypeOf(metaRdVec))
    // metaRdVec := metaArray.read(rSet).asTypeOf(chiselTypeOf(metaRdVec))



    // val tagValidVec   = tagValidRdVec.map( t => t === 1.U)
    // val tagMatchVec   = tagRdVec.zip(tagValidVec).map{ case(t, v) => t === rTag && v }
    val tagMatchVec   = tagRdVec.map{ t => t === rTag }
    val metaValidVec  = metaRdVec.map( m => m.valid )
    val metaDirtyVec  = metaRdVec.map( m => m.dirty ) 
    val matchWayOH    = Cat(tagMatchVec.zip(metaValidVec).map{ case(t, m) => t && m }.reverse) // reverse is necessary when Cat an OneHot code
    val invalidWayVec = metaRdVec.map( m => m.valid === false.B )
    val invalidWayOH  = PriorityMux(invalidWayVec.zipWithIndex.map(x => x._1 -> UIntToOH(x._2.U, dcacheWays)) )
    val hasInvalidWay = Cat(invalidWayVec).orR
    val replaceWay    = ReplacePolicy("random", nrWay = dcacheWays) // TODO： replace policy... PLRU
    val replaceWayReg = RegEnable(replaceWay, io.read.req.valid === false.B)

    val isHit         = Cat(matchWayOH).orR 
    val choseWayOH    = Mux(isHit, matchWayOH, Mux(hasInvalidWay, invalidWayOH, replaceWayReg))
    val dirtyWayOH    = Cat(metaDirtyVec.reverse) & Cat(metaValidVec.reverse) & choseWayOH
    val isDirtyWay    = ( choseWayOH & dirtyWayOH ).orR  // the chosen way is a dirty and valid way
    val dirtyTag      = Mux1H(dirtyWayOH, tagRdVec)

    assert(PopCount(choseWayOH) === 1.U, "Error chosenWay has multiple valid bit!")
    assert(PopCount(dirtyWayOH) <= 1.U, "Error dirtyWay has multiple valid bit!")

    // directory read result
    io.read.resp.valid           := RegNext(io.read.req.fire)
    // io.read.resp.bits.isDirtyWay := Mux(io.read.req.fire, isDirtyWay, RegEnable(isDirtyWay, RegNext(io.read.req.fire))) 
    // io.read.resp.bits.chosenWay  := Mux(io.read.req.fire, choseWayOH, RegEnable(choseWayOH, RegNext(io.read.req.fire)))
    // io.read.resp.bits.hit        := Mux(io.read.req.fire, isHit,      RegEnable(isHit,      RegNext(io.read.req.fire)))
    // io.read.resp.bits.dirtyTag   := Mux(io.read.req.fire, dirtyTag,   RegEnable(dirtyTag,   RegNext(io.read.req.fire)))
    
    io.read.resp.bits.isDirtyWay := isDirtyWay 
    io.read.resp.bits.chosenWay  := choseWayOH
    io.read.resp.bits.hit        := isHit
    io.read.resp.bits.dirtyTag   := dirtyTag

    when(wen) {
        tagArray.write(wSet, wTag, wWay)
        // tagValidArray.write(wSet, 1.U, wWay)
        metaArray.write(wSet, wMeta.asUInt, wWay)
    }


}


object DCacheDirectoryGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false,
            // dcacheSets = 64,
            // dcacheWays = 4,
            // dcacheBlockSize = 4
        )
    })

    println("Generating the DCacheDirectory hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new DCacheDirectory_1()(defaultConfig), Array("--target-dir", "build"))
}
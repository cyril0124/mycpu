// package mycpu

// import chisel3._
// import chisel3.util._
// import org.chipsalliance.cde.config._

// import mycpu.common._
// import mycpu.util._

// class DataBankArrayRead_1()(implicit val p: Parameters) extends MyBundle {
//     val set = UInt(log2Ceil(dcacheSets).W)
// }

// class DataBankArrayWrite_1()(implicit val p: Parameters) extends MyBundle {
//     val req = Flipped(Decoupled(new Bundle{
//         val data = UInt((dcacheBlockBytes*8).W)
//         val set = UInt(log2Ceil(dcacheSets).W)
//         val blockSelOH = UInt(dcacheBlockSize.W)
//         val way = UInt(dcacheWays.W)
//     }))
// }

// class DataBankArrayIO_1()(implicit val p: Parameters) extends MyBundle {
//     val read = Vec(dcacheBlockSize, Flipped(Decoupled(new DataBankArrayRead_1)))
//     val resp = Vec(dcacheBlockSize, UInt((dcacheBlockBytes*8).W))
//     val write = new DataBankArrayWrite_1
// }

// class DataBankArray_1()(implicit val p: Parameters) extends MyModule {
//     val io = IO(new DataBankArrayIO_1)

//     val array = Seq.fill(dcacheWays)(Module(new SRAMTemplate(dcacheBlockBytes*8*dcacheWays, dcacheSets, maskSegments = dcacheWays, singlePort = true)))

    


// }
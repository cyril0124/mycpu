package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec

class BusTest extends AnyFlatSpec with ChiselScalatestTester {

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false,
            nrBusMaster = 3
        )
    })

    implicit val p = defaultConfig

    behavior of "Bus"

    it should "test TLBusMux" in {
        test(new TLBusMux(new BusMasterBundle, 3)(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
            def slaveChose(sel: Seq[Int]): Unit = {
                sel.zipWithIndex.foreach{ case(s, i) =>
                    c.io.choseOH(i).poke(s)
                }
            }

            c.io.in(0).bits.data.poke(100)
            c.io.in(1).bits.data.poke(200)
            c.io.in(2).bits.data.poke(300)
            c.io.out.ready.poke(1)
            
            slaveChose(Seq(0, 0, 1))
            c.io.out.bits.data.expect(300)
            c.io.in(2).ready.expect(1)

            slaveChose(Seq(0, 1, 0))
            c.io.out.bits.data.expect(200)
            c.io.in(1).ready.expect(1)

            c.io.out.ready.poke(0)
            slaveChose(Seq(1, 0, 0))
            c.io.out.bits.data.expect(100)
            c.io.in(0).ready.expect(0)

            // slaveChose(Seq(1, 1, 0))
            println("PASS")
        }
    }

    it should "test TLBusArbiter" in {
        test(new TLBusArbiter(2)(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 

            c.io.reqs(0).poke(1)
            c.io.reqs(1).poke(1)

            c.clock.step()

            c.io.grantOH.expect("b10".U)
            
            c.io.reqs(0).poke(1)
            c.io.reqs(1).poke(0)
            c.clock.step()

            c.io.grantOH.expect("b01".U)

            println("PASS")
        }
    }


    it should "test TLAddrDecode" in {
        test(new TLAddrDecode(2)(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 

            c.io.addr.poke(0x00000000)
            c.io.choseOH(0).expect(1)
            c.io.choseOH(1).expect(0)
            c.io.addr.poke(0x00003000)
            c.io.choseOH(0).expect(0)
            c.io.choseOH(1).expect(1)

            println("PASS")
        }
    }

    val defaultConfig2 = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false,
            nrBusMaster = 2
        )
    })

    it should "test TLXbar" in { 
        test(new TLXbar()(defaultConfig2)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
            val mf = c.io.masterFace
            val sf = c.io.slaveFace

            // mf.in(0).valid.poke(1)
            sf.in.foreach(i => i.ready.poke(1))
            c.clock.step(2)

            

            def mfIssue(mfid: Int, valid: UInt, data: UInt, addr: UInt, typ: UInt): Unit = {
                mf.in(mfid).valid.poke(valid)
                mf.in(mfid).bits.data.poke(data)
                mf.in(mfid).bits.address.poke(addr)
                mf.in(mfid).bits.opcode.poke(typ)
                mf.in(mfid).bits.source.poke(mfid.U)
            }

            def sfIssue(sfid: Int, valid: UInt, data: UInt): Unit = {
                sf.out(sfid).valid.poke(valid)
                sf.out(sfid).bits.data.poke(data)
                sf.out(sfid).bits.source.poke(sfid.U)
            }

            mfIssue(0, true.B, 123.U, "h0000_0444".U, 0.U) // slave 0
            mfIssue(1, true.B, 223.U, "h0000_2500".U, 0.U) // slave 1
            c.clock.step(1)
            // mfIssue(0, false.B, 123.U, "h0000_0444".U, 0.U) // slave 0
            // mfIssue(1, false.B, 223.U, "h0000_2500".U, 0.U) // slave 1
            c.clock.step(1)

            // c.clock.step(5)
            sf.in(1).bits.data.expect(223.U)
            sf.in(1).bits.address.expect("h0000_2500".U)
            sf.in(1).valid.expect(true.B)
            sf.in(0).valid.expect(false.B)

            mfIssue(0, true.B, 123.U, "h0000_0444".U, 0.U) // slave 0
            mfIssue(1, false.B, 223.U, "h0000_2500".U, 0.U) // slave 1
            c.clock.step(2)
            sf.in(0).bits.data.expect(123.U)
            sf.in(0).bits.address.expect("h0000_0444".U)
            sf.in(0).valid.expect(true.B)
            sf.in(1).valid.expect(false.B)


            c.clock.step(10)
            println("PASS")
        }
    }

    // it should "test BusXbar_1" in {
    //     test(new BusXbar_1()(defaultConfig2)).withAnnotations(Seq(WriteVcdAnnotation)) { c => 
    //         val mf = c.io.masterFace
    //         val sf = c.io.slaveFace

    //         c.clock.step(2)

    //         sf.in.foreach(i => i.ready.poke(1))

    //         def mfIssue(mfid: Int, valid: UInt, data: UInt, addr: UInt, typ: UInt): Unit = {
    //             mf.in(mfid).valid.poke(valid)
    //             mf.in(mfid).bits.data.poke(data)
    //             mf.in(mfid).bits.address.poke(addr)
    //             mf.in(mfid).bits.opcode.poke(typ)
    //             mf.in(mfid).bits.source.poke(mfid.U)
    //         }

    //         def sfIssue(sfid: Int, valid: UInt, data: UInt): Unit = {
    //             sf.out(sfid).valid.poke(valid)
    //             sf.out(sfid).bits.data.poke(data)
    //             sf.out(sfid).bits.source.poke(sfid.U)
    //         }

    //         mfIssue(0, true.B, 123.U, "h0000_0444".U, 0.U) // slave 0
    //         mfIssue(1, true.B, 223.U, "h0000_2500".U, 0.U) // slave 1
    //         c.clock.step(2)

    //         sf.in(1).bits.data.expect(223.U)
    //         sf.in(1).bits.address.expect("h0000_2500".U)
    //         sf.in(1).bits.opcode.expect(0.U)
    //         sf.in(1).valid.expect(true.B)
    //         sf.cs(0).expect(0)
    //         sf.cs(1).expect(1)


    //         mfIssue(0, true.B, 123.U, "h0000_0000".U, 0.U) // slave 0
    //         mfIssue(1, false.B, 223.U, "h0000_2500".U, 0.U) // slave 1
    //         sf.in(1).ready.poke(0)
    //         c.clock.step(2)

    //         sf.in(0).bits.data.expect(123.U)
    //         sf.in(0).bits.address.expect("h0000_0000".U)
    //         sf.in(0).valid.expect(true.B)
    //         sf.in(1).bits.data.expect(123.U)
    //         sf.in(1).bits.address.expect("h0000_0000".U)
    //         sf.in(1).valid.expect(true.B)
    //         sf.cs(0).expect(1)
    //         sf.cs(1).expect(0)


    //         println("PASS")
    //     }
    // }

//     it should "test BusCrossBar " in {
//         test(new BusCrossBar()(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
//             val mf = c.io.masterFace
//             val sf = c.io.slaveFace

//             def mfIssue(mfid: Int, valid: UInt, data: UInt, addr: UInt, typ: UInt): Unit = {
//                 mf.in(mfid).valid.poke(valid)
//                 mf.in(mfid).bits.data.poke(data)
//                 mf.in(mfid).bits.address.poke(addr)
//                 mf.in(mfid).bits.opcode.poke(typ)
//                 mf.in(mfid).bits.source.poke(mfid.U)
//             }

//             def sfIssue(sfid: Int, valid: UInt, data: UInt): Unit = {
//                 sf.out(sfid).valid.poke(valid)
//                 sf.out(sfid).bits.data.poke(data)
//                 sf.out(sfid).bits.source.poke(sfid.U)
//             }

//             mfIssue(0, true.B, 123.U, "h0000_0000".U, 0.U) // slave 0
//             mfIssue(1, true.B, 223.U, "h0000_1500".U, 0.U) // slave 1
//             c.clock.step(4)

//             sf.in(0).bits.data.expect(123.U)
//             sf.in(0).bits.address.expect("h0000_0000".U)
//             sf.in(0).bits.opcode.expect(0.U)
//             sf.in(0).valid.expect(true.B)

//             sf.in(1).bits.data.expect(223.U)
//             sf.in(1).bits.address.expect("h0000_1500".U)
//             sf.in(1).bits.opcode.expect(0.U)
//             sf.in(1).valid.expect(true.B)

//             mfIssue(0, true.B, 39.U, "h0000_1300".U, 0.U) // slave 0
//             mfIssue(1, true.B, 113.U, "h0000_0900".U, 0.U) // slave 1
//             c.clock.step(4)

//             sf.in(0).bits.data.expect(113.U)
//             sf.in(0).bits.address.expect("h0000_0900".U)
//             sf.in(0).bits.opcode.expect(0.U)
//             sf.in(0).valid.expect(true.B)

//             sf.in(1).bits.data.expect(39.U)
//             sf.in(1).bits.address.expect("h0000_1300".U)
//             sf.in(1).bits.opcode.expect(0.U)
//             sf.in(1).valid.expect(true.B)

//             mfIssue(0, false.B, 39.U, "h0000_1300".U, 0.U) // slave 0
//             mfIssue(1, true.B, 113.U, "h0000_0900".U, 0.U) // slave 1
//             c.clock.step(4)

//             sf.in(0).bits.data.expect(113.U)
//             sf.in(0).bits.address.expect("h0000_0900".U)
//             sf.in(0).bits.opcode.expect(0.U)
//             sf.in(0).valid.expect(true.B)

//             sf.in(1).valid.expect(false.B)
// // ----------------------------------------------------------------------------------------
//             sfIssue(0, true.B, 123.U) // master 0
//             sfIssue(1, true.B, 223.U) // master 1
//             c.clock.step(4)

//             mf.out(0).bits.data.expect(123.U)
//             mf.out(0).valid.expect(true.B)

//             mf.out(1).bits.data.expect(223.U)
//             mf.out(1).valid.expect(true.B)

//             sfIssue(0, true.B, 39.U) // master 0
//             sfIssue(1, true.B, 113.U) // master 1
//             c.clock.step(4)

//             mf.out(0).bits.data.expect(39.U)
//             mf.out(0).valid.expect(true.B)

//             mf.out(1).bits.data.expect(113.U)
//             mf.out(1).valid.expect(true.B)

//             sfIssue(0, false.B, 39.U) // master 0
//             sfIssue(1, true.B, 113.U) // master 1
//             c.clock.step(4)

//             mf.out(0).valid.expect(false.B)

//             mf.out(1).bits.data.expect(113.U)
//             mf.out(1).valid.expect(true.B)

//         }
//     }

}
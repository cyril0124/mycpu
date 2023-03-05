package mycpu

import chisel3._
import chiseltest._
import org.chipsalliance.cde.config._
import mycpu.common._

import org.scalatest.flatspec.AnyFlatSpec


class BusXbarTest extends AnyFlatSpec with ChiselScalatestTester {

    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            enableDebug = false,
            nrBusMaster = 3
        )
    })

    behavior of "BusXbar"

    it should "test BusCrossBar " in {
        test(new BusCrossBar()(defaultConfig)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
            val mf = c.io.masterFace
            val sf = c.io.slaveFace

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

            mfIssue(0, true.B, 123.U, "h0000_0000".U, 0.U) // slave 0
            mfIssue(1, true.B, 223.U, "h0000_1500".U, 0.U) // slave 1
            c.clock.step(4)

            sf.in(0).bits.data.expect(123.U)
            sf.in(0).bits.address.expect("h0000_0000".U)
            sf.in(0).bits.opcode.expect(0.U)
            sf.in(0).valid.expect(true.B)

            sf.in(1).bits.data.expect(223.U)
            sf.in(1).bits.address.expect("h0000_1500".U)
            sf.in(1).bits.opcode.expect(0.U)
            sf.in(1).valid.expect(true.B)

            mfIssue(0, true.B, 39.U, "h0000_1300".U, 0.U) // slave 0
            mfIssue(1, true.B, 113.U, "h0000_0900".U, 0.U) // slave 1
            c.clock.step(4)

            sf.in(0).bits.data.expect(113.U)
            sf.in(0).bits.address.expect("h0000_0900".U)
            sf.in(0).bits.opcode.expect(0.U)
            sf.in(0).valid.expect(true.B)

            sf.in(1).bits.data.expect(39.U)
            sf.in(1).bits.address.expect("h0000_1300".U)
            sf.in(1).bits.opcode.expect(0.U)
            sf.in(1).valid.expect(true.B)

            mfIssue(0, false.B, 39.U, "h0000_1300".U, 0.U) // slave 0
            mfIssue(1, true.B, 113.U, "h0000_0900".U, 0.U) // slave 1
            c.clock.step(4)

            sf.in(0).bits.data.expect(113.U)
            sf.in(0).bits.address.expect("h0000_0900".U)
            sf.in(0).bits.opcode.expect(0.U)
            sf.in(0).valid.expect(true.B)

            sf.in(1).valid.expect(false.B)
// ----------------------------------------------------------------------------------------
            sfIssue(0, true.B, 123.U) // master 0
            sfIssue(1, true.B, 223.U) // master 1
            c.clock.step(4)

            mf.out(0).bits.data.expect(123.U)
            mf.out(0).valid.expect(true.B)

            mf.out(1).bits.data.expect(223.U)
            mf.out(1).valid.expect(true.B)

            sfIssue(0, true.B, 39.U) // master 0
            sfIssue(1, true.B, 113.U) // master 1
            c.clock.step(4)

            mf.out(0).bits.data.expect(39.U)
            mf.out(0).valid.expect(true.B)

            mf.out(1).bits.data.expect(113.U)
            mf.out(1).valid.expect(true.B)

            sfIssue(0, false.B, 39.U) // master 0
            sfIssue(1, true.B, 113.U) // master 1
            c.clock.step(4)

            mf.out(0).valid.expect(false.B)

            mf.out(1).bits.data.expect(113.U)
            mf.out(1).valid.expect(true.B)

        }
    }
}
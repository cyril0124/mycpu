package mycpu.csr

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import chisel3.util.experimental.BoringUtils

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.CSR._
import mycpu.common.consts.Control._
import mycpu.common.consts.CsrOp._
import mycpu.common.consts.ExceptCause._
import mycpu.CsrFileState

// https://github.com/MaxXSoft/Fuxi

class CsrRead()(implicit val p: Parameters) extends MyBundle{
    val op = Output(UInt(CSR_OP_WIDTH.W))
    val valid = Input(Bool())
    /*
    *   CSR Address Field Description:
    *   [11:10]               [9:8]               [7:0]
    *   |"b11": read only     |"b00": U-mode      | address index...
    *   |other: read & write  |"b01": S-mode
    *                         |"b10": HS/VS-mode
    *                         |"b11": M-mode
    */
    val addr  = Output(UInt(CSR_ADDR_WIDTH.W))
    val data  = Input(UInt(xlen.W))
}

class CsrWrite()(implicit val p: Parameters) extends MyBundle{
    val op      = Input(UInt(CSR_OP_WIDTH.W))
    val addr    = Input(UInt(CSR_ADDR_WIDTH.W))
    val data    = Input(UInt(xlen.W))
    // instruction retired flag
    val retired = Input(Bool())
}

class ExceptionIO()(implicit val p: Parameters) extends MyBundle{
    val isMret    = Bool()
    val isSret    = Bool()
    val excCause  = UInt(EXC_CAUSE_WIDTH.W)
    val excPc     = UInt(xlen.W)
    val excValue  = UInt(xlen.W)
}

class CsrIO()(implicit val p: Parameters) extends MyBundle{
    val read    = Flipped(new CsrRead)
    val write   = new CsrWrite

    val except  = Flipped(ValidIO(new ExceptionIO))

    val mode    = Output(UInt(CSR_MODE_WIDTH.W))
    val busy    = Output(Bool())
    val mepc    = Output(UInt(xlen.W))
    val trapVec = Output(UInt(xlen.W))
}

class CsrFile[T <: Data]()(implicit val p: Parameters) extends MyModule {
    val io = IO(new CsrIO)
    
    // current privilege mode
    val mode      = RegInit(CSR_MODE_M)
    
    // definition of CSRs
    val mcause    = RegInit(McauseCsr.default)
    val mstatus   = RegInit(MstatusCsr.default)
    val mtvec     = RegInit(MtvecCsr.default) 
    val medeleg   = RegInit(MedelegCsr.default)
    val mideleg   = RegInit(MidelegCsr.default)
    val mepc      = RegInit(MepcCsr.default)
    val satp      = RegInit(SatpCsr.default)
    val mtval     = RegInit(MtvalCsr.default)
    val mcycle    = RegInit(McycleCsr.default)
    val cycle     = mcycle.asUInt

    // all supported CSRs
    val default  =
    //                                                   writable
    //                                       csrData readable|
    //                                          |         |  |
                                    List(0.U,             N, N)
    var csrTable = Array(
        BitPat(CSR_MHARTID)      -> List(0.U,            Y, N),
        BitPat(CSR_MCAUSE)       -> List(mcause.asUInt,  Y, Y),
        BitPat(CSR_MCAUSE)       -> List(mstatus.asUInt, Y, Y),
        BitPat(CSR_MTVEC)        -> List(mtvec.asUInt,   Y, Y),
        BitPat(CSR_MEDELEG)      -> List(medeleg.asUInt, Y, Y),
        BitPat(CSR_MIDELEG)      -> List(mideleg.asUInt, Y, Y),
        BitPat(CSR_MEPC)         -> List(mepc.asUInt,    Y, Y),
        BitPat(CSR_SATP)         -> List(satp.asUInt,    Y, Y),
        BitPat(CSR_MTVAL)        -> List(mtval.asUInt,   Y, Y),
        BitPat(CSR_MCYCLE)       -> List(cycle(31, 0),   Y, Y),
        BitPat(CSR_MCYCLEH)      -> List(cycle(63, 32),  Y, Y),

        BitPat(CSR_PMPCFG0)       ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPCFG1)       ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPCFG2)       ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPCFG3)       ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR0)      ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR1)      ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR2)      ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR3)      ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR4)      ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR5)      ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR6)      ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR7)      ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR8)      ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR9)      ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR10)     ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR11)     ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR12)     ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR13)     ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR14)     ->  List(0.U,             Y, Y),
        BitPat(CSR_PMPADDR15)     ->  List(0.U,             Y, Y),

    )

    val readData :: (readable: Bool) :: (writable: Bool) :: Nil = 
        ListLookup(io.read.addr, default, csrTable)

    /* step 1: check permission*/
    // whether this csr operation is legal, e.g. CSR with read-only permission cannot be writed. 
    val readValid = MuxLookup(io.read.op, false.B, Seq(
        CSR_R   -> readable,
        CSR_W   -> writable,
        CSR_RW  -> (readable && writable),
        CSR_RS  -> (readable && writable),
        CSR_RC  -> (readable && writable),
    ))
    // mode valid check
    val modeValid = io.read.addr(9, 8) <= mode
    io.read.valid := readValid && modeValid

    val csrData :: _ :: _ :: Nil = 
            ListLookup(io.write.addr, default, csrTable)
    val writeEn = io.write.op =/= CSR_NOP && io.write.op =/= CSR_R // NOP and Read operation will not write CSR
    val writeData = MuxLookup(io.write.op, 0.U, Seq(
        CSR_W   -> io.write.data,
        CSR_RW  -> io.write.data,
        CSR_RS  -> (csrData | io.write.data),
        CSR_RC  -> (csrData & ~io.write.data),
    ))

    mcycle.data := mcycle.data + 1.U

    when(writeEn) {
        switch(io.write.addr) {
            is(CSR_MCAUSE)  { mcause  <= writeData  }
            is(CSR_MSTATUS) { mstatus <= writeData  }
            is(CSR_MTVEC)   { mtvec   <= writeData  } 
            is(CSR_MEDELEG) { medeleg <= writeData  } 
            is(CSR_MIDELEG) { mideleg <= writeData  } 
            is(CSR_MEPC)    { mepc    <= writeData  }
            is(CSR_SATP)    { satp    <= writeData  }
            is(CSR_MCYCLE)  { mcycle.data := Cat(mcycle.data(63, 32), writeData) }
            is(CSR_MCYCLEH) { mcycle.data := Cat(writeData, mcycle.data(31, 0))  }
        }
    }.elsewhen(io.except.valid) {
        mcause       <= Cat(false.B, io.except.bits.excCause)
        mepc         <= io.except.bits.excPc
        mtval        <= io.except.bits.excValue
        mstatus.mpie := mstatus.mie
        mstatus.mie  := false.B
        mstatus.mpp  := mode
    }

    io.mode := mode
    io.busy := writeEn
    io.mepc := mepc.asUInt
    io.trapVec := mtvec.asUInt
    
    io.read.data := readData

    val csrState = Wire(new CsrFileState)
    csrState.mcycle := cycle(31,0)
    csrState.mcycleh := cycle(63, 32)
    BoringUtils.addSource(csrState,"csrState")

}
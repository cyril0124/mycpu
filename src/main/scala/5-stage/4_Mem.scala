package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.Control._
import mycpu.csr._
import mycpu.common.consts.ExceptCause._
import mycpu.common.consts.ExceptType._
import mycpu.common.consts.CSR._
import mycpu.common.consts.CsrOp
import mycpu.common.consts.LsuOp

class MemHazardBundle()(implicit val p: Parameters) extends MyBundle{
    val rd = UInt(5.W)
    val rdVal = UInt(xlen.W)
    val regWrEn = Bool()
}

class MemOut()(implicit val p: Parameters) extends MyBundle{
    val resultSrc    = UInt(2.W)
    val regWrEn      = Bool()
    val aluOut       = UInt(xlen.W)
    val pcNext4      = UInt(xlen.W)
    
    val csrOp        = UInt(CsrOp.CSR_OP_WIDTH.W)
    val csrWrEn      = Bool()
    val csrRdData    = UInt(xlen.W)
    val csrWrData    = UInt(xlen.W)
    val csrAddr      = UInt(CSR_ADDR_WIDTH.W)

    val instState    = new InstState
}

class MemIO()(implicit val p: Parameters) extends MyBundle{
    val in = Flipped(DecoupledIO(new ExecuteOut))
    val out = DecoupledIO(new MemOut)
    
    val ram = new TLMasterBusUL
    val lsuData = Output(UInt(xlen.W))
    val lsuOK = Output(Bool())

    val hazard = Output(new MemHazardBundle)
    val ctrl = Input(new PipelineCtrlBundle)
    val excp = ValidIO(new ExceptionIO)

    val csrBusy = Input(Bool())
    val csrMode = Input(UInt(CSR_MODE_WIDTH.W))
}

class Mem()(implicit val p: Parameters) extends MyModule{
    val io = IO(new MemIO)

    val hasTrap = WireInit(false.B)
    val ramReady = WireInit(false.B)
    val needRam = WireInit(false.B)
    dontTouch(ramReady)
    dontTouch(needRam)

    val lsuReady = WireInit(true.B)

    
    val stall = io.ctrl.stall || (!ramReady && needRam) || !lsuReady || !io.out.ready
    val flush = io.ctrl.flush

    io.in.ready := !stall
    val memoryLatch = io.in.fire
    val stageReg = RegInit(0.U.asTypeOf(io.in.bits))
    // when(memoryLatch) {
    //     stageReg := io.in.bits
    // }.elsewhen(!stall){
    //     stageReg := 0.U.asTypeOf(io.in.bits)
    // }
    when(memoryLatch) {
        stageReg := io.in.bits
    }.elsewhen(io.out.fire){
        stageReg := 0.U.asTypeOf(io.in.bits)
    }

    when(flush && !stall) { stageReg := 0.U.asTypeOf(io.in.bits) }

    needRam := stageReg.lsuOp =/= LsuOp.LSU_NOP && stageReg.lsuOp =/= LsuOp.LSU_FENC

    // exception handle
    val illgSret  = stageReg.excType === EXC_SRET && io.csrMode === CSR_MODE_U
    val illgMret  = stageReg.excType === EXC_MRET && io.csrMode =/= CSR_MODE_M
    val illgSpriv = stageReg.excType === EXC_SPRIV && io.csrMode === CSR_MODE_U
    val instAddr  = stageReg.excType === EXC_IADDR
    val instPage  = stageReg.excType === EXC_IPAGE
    val instIllg  = stageReg.excType === EXC_ILLEG ||
                    illgSret || illgMret || illgSpriv
    val excOther  = stageReg.excType === EXC_ECALL ||
                    stageReg.excType === EXC_EBRK ||
                    stageReg.excType === EXC_SRET ||
                    stageReg.excType === EXC_MRET
    hasTrap      := (instIllg || excOther) && stageReg.instState.inst =/= 0.U
                
    val cause = MuxLookup(stageReg.excType, 0.U, Seq(
        EXC_ECALL ->    Mux(io.csrMode === CSR_MODE_U, 
                            EXC_U_ECALL,
                            Mux(io.csrMode === CSR_MODE_S, 
                                EXC_S_ECALL, 
                                EXC_M_ECALL
                            )
                        ),
        EXC_EBRK  ->    EXC_BRK_POINT,
    ))
    io.excp.bits.excCause   := Mux(stageReg.csrWrEn & !stageReg.csrValid, 
                                    EXC_ILL_INST, 
                                    cause
                                )
    io.excp.valid           := !io.csrBusy && hasTrap && !stall 
    io.excp.bits.excPc      := stageReg.instState.pc
    io.excp.bits.excValue   := DontCare
    io.excp.bits.isMret     := stageReg.excType === EXC_MRET
    io.excp.bits.isSret     := stageReg.excType === EXC_SRET

    io.out.bits.csrOp       := stageReg.csrOp
    io.out.bits.csrWrEn     := stageReg.csrWrEn
    io.out.bits.csrRdData   := stageReg.csrRdData
    io.out.bits.csrWrData   := stageReg.csrWrData
    io.out.bits.csrAddr     := stageReg.csrAddr


    // data memory read
    // val dataMem = Module(new ROM())
    // val dataMemRdData = ReadMask(dataMem.io.rdata, stageReg.memSign, stageReg.memType, xlen)
    // dontTouch(dataMemRdData)
    // dataMem.io.raddr :=  stageReg.aluOut
    // dataMem.io.waddr := stageReg.aluOut
    // dataMem.io.wen := stageReg.memWrEn && !hasTrap
    // dataMem.io.wmask := "b1111".U
    // dataMem.io.wdata := WriteMask(stageReg.data2, stageReg.memType, xlen)

    val lsu = Module(new LSU())
    lsu.io <> DontCare
    lsuReady := lsu.io.req.ready
    lsu.io.req.valid        := io.in.valid
    lsu.io.req.bits.addr    := io.in.bits.aluOut
    lsu.io.req.bits.wdata   := io.in.bits.data2
    lsu.io.req.bits.hasTrap := hasTrap // ! NOT use 
    lsu.io.req.bits.lsuOp   := io.in.bits.lsuOp
    io.lsuOK                := lsu.io.resp.valid
    io.lsuData              := lsu.io.resp.bits.rdata

    io.ram <> lsu.io.ram
    ramReady := io.ram.req.ready

    io.out.bits.resultSrc   := stageReg.resultSrc
    io.out.bits.regWrEn     := stageReg.regWrEn
    io.out.bits.aluOut      := stageReg.aluOut
    io.out.bits.pcNext4     := stageReg.pcNext4
    io.out.bits.instState   <> stageReg.instState

    // hazard control
    val inst                 = stageReg.instState.inst
    io.hazard.rd            := InstField(inst, "rd")
    io.hazard.regWrEn       := stageReg.regWrEn
    io.hazard.rdVal         :=  stageReg.aluOut

    io.out.valid            := !stall
}

object MemoryGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the Memory hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Mem()(defaultConfig), Array("--target-dir", "build"))
}

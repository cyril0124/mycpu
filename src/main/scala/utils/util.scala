package mycpu.util

import chisel3._
import chisel3.util._
import mycpu.common._

object SignExt {
    def apply(data:SInt, width:Int):UInt = {
        val dataWidth = data.getWidth
        assert(dataWidth <= width,"input data width greater than expect width!")
        val signBit = data(dataWidth-1)
        if(dataWidth == width){
            data.asUInt
        } else {
            val out = Cat(Cat(Array.fill(width-dataWidth)(signBit)), data.asUInt)
            out
        }
    }
    def apply(data:UInt, width:Int):UInt = {
        apply(data.asSInt, width)
    }
}

object ZeroExt {
    def apply(data:UInt, width:Int):UInt = {
        val dataWidth = data.getWidth
        assert(dataWidth <= width,"input data width greater than expect width!")
        if(dataWidth == width){
            data
        } else {
            val out = 0.U(width.W) | data
            out 
        }
    }
}


object ParamRepoter{
    def apply(moduleName:String, args:Any*): Unit =  {
        println(moduleName)
        args.foreach{ arg =>
            println("\t- "+ arg)
        }
    }
}

// force the compiler generate specific data into verilog
object MultiDontTouch{
    def apply[T <: Data](datas: T*): Unit = {
        datas.map{ data => dontTouch(data)}
    }
}

object GTimer {
    def apply() = {
        val c = RegInit(0.U(64.W))
        c := c + 1.U
        c
    }
}


object  DebugLevel {
    val DBG_LOW: Int = 2
    val DBG_MEDIEN: Int = 1
    val DBG_HIGH: Int = 0
}

import  DebugLevel._

object DebugLog {
    def apply(params: MyCpuParameters, level: Int, fmt: String, data: Bits*): Any = {
        if(params.enableDebug && level >= params.debugThreshold){
            val levelStr: String = level match{
                case DBG_HIGH => "DBG_HIGH"
                case DBG_MEDIEN => "DBG_MEDIEN"
                case DBG_LOW => "DBG_LOW"
                case _ => "DBG_LOW"
            }
            val commonInfo = p"[time=${GTimer()}] [ "+ levelStr +" ] : "
            val pable = Printable.pack(fmt, data: _*)
            printf(commonInfo + pable)
        }
    }
}

object PrintWhen{
    def apply(fmt: String, data: Bits*): Any = 
        apply(true.B, fmt, data: _*)
    
    def apply(cond: Bool,fmt: String, data: Bits*): Any = {
        when(cond) {
            printf(fmt, data: _*)
        }
    }
}

object NumToRegStr {
    def apply(num: Int): String = {
        val table = Seq(
            0 -> "zero", 1 -> "ra", 2 -> "sp", 3 -> "gp", 4 -> "tp",
            5 -> "t0", 6 -> "t1", 7 -> "t2", 8 -> "s0/fp", 9 -> "s1",
            10 -> "a0", 11 -> "a1", 12 -> "a2", 13 -> "a3", 14 -> "a4",
            15 -> "a5", 16 -> "a6", 17 -> "a7", 18 -> "s2", 19 -> "s3",
            20 -> "s4", 21 -> "s5", 22 -> "s6", 23 -> "s7", 24 -> "s8",
            25 -> "s9", 26 -> "s10", 27 -> "s11", 28 -> "t3", 29 -> "t4",
            30 -> "t5", 31 -> "t6"
        )
        table(num)._2
    }
}

object RegStrtoNum {
    def apply(str: String): Int = {
        val table = Seq(
            0 -> "zero", 1 -> "ra", 2 -> "sp", 3 -> "gp", 4 -> "tp",
            5 -> "t0", 6 -> "t1", 7 -> "t2", 8 -> "s0", 9 -> "s1",
            10 -> "a0", 11 -> "a1", 12 -> "a2", 13 -> "a3", 14 -> "a4",
            15 -> "a5", 16 -> "a6", 17 -> "a7", 18 -> "s2", 19 -> "s3",
            20 -> "s4", 21 -> "s5", 22 -> "s6", 23 -> "s7", 24 -> "s8",
            25 -> "s9", 26 -> "s10", 27 -> "s11", 28 -> "t3", 29 -> "t4",
            30 -> "t5", 31 -> "t6"
        )
        val readVec = table.map { case (n, s) => 
            if(s == str)
                n
            else
                0
        }
        readVec.reduce(_+_)
    }
}

// TODO: fill it
/**
 * (1) drive signals with expect output checking
  * driver(
  *     drive signals:
  *         Map(
  *             c.io.in -> 1.U
  *             ......
  *         )
  *     expect:
  *         Map(
  *             c.io.out -> 1.U
  *         )
  *     step? 
  *         c.clock.step()
  * )
  * 
  * (2) drive signals without expecting signal output checking
  * 
  * need to check whether the drive signals is "hit"
  *     i.e. check the input signal ports and compare with input drived signals using "c.io.xxx.peek()"
  */


// TODO:
// object Repeat{
//     def apply(times:Int)(xs:Any) {
//         (0 until times).foreach{ i =>
//             println(times)
//             xs
//         }
//     }
// }


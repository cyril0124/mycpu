// package mycpu

// import chisel3._
// import chisel3.util._
// import org.chipsalliance.cde.config._

// import mycpu.common._

// import chiseltest._
// import org.scalatest.flatspec.AnyFlatSpec
// import scala.util.Random.nextInt

// class <Template>Test extends AnyFlatSpec with ChiselScalatestTester {
//     behavior of "<Template>Test"

//     val annos = Seq(WriteVcdAnnotation)

//     val defaultConfig = new Config((_,_,_) => {
//         case MyCpuParamsKey => MyCpuParameters(
//             simulation = false
//         )
//     })

//     it should "test <Template>" in {
//         test(new <Template>()(defaultConfig)).withAnnotations(annos) { c => 

//             def init() = {

//             }

//             def randData() = nextInt(1000)

//             init()
//             c.clock.step(10)


//             c.clock.step(200)
//         }
//     }
// }
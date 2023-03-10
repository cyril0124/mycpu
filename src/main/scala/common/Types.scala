package mycpu.common

import chisel3._
import chisel3.util._

abstract class MyModule extends Module with HasMyCpuParameters 

abstract class MyBundle extends Bundle with HasMyCpuParameters


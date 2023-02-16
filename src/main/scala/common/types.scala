package mycpu.common

import chisel3._
import chisel3.util._

abstract class  MyModule extends Module with HasMyCpuParameters 
    with ScalarOpConstants 
    with AluOpConstants

abstract class MyBundle extends Bundle with HasMyCpuParameters


// See README.md for license details.

package gcd

import chisel3._

/**
  * Compute GCD using subtraction method.
  * Subtracts the smaller from the larger until register y is zero.
  * value in register x is then the GCD
  */
//class GCD extends Module {
//  val io = IO(new Bundle {
//    val x  = Input(UInt(16.W))
//    val y  = Input(UInt(16.W))
//    val opcode  = Input(UInt(2.W))
//    val result  = Output(UInt(16.W))
//  })
//
//  when(io.opcode === 1.U) {
//    io.result := io.x + io.y 
//  } .elsewhen (io.opcode === 2.U) {
//    io.result := io.x & io.y
//  } .elsewhen (io.opcode === 3.U) {
//    io.result := io.x | io.y
//  } .otherwise {
//    io.result := io.x - io.y
//  }
//}


class GCD extends Module {
  val io = IO(new Bundle {
    val x  = Input(UInt(16.W))
    val y  = Input(UInt(16.W))
    val opcode  = Input(UInt(2.W))
    val result  = Output(UInt(16.W))
  })

  when(io.opcode === 1.U) {
    io.result := io.x + io.y 
  } .elsewhen (io.opcode === 2.U) {
    io.result := io.x & io.y
  } .elsewhen (io.opcode === 3.U) {
    io.result := io.x | io.y
  } .otherwise {
    io.result := io.x - io.y
  }
}

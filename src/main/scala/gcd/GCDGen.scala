package gcd

import chisel3._

object GCD_top extends App {
  //chisel3.Driver.execute(args, () => new GCD)
  Driver.execute(args, () => new GCD)
}

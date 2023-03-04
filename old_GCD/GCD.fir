;buildInfoPackage: chisel3, version: 3.2.8, scalaVersion: 2.12.10, sbtVersion: 1.3.2
circuit GCD : 
  module GCD : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip x : UInt<16>, flip y : UInt<16>, flip opcode : UInt<2>, result : UInt<16>}
    
    node _T = eq(io.opcode, UInt<1>("h01")) @[GCD.scala 20:18]
    when _T : @[GCD.scala 20:27]
      node _T_1 = add(io.x, io.y) @[GCD.scala 21:23]
      node _T_2 = tail(_T_1, 1) @[GCD.scala 21:23]
      io.result <= _T_2 @[GCD.scala 21:15]
      skip @[GCD.scala 20:27]
    else : @[GCD.scala 22:35]
      node _T_3 = eq(io.opcode, UInt<2>("h02")) @[GCD.scala 22:26]
      when _T_3 : @[GCD.scala 22:35]
        node _T_4 = and(io.x, io.y) @[GCD.scala 23:23]
        io.result <= _T_4 @[GCD.scala 23:15]
        skip @[GCD.scala 22:35]
      else : @[GCD.scala 24:35]
        node _T_5 = eq(io.opcode, UInt<2>("h03")) @[GCD.scala 24:26]
        when _T_5 : @[GCD.scala 24:35]
          node _T_6 = or(io.x, io.y) @[GCD.scala 25:23]
          io.result <= _T_6 @[GCD.scala 25:15]
          skip @[GCD.scala 24:35]
        else : @[GCD.scala 26:16]
          node _T_7 = sub(io.x, io.y) @[GCD.scala 27:23]
          node _T_8 = tail(_T_7, 1) @[GCD.scala 27:23]
          io.result <= _T_8 @[GCD.scala 27:15]
          skip @[GCD.scala 26:16]
    

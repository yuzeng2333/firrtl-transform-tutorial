module GCD(
  input         clock,
  input         reset,
  input  [15:0] io_x,
  input  [15:0] io_y,
  input  [1:0]  io_opcode,
  output [15:0] io_result
);
  wire  _T = io_opcode == 2'h1; // @[GCD.scala 20:18]
  wire [15:0] _T_2 = io_x + io_y; // @[GCD.scala 21:23]
  wire  _T_3 = io_opcode == 2'h2; // @[GCD.scala 22:26]
  wire [15:0] _T_4 = io_x & io_y; // @[GCD.scala 23:23]
  wire  _T_5 = io_opcode == 2'h3; // @[GCD.scala 24:26]
  wire [15:0] _T_6 = io_x | io_y; // @[GCD.scala 25:23]
  wire [15:0] _T_8 = io_x - io_y; // @[GCD.scala 27:23]
  wire [15:0] _GEN_0 = _T_5 ? _T_6 : _T_8; // @[GCD.scala 24:35]
  wire [15:0] _GEN_1 = _T_3 ? _T_4 : _GEN_0; // @[GCD.scala 22:35]
  assign io_result = _T ? _T_2 : _GEN_1; // @[GCD.scala 21:15 GCD.scala 23:15 GCD.scala 25:15 GCD.scala 27:15]
endmodule

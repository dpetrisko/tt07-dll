`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  `ifndef VERILATOR
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end
  `endif

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  wire [7:0] ui_in;
  wire [7:0] uio_in;
  reg [7:0] uo_out;
  reg [7:0] uio_out;
  reg [7:0] uio_oe;

  wire ui_in_0;
  wire ui_in_1;
  wire ui_in_2;
  wire ui_in_3;
  wire ui_in_4;
  wire ui_in_5;
  wire ui_in_6;
  wire ui_in_7;

  wire uio_in_0;
  wire uio_in_1;
  wire uio_in_2;
  wire uio_in_3;
  wire uio_in_4;
  wire uio_in_5;
  wire uio_in_6;
  wire uio_in_7;

  reg uo_out_0;
  reg uo_out_1;
  reg uo_out_2;
  reg uo_out_3;
  reg uo_out_4;
  reg uo_out_5;
  reg uo_out_6;
  reg uo_out_7;

  reg uio_out_0;
  reg uio_out_1;
  reg uio_out_2;
  reg uio_out_3;
  reg uio_out_4;
  reg uio_out_5;
  reg uio_out_6;
  reg uio_out_7;

  reg uio_oe_0;
  reg uio_oe_1;
  reg uio_oe_2;
  reg uio_oe_3;
  reg uio_oe_4;
  reg uio_oe_5;
  reg uio_oe_6;
  reg uio_oe_7;

  assign ui_in = {ui_in_7, ui_in_6, ui_in_5, ui_in_4, ui_in_3, ui_in_2, ui_in_1, ui_in_0};
  assign uio_in = {uio_in_7, uio_in_6, uio_in_5, uio_in_4, uio_in_3, uio_in_2, uio_in_1, uio_in_0};
  assign {uo_out_7, uo_out_6, uo_out_5, uo_out_4, uo_out_3, uo_out_2, uo_out_1, uo_out_0} = uo_out;
  assign {uio_out_7, uio_out_6, uio_out_5, uio_out_4, uio_out_3, uio_out_2, uio_out_1, uio_out_0} = uio_out;
  assign {uio_oe_7, uio_oe_6, uio_oe_5, uio_oe_4, uio_oe_3, uio_oe_2, uio_oe_1, uio_oe_0} = uio_oe;

  // Replace tt_um_example with your module name:
  tt_um_dpetrisko_ttdll user_project (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .ui_in  (ui_in),    // Dedicated inputs
      .uo_out (uo_out),   // Dedicated outputs
      .uio_in (uio_in),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );

endmodule

/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_dpetrisko_ttdll (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  //wire p_unused_0_i = ui_in[0];
  wire p_unused_0_i = ui_in[0];
  //wire p_unused_1_i = ui_in[1];
  wire p_tag_clk_i = ui_in[1];
  //wire p_unused_2_i = ui_in[2];
  wire p_tag_en_i = ui_in[2];
  //wire p_unused_3_i = ui_in[3];
  wire p_tag_data_i = ui_in[3];
  wire p_unused_4_i = ui_in[4];
  wire p_unused_5_i = ui_in[5];
  wire p_unused_6_i = ui_in[6];
  wire p_unused_7_i = ui_in[7];

  wire p_unused_0_oi = uio_in[0];
  wire p_unused_1_oi = uio_in[1];
  wire p_unused_2_oi = uio_in[2];
  wire p_unused_3_oi = uio_in[3];
  wire p_unused_4_oi = uio_in[4];
  wire p_unused_5_oi = uio_in[5];
  wire p_unused_6_oi = uio_in[6];
  wire p_unused_7_oi = uio_in[7];

  wire p_ext_clk_i = clk;
  wire p_ext_ena_i = ena;
  wire p_ext_reset_i = !rst_n;

  wire p_osc_clk_o;
  wire p_ds_clk_o;
  wire p_gen_clk_o;
  wire p_dly_clk_o;
  wire p_mon_clk_o;
  wire p_div_clk_o;
  wire p_ds_reset_o;
  wire p_mon_reset_o;

  wire p_ext_clk_o;
  wire p_ext_reset_o;
  wire p_tag_clk_o;
  wire p_tag_en_o;
  wire p_tag_data_o;
  bsg_clk_dly_gen top
   (.ext_clk_i(p_ext_clk_i)
    ,.ext_reset_i(p_ext_reset_i)
    ,.tag_clk_i(p_tag_clk_i)
    ,.tag_en_i(p_tag_en_i)
    ,.tag_data_i(p_tag_data_i)

    ,.osc_clk_o(p_osc_clk_o)
    ,.ds_clk_o(p_ds_clk_o)
    ,.gen_clk_o(p_gen_clk_o)
    ,.dly_clk_o(p_dly_clk_o)
    ,.mon_clk_o(p_mon_clk_o)
    ,.div_clk_o(p_div_clk_o)
    ,.ds_reset_o(p_ds_reset_o)
    ,.mon_reset_o(p_mon_reset_o)

    ,.ext_clk_o(p_ext_clk_o)
    ,.ext_reset_o(p_ext_reset_o)
    ,.tag_clk_o(p_tag_clk_o)
    ,.tag_en_o(p_tag_en_o)
    ,.tag_data_o(p_tag_data_o)
    );

  // All output pins must be assigned. If not used, assign to 0.
  //
  //assign uo_out[0] = p_unused_0_o;
  assign uo_out[0] = p_osc_clk_o;
  //assign uo_out[1] = p_unused_1_o;
  assign uo_out[1] = p_ds_clk_o;
  //assign uo_out[2] = p_unused_2_o;
  assign uo_out[2] = p_gen_clk_o;
  //assign uo_out[3] = p_unused_3_o;
  assign uo_out[3] = p_dly_clk_o;
  //assign uo_out[4] = p_unused_4_o;
  assign uo_out[4] = p_mon_clk_o;
  //assign uo_out[5] = p_unused_5_o;
  assign uo_out[5] = p_div_clk_o;
  //assign uo_out[6] = p_unused_6_o;
  assign uo_out[6] = p_ds_reset_o;
  //assign uo_out[7] = p_unused_7_o;
  assign uo_out[7] = p_mon_reset_o;

  //assign uio_out[0] = 1'b0;
  assign uio_out[0] = p_ext_clk_o;
  //assign uio_out[1] = 1'b0;
  assign uio_out[1] = p_ext_reset_o;
  assign uio_out[2] = p_tag_clk_o;
  assign uio_out[3] = p_tag_en_o;
  assign uio_out[4] = p_tag_data_o;
  assign uio_out[5] = 1'b0;
  assign uio_out[6] = 1'b0;
  assign uio_out[7] = 1'b0;

  //assign uio_oe[0] = 1'b0;
  assign uio_oe[0] = 1'b1;
  //assign uio_oe[1] = 1'b0;
  assign uio_oe[1] = 1'b1;
  //assign uio_oe[2] = 1'b0;
  assign uio_oe[2] = 1'b1;
  //assign uio_oe[3] = 1'b0;
  assign uio_oe[3] = 1'b1;
  //assign uio_oe[4] = 1'b0;
  assign uio_oe[4] = 1'b1;
  assign uio_oe[5] = 1'b0;
  assign uio_oe[6] = 1'b0;
  assign uio_oe[7] = 1'b0;

endmodule


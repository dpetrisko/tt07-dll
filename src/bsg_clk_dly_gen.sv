
`include "bsg_defines.sv"
`include "bsg_chip_defines.svh"

module bsg_clk_dly_gen
 import bsg_chip_pkg::*;
 import bsg_tag_pkg::*;
  (input wire ext_clk_i
   , input wire ext_reset_i
   , input wire tag_clk_i
   , input wire tag_en_i
   , input wire tag_data_i

   // Output clocks
   , output wire osc_clk_o
   , output wire ds_clk_o
   , output wire gen_clk_o
   , output wire dly_clk_o
   , output wire mon_clk_o
   , output wire div_clk_o
   // Output tag registers
   , output wire ds_reset_o
   , output wire mon_reset_o

   , output wire [div_count_width_gp-1:0] div_count_o
   );

  // Buffer inputs
  wire ext_clk_lo = ext_clk_i;
  `BSG_CLKBUF(ext);
  wire ext_reset_lo = ext_reset_i;
  `BSG_DATABUF(ext_reset, 1);
  wire tag_clk_lo = tag_clk_i;
  `BSG_CLKBUF(tag);
  wire tag_data_lo = tag_data_i;
  `BSG_DATABUF(tag_data, 1);
  wire tag_en_lo = tag_en_i;
  `BSG_DATABUF(tag_en, 1);


  wire [tag_lg_els_gp-1:0] tag_node_id_offset_li = '0;
  // Generate local taglines
  bsg_chip_tag_lines_s tag_lines_lo;
  bsg_tag_master_decentralized
   #(.els_p(tag_els_gp)
     ,.local_els_p(bsg_chip_tag_local_els_gp)
     ,.lg_width_p(tag_lg_width_gp)
     )
   btm
    (.clk_i(tag_clk_buf_lo)
     ,.data_i(tag_data_buf_lo & tag_en_lo)
     ,.node_id_offset_i(tag_node_id_offset_li)
     ,.clients_o(tag_lines_lo)
     );

  // Declare generated clocks
  wire osc_clk_lo, oscmux_clk_lo, ds_clk_lo, gen_clk_lo;
  wire dly_clk_lo, monmux_clk_lo, mon_clk_lo, div_clk_lo;

  // Declare tag clients
  `BSG_TAG_CLIENT_UNSYNC(tag_lines_lo.osc.sel, osc_sel, 2);
  `BSG_TAG_CLIENT_SYNC(tag_lines_lo.osc.ds, osc_ds, osc_ds_width_gp+1, osc_clk_lo);
  // Inside bsg_clk_gen_osc_v3
  //`BSG_TAG_CLIENT_UNSYNC(tag_lines_lo.osc.trigger, osc_trigger, 1);
  //`BSG_TAG_CLIENT_UNSYNC(tag_lines_lo.osc.ctl, osc_ctl, osc_ctl_width_gp);

  `BSG_TAG_CLIENT_UNSYNC(tag_lines_lo.dly.unused, dly_unused, 1);

  `BSG_TAG_CLIENT_UNSYNC(tag_lines_lo.mon.sel, mon_sel, 1);
  `BSG_TAG_CLIENT_SYNC(tag_lines_lo.mon.reset, mon_reset, 1, mon_clk_lo);

  `BSG_TAG_CLIENT_SYNC(tag_lines_lo.div.reset, div_reset, 1, div_clk_lo);
  `BSG_TAG_CLIENT_SYNC(tag_lines_lo.div.enable, div_enable, 1, div_clk_lo);
  `BSG_TAG_CLIENT_SYNC(tag_lines_lo.div.clear, div_clear, 1, div_clk_lo);

  //// Cast tag payloads
  `include "bsg_clk_gen.svh"
  `declare_bsg_clk_gen_ds_tag_payload_s(osc_ds_width_gp);
  bsg_clk_gen_ds_tag_payload_s osc_ds_tag_payload_r_lo;
  assign osc_ds_tag_payload_r_lo = osc_ds_r_lo;

  //// Oscillator
  bsg_clk_gen_osc_v3
   #(.num_taps_p(osc_num_taps_gp))
   osc
    (.async_reset_i(ext_reset_lo)
     ,.bsg_tag_i(tag_lines_lo.osc.ctl)
     ,.bsg_tag_trigger_i(tag_lines_lo.osc.trigger)
     ,.clk_o(osc_clk_lo)
     );
  `BSG_CLKBUF(osc);

  //// Downsampler
  wire ds_reset_r_lo = osc_ds_tag_payload_r_lo.reset;
  wire [osc_ds_width_gp-1:0] ds_val_r_lo = osc_ds_tag_payload_r_lo.val;
  bsg_counter_clock_downsample
   #(.width_p(osc_ds_width_gp))
   clk_gen_ds_inst
    (.clk_i(osc_clk_buf_lo)
     ,.reset_i(ds_reset_r_lo)
     ,.val_i(ds_val_r_lo)
     ,.clk_r_o(ds_clk_lo)
     );
  `BSG_DATABUF(ds_reset_r, 1);
  `BSG_CLKBUF(ds);

  //// Clock mux selection
  `BSG_CLKMUX4(osc);
  assign oscmux_li = {1'b0, ext_clk_buf_lo, ds_clk_buf_lo, osc_clk_buf_lo};
  assign oscmux_sel_li = osc_sel_r_lo;
  assign oscmux_clk_lo = oscmux_lo;

  // Buffer generated clock selection
  assign gen_clk_lo = oscmux_clk_lo;
  `BSG_CLKBUF(gen);

  //// Delay line
  bsg_dmc_dly_line_v3
   #(.num_taps_p(dly_num_taps_gp))
   dly
    (.clk_i(gen_clk_buf_lo)
     ,.async_reset_i(ext_reset_lo)
     ,.clk_o(dly_clk_lo)
     );
  `BSG_CLKBUF(dly);

  //// Clock monitor selection
  `BSG_CLKMUX2(mon);
  assign monmux_li = {dly_clk_buf_lo, gen_clk_buf_lo};
  assign monmux_sel_li = mon_sel_r_lo;
  assign monmux_clk_lo = monmux_lo;

  // Buffer clock monitor selection
  assign mon_clk_lo = monmux_clk_lo;
  `BSG_CLKBUF(mon);

  // Clock monitor
  bsg_lfsr_div30 lfsr
   (.clk_i(mon_clk_buf_lo)
    ,.reset_i(mon_reset_r_lo)
    ,.clk_div_o(div_clk_lo)
    );
  `BSG_CLKBUF(div);
  `BSG_DATABUF(mon_reset_r, 1);

  wire [div_count_width_gp-1:0] div_count_r_lo;
  bsg_counter_clear_up
   #(.max_val_p(2**div_count_width_gp-1)
     ,.init_val_p(0)
     ,.disable_overflow_warning_p(1)
     )
   div_counter
    (.clk_i(div_clk_lo)
     ,.reset_i(div_reset_r_lo)
     ,.clear_i(div_clear_r_lo)
     ,.up_i(div_enable_r_lo)
     ,.count_o(div_count_r_lo)
     );
  `BSG_DATABUF(div_count_r, div_count_width_gp);

  assign osc_clk_o = osc_clk_buf_lo;
  assign ds_clk_o = ds_clk_buf_lo;
  assign gen_clk_o = gen_clk_buf_lo;
  assign dly_clk_o = dly_clk_buf_lo;
  assign mon_clk_o = mon_clk_buf_lo;
  assign div_clk_o = div_clk_buf_lo;
  assign ds_reset_o = ds_reset_r_buf_lo;
  assign mon_reset_o = mon_reset_r_buf_lo;
  assign div_count_o = div_count_r_buf_lo;

endmodule


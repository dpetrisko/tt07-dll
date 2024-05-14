
package bsg_chip_pkg;
  import bsg_tag_pkg::*;

  // design parameters
  localparam osc_num_taps_gp = 4;
  localparam osc_ctl_width_gp = $clog2(osc_num_taps_gp);
  localparam osc_ds_width_gp = 2;
  localparam dly_num_taps_gp = 4;

  // number of clients for the whole system
  localparam tag_els_gp = 1024;
  // id width for the whole system
  localparam tag_lg_els_gp = $clog2(tag_els_gp);
  // maximum payload width for the whole system
  localparam tag_max_payload_width_gp = 12;
  // number of bits required to represent the max payload width
  localparam tag_lg_width_gp = $clog2(tag_max_payload_width_gp+1);

  typedef struct packed
  {
    bsg_tag_s sel;
    bsg_tag_s ds;
    bsg_tag_s trigger;
    bsg_tag_s ctl;
  }  bsg_clk_osc_tag_lines_s;
  localparam bsg_clk_osc_tag_local_els_gp =
    $bits(bsg_clk_osc_tag_lines_s) / $bits(bsg_tag_s);

  typedef struct packed
  {
    bsg_tag_s unused;
  }  bsg_clk_dly_tag_lines_s;
  localparam bsg_clk_dly_tag_local_els_gp =
    $bits(bsg_clk_dly_tag_lines_s) / $bits(bsg_tag_s);

  typedef struct packed
  {
    bsg_tag_s sel;
    bsg_tag_s reset;
  }  bsg_clk_mon_tag_lines_s;
  localparam bsg_clk_mon_tag_local_els_gp =
    $bits(bsg_clk_mon_tag_lines_s) / $bits(bsg_tag_s);

  // Warning: Danger Zone
  // Must set parameters below correctly, else chip may fail
  typedef struct packed
  {
    bsg_clk_mon_tag_lines_s mon;
    bsg_clk_dly_tag_lines_s dly;
    bsg_clk_osc_tag_lines_s osc;
  }  bsg_chip_tag_lines_s;
  localparam bsg_chip_tag_local_els_gp =
    $bits(bsg_chip_tag_lines_s) / $bits(bsg_tag_s);

endpackage


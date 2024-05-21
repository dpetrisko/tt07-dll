
// ## AUTOGENERATED; DO NOT MODIFY
// ## num_rows_p = 2
// ## num_cols_p = 2
// ## num_dly_p = 2


module bsg_rp_clk_gen_osc_v3
  (input async_reset_i
   , input trigger_i
   , input [3:0] ctl_one_hot_i
   , output clk_o
   );
  wire lobit, hibit;
  sky130_fd_sc_hd__conb_1 T0 (.HI(hibit), .LO(lobit));
  wire async_reset_neg;
  sky130_fd_sc_hd__inv_1 I0 (.Y(async_reset_neg), .A(async_reset_i));
  wire fb_inv, fb, fb_rst;
  sky130_fd_sc_hd__clkinv_1 I1 (.Y(fb_inv), .A(fb));

  sky130_fd_sc_hd__nand2_1 N0 (.Y(fb_rst), .A(fb_inv), .B(async_reset_neg));
  wire [2:0] n;
  assign n[0] = fb_rst;


    sky130_fd_sc_hd__clkbuf_1 B0 (.X(n[1]), .A(n[0]));


    sky130_fd_sc_hd__clkbuf_1 B1 (.X(n[2]), .A(n[1]));


  // Synthesize as blackbox
  wire fb_dly;
  bsg_nonsynth_delay_line #(.width_p(1), .delay_p(10)) fb_dly_BSG_DONT_TOUCH (.o(fb_dly), .i(n[2]));
  sky130_fd_sc_hd__clkinv_1 I2 (.Y(clk_o), .A(fb_dly));
  wire fb_gate;
  sky130_fd_sc_hd__clkinv_1 I3 (.Y(fb_gate), .A(fb_dly));
  wire gate_en_sync_1_r, gate_en_sync_2_r;
  sky130_fd_sc_hd__dfxtp_1 S1 (.D(trigger_i), .CLK(fb_gate), .Q(gate_en_sync_1_r));
  sky130_fd_sc_hd__dfxtp_1 S2 (.D(gate_en_sync_1_r), .CLK(fb_gate), .Q(gate_en_sync_2_r));
  wire fb_gated;
  // Size to 1/4 of number of taps
  sky130_fd_sc_hd__dlclkp_1 CG0 (.GCLK(fb_gated), .CLK(fb_gate), .GATE(gate_en_sync_2_r));
  wire [2:0] fb_col;
  assign fb_col[0] = 1'b0;


      bsg_rp_clk_gen_osc_v3_col col_0_BSG_DONT_TOUCH
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_dly)
        ,.clkfb_i(fb_col[0])
        ,.ctl_one_hot_i(ctl_one_hot_i[1:0])
        ,.clk_o(fb_col[1])
        );


      bsg_rp_clk_gen_osc_v3_col col_1_BSG_DONT_TOUCH
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_dly)
        ,.clkfb_i(fb_col[1])
        ,.ctl_one_hot_i(ctl_one_hot_i[3:2])
        ,.clk_o(fb_col[2])
        );


  assign fb = fb_col[2];
endmodule


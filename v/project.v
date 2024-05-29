

module bsg_clkbuf_width_p1_strength_p4_harden_p1
(
  i,
  o
);

  input [0:0] i;
  output [0:0] o;
  wire [0:0] o;

  sky130_fd_sc_hd__clkbuf_4
  \macro.genblk1_0_.b 
  (
    .X(o[0]),
    .A(i[0])
  );


endmodule



module bsg_buf_width_p1_harden_p1
(
  i,
  o
);

  input [0:0] i;
  output [0:0] o;
  wire [0:0] o;

  sky130_fd_sc_hd__buf_1
  \macro.genblk1_0_.b 
  (
    .X(o[0]),
    .A(i[0])
  );


endmodule



module bsg_counter_clear_up_max_val_p63_init_val_p0
(
  clk_i,
  reset_i,
  clear_i,
  up_i,
  count_o
);

  output [5:0] count_o;
  input clk_i;
  input reset_i;
  input clear_i;
  input up_i;
  wire [5:0] count_o;
  wire N0,N1,N4,N5,N6,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N2,N3,N7,N30,N19;
  reg count_o_5_sv2v_reg,count_o_4_sv2v_reg,count_o_3_sv2v_reg,count_o_2_sv2v_reg,
  count_o_1_sv2v_reg,count_o_0_sv2v_reg;
  assign count_o[5] = count_o_5_sv2v_reg;
  assign count_o[4] = count_o_4_sv2v_reg;
  assign count_o[3] = count_o_3_sv2v_reg;
  assign count_o[2] = count_o_2_sv2v_reg;
  assign count_o[1] = count_o_1_sv2v_reg;
  assign count_o[0] = count_o_0_sv2v_reg;
  assign N19 = reset_i | clear_i;
  assign { N11, N10, N9, N8, N6, N5 } = count_o + 1'b1;
  assign N12 = (N0)? 1'b1 : 
               (N7)? 1'b1 : 
               (N3)? 1'b0 : 1'b0;
  assign N0 = clear_i;
  assign N14 = (N1)? 1'b1 : 
               (N30)? 1'b0 : 1'b0;
  assign N1 = up_i;
  assign N13 = (N0)? up_i : 
               (N7)? N5 : 1'b0;
  assign N4 = N18;
  assign N15 = ~reset_i;
  assign N16 = ~clear_i;
  assign N17 = N15 & N16;
  assign N18 = up_i & N17;
  assign N2 = up_i | clear_i;
  assign N3 = ~N2;
  assign N7 = up_i & N16;
  assign N30 = ~up_i;

  always @(posedge clk_i) begin
    if(N19) begin
      count_o_5_sv2v_reg <= 1'b0;
      count_o_4_sv2v_reg <= 1'b0;
      count_o_3_sv2v_reg <= 1'b0;
      count_o_2_sv2v_reg <= 1'b0;
      count_o_1_sv2v_reg <= 1'b0;
    end else if(N14) begin
      count_o_5_sv2v_reg <= N11;
      count_o_4_sv2v_reg <= N10;
      count_o_3_sv2v_reg <= N9;
      count_o_2_sv2v_reg <= N8;
      count_o_1_sv2v_reg <= N6;
    end 
    if(reset_i) begin
      count_o_0_sv2v_reg <= 1'b0;
    end else if(N12) begin
      count_o_0_sv2v_reg <= N13;
    end 
  end


endmodule



module bsg_tag_master_decentralized_els_p1024_local_els_p11_lg_width_p4
(
  clk_i,
  data_i,
  node_id_offset_i,
  clients_o
);

  input [9:0] node_id_offset_i;
  output [43:0] clients_o;
  input clk_i;
  input data_i;
  wire [43:0] clients_o;
  wire N0,N1,N2,N3,N4,N5,N6,N7,clients_o_0__clk_,data_i_r,_1_net_,_2_net_,N8,v_n,
  bsg_tag_n_op_,bsg_tag_n_param_,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,N21,N22,
  N23,N24,N25,N26,N27,N28,N29,node_id_above_offset,local_node_id_below_limit,
  node_id_match,N30,N31,N32,N33,N34,N35,N36,N37,N38,N39,N40,N41,N42,N43,N44,N45,N46,
  N47,N48,N49,N50,N51,N52,N53,N54,N55,N56,N57,N58,N59,N60,N61,N62,N63,N64,N65,N66,
  N67,N68,N69,N70,N71,N72,N73;
  wire [5:0] zeros_ctr_r;
  wire [1:0] state_r,state_n;
  wire [4:0] hdr_ptr_r,hdr_ptr_n;
  wire [14:0] hdr_r,hdr_n;
  wire [9:0] local_node_id;
  wire [10:0] clients_decode;
  reg data_i_r_sv2v_reg,hdr_ptr_r_4_sv2v_reg,hdr_ptr_r_3_sv2v_reg,
  hdr_ptr_r_2_sv2v_reg,hdr_ptr_r_1_sv2v_reg,hdr_ptr_r_0_sv2v_reg,state_r_1_sv2v_reg,
  state_r_0_sv2v_reg,hdr_r_14_sv2v_reg,hdr_r_13_sv2v_reg,hdr_r_12_sv2v_reg,hdr_r_11_sv2v_reg,
  hdr_r_10_sv2v_reg,hdr_r_9_sv2v_reg,hdr_r_8_sv2v_reg,hdr_r_7_sv2v_reg,hdr_r_6_sv2v_reg,
  hdr_r_5_sv2v_reg,hdr_r_4_sv2v_reg,hdr_r_3_sv2v_reg,hdr_r_2_sv2v_reg,
  hdr_r_1_sv2v_reg,hdr_r_0_sv2v_reg;
  assign data_i_r = data_i_r_sv2v_reg;
  assign hdr_ptr_r[4] = hdr_ptr_r_4_sv2v_reg;
  assign hdr_ptr_r[3] = hdr_ptr_r_3_sv2v_reg;
  assign hdr_ptr_r[2] = hdr_ptr_r_2_sv2v_reg;
  assign hdr_ptr_r[1] = hdr_ptr_r_1_sv2v_reg;
  assign hdr_ptr_r[0] = hdr_ptr_r_0_sv2v_reg;
  assign state_r[1] = state_r_1_sv2v_reg;
  assign state_r[0] = state_r_0_sv2v_reg;
  assign hdr_r[14] = hdr_r_14_sv2v_reg;
  assign hdr_r[13] = hdr_r_13_sv2v_reg;
  assign hdr_r[12] = hdr_r_12_sv2v_reg;
  assign hdr_r[11] = hdr_r_11_sv2v_reg;
  assign hdr_r[10] = hdr_r_10_sv2v_reg;
  assign hdr_r[9] = hdr_r_9_sv2v_reg;
  assign hdr_r[8] = hdr_r_8_sv2v_reg;
  assign hdr_r[7] = hdr_r_7_sv2v_reg;
  assign hdr_r[6] = hdr_r_6_sv2v_reg;
  assign hdr_r[5] = hdr_r_5_sv2v_reg;
  assign hdr_r[4] = hdr_r_4_sv2v_reg;
  assign hdr_r[3] = hdr_r_3_sv2v_reg;
  assign hdr_r[2] = hdr_r_2_sv2v_reg;
  assign hdr_r[1] = hdr_r_1_sv2v_reg;
  assign hdr_r[0] = hdr_r_0_sv2v_reg;
  assign clients_o[40] = 1'b1;
  assign clients_o[36] = 1'b1;
  assign clients_o[32] = 1'b1;
  assign clients_o[28] = 1'b1;
  assign clients_o[24] = 1'b1;
  assign clients_o[20] = 1'b1;
  assign clients_o[16] = 1'b1;
  assign clients_o[12] = 1'b1;
  assign clients_o[8] = 1'b1;
  assign clients_o[4] = 1'b1;
  assign clients_o[0] = 1'b1;
  assign clients_o_0__clk_ = clk_i;
  assign clients_o[43] = clients_o_0__clk_;
  assign clients_o[39] = clients_o_0__clk_;
  assign clients_o[35] = clients_o_0__clk_;
  assign clients_o[31] = clients_o_0__clk_;
  assign clients_o[27] = clients_o_0__clk_;
  assign clients_o[23] = clients_o_0__clk_;
  assign clients_o[19] = clients_o_0__clk_;
  assign clients_o[15] = clients_o_0__clk_;
  assign clients_o[11] = clients_o_0__clk_;
  assign clients_o[7] = clients_o_0__clk_;
  assign clients_o[3] = clients_o_0__clk_;

  bsg_counter_clear_up_max_val_p63_init_val_p0
  bccu
  (
    .clk_i(clients_o_0__clk_),
    .reset_i(1'b0),
    .clear_i(_1_net_),
    .up_i(_2_net_),
    .count_o(zeros_ctr_r)
  );

  assign N11 = N9 & N10;
  assign N12 = state_r[1] | N10;
  assign N14 = N9 | state_r[0];
  assign N16 = state_r[1] & state_r[0];
  assign clients_decode = { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, v_n } << local_node_id[3:0];
  assign node_id_above_offset = hdr_r[14:5] >= node_id_offset_i;
  assign local_node_id_below_limit = local_node_id < { 1'b1, 1'b0, 1'b1, 1'b1 };
  assign N35 = ~hdr_r[0];
  assign N36 = hdr_r[2] | hdr_r[3];
  assign N37 = hdr_r[1] | N36;
  assign N38 = N35 | N37;
  assign N39 = ~N38;
  assign N40 = hdr_r[3] | hdr_r[4];
  assign N41 = hdr_r[2] | N40;
  assign N42 = hdr_r[1] | N41;
  assign N43 = ~hdr_ptr_r[3];
  assign N44 = ~hdr_ptr_r[2];
  assign N45 = ~hdr_ptr_r[1];
  assign N46 = N43 | hdr_ptr_r[4];
  assign N47 = N44 | N46;
  assign N48 = N45 | N47;
  assign N49 = hdr_ptr_r[0] | N48;
  assign N50 = ~N49;
  assign local_node_id = hdr_r[14:5] - node_id_offset_i;
  assign { N21, N20, N19, N18, N17 } = hdr_ptr_r + 1'b1;
  assign { N29, N28, N27, N26 } = hdr_r[3:0] - 1'b1;
  assign { N23, N22 } = (N0)? { N42, 1'b0 } : 
                        (N1)? state_r : 1'b0;
  assign N0 = N50;
  assign N1 = N49;
  assign { N25, N24 } = (N2)? { 1'b0, 1'b0 } : 
                        (N3)? state_r : 1'b0;
  assign N2 = N39;
  assign N3 = N38;
  assign state_n = (N4)? { 1'b0, 1'b1 } : 
                   (N5)? { N23, N22 } : 
                   (N6)? { N25, N24 } : 
                   (N7)? { 1'b1, 1'b1 } : 1'b0;
  assign N4 = N11;
  assign N5 = N13;
  assign N6 = N15;
  assign N7 = N16;
  assign hdr_ptr_n = (N4)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                     (N5)? { N21, N20, N19, N18, N17 } : 1'b0;
  assign hdr_n[3:0] = (N4)? { 1'b0, 1'b0, 1'b0, 1'b0 } : 
                      (N5)? hdr_r[4:1] : 
                      (N6)? { N29, N28, N27, N26 } : 1'b0;
  assign hdr_n[14:4] = (N4)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                       (N5)? { data_i_r, hdr_r[14:5] } : 1'b0;
  assign v_n = (N4)? 1'b0 : 
               (N5)? 1'b0 : 
               (N6)? 1'b1 : 
               (N7)? 1'b0 : 1'b0;
  assign { bsg_tag_n_op_, bsg_tag_n_param_ } = (N4)? { 1'b0, 1'b0 } : 
                                               (N5)? { 1'b0, 1'b0 } : 
                                               (N6)? { hdr_r[4:4], data_i_r } : 
                                               (N7)? { 1'b0, 1'b0 } : 1'b0;
  assign _2_net_ = ~data_i_r;
  assign _1_net_ = data_i_r | zeros_ctr_r[5];
  assign N8 = zeros_ctr_r[5] & N51;
  assign N51 = ~data_i_r;
  assign N9 = ~state_r[1];
  assign N10 = ~state_r[0];
  assign N13 = ~N12;
  assign N15 = ~N14;
  assign node_id_match = node_id_above_offset & local_node_id_below_limit;
  assign clients_o[2] = N52 & bsg_tag_n_op_;
  assign N52 = node_id_match & clients_decode[0];
  assign clients_o[1] = N53 & bsg_tag_n_param_;
  assign N53 = node_id_match & clients_decode[0];
  assign clients_o[6] = N54 & bsg_tag_n_op_;
  assign N54 = node_id_match & clients_decode[1];
  assign clients_o[5] = N55 & bsg_tag_n_param_;
  assign N55 = node_id_match & clients_decode[1];
  assign clients_o[10] = N56 & bsg_tag_n_op_;
  assign N56 = node_id_match & clients_decode[2];
  assign clients_o[9] = N57 & bsg_tag_n_param_;
  assign N57 = node_id_match & clients_decode[2];
  assign clients_o[14] = N58 & bsg_tag_n_op_;
  assign N58 = node_id_match & clients_decode[3];
  assign clients_o[13] = N59 & bsg_tag_n_param_;
  assign N59 = node_id_match & clients_decode[3];
  assign clients_o[18] = N60 & bsg_tag_n_op_;
  assign N60 = node_id_match & clients_decode[4];
  assign clients_o[17] = N61 & bsg_tag_n_param_;
  assign N61 = node_id_match & clients_decode[4];
  assign clients_o[22] = N62 & bsg_tag_n_op_;
  assign N62 = node_id_match & clients_decode[5];
  assign clients_o[21] = N63 & bsg_tag_n_param_;
  assign N63 = node_id_match & clients_decode[5];
  assign clients_o[26] = N64 & bsg_tag_n_op_;
  assign N64 = node_id_match & clients_decode[6];
  assign clients_o[25] = N65 & bsg_tag_n_param_;
  assign N65 = node_id_match & clients_decode[6];
  assign clients_o[30] = N66 & bsg_tag_n_op_;
  assign N66 = node_id_match & clients_decode[7];
  assign clients_o[29] = N67 & bsg_tag_n_param_;
  assign N67 = node_id_match & clients_decode[7];
  assign clients_o[34] = N68 & bsg_tag_n_op_;
  assign N68 = node_id_match & clients_decode[8];
  assign clients_o[33] = N69 & bsg_tag_n_param_;
  assign N69 = node_id_match & clients_decode[8];
  assign clients_o[38] = N70 & bsg_tag_n_op_;
  assign N70 = node_id_match & clients_decode[9];
  assign clients_o[37] = N71 & bsg_tag_n_param_;
  assign N71 = node_id_match & clients_decode[9];
  assign clients_o[42] = N72 & bsg_tag_n_op_;
  assign N72 = node_id_match & clients_decode[10];
  assign clients_o[41] = N73 & bsg_tag_n_param_;
  assign N73 = node_id_match & clients_decode[10];
  assign N30 = N15 | N16;
  assign N31 = ~N30;
  assign N32 = N51 & N11;
  assign N33 = ~N32;
  assign N34 = ~N16;

  always @(posedge clients_o_0__clk_) begin
    if(1'b1) begin
      data_i_r_sv2v_reg <= data_i;
    end 
    if(N8) begin
      hdr_ptr_r_4_sv2v_reg <= 1'b0;
      hdr_ptr_r_3_sv2v_reg <= 1'b0;
      hdr_ptr_r_2_sv2v_reg <= 1'b0;
      hdr_ptr_r_1_sv2v_reg <= 1'b0;
      hdr_ptr_r_0_sv2v_reg <= 1'b0;
    end else if(N31) begin
      hdr_ptr_r_4_sv2v_reg <= hdr_ptr_n[4];
      hdr_ptr_r_3_sv2v_reg <= hdr_ptr_n[3];
      hdr_ptr_r_2_sv2v_reg <= hdr_ptr_n[2];
      hdr_ptr_r_1_sv2v_reg <= hdr_ptr_n[1];
      hdr_ptr_r_0_sv2v_reg <= hdr_ptr_n[0];
    end 
    if(N8) begin
      state_r_1_sv2v_reg <= 1'b0;
      state_r_0_sv2v_reg <= 1'b0;
    end else if(N33) begin
      state_r_1_sv2v_reg <= state_n[1];
      state_r_0_sv2v_reg <= state_n[0];
    end 
    if(N31) begin
      hdr_r_14_sv2v_reg <= hdr_n[14];
      hdr_r_13_sv2v_reg <= hdr_n[13];
      hdr_r_12_sv2v_reg <= hdr_n[12];
      hdr_r_11_sv2v_reg <= hdr_n[11];
      hdr_r_10_sv2v_reg <= hdr_n[10];
      hdr_r_9_sv2v_reg <= hdr_n[9];
      hdr_r_8_sv2v_reg <= hdr_n[8];
      hdr_r_7_sv2v_reg <= hdr_n[7];
      hdr_r_6_sv2v_reg <= hdr_n[6];
      hdr_r_5_sv2v_reg <= hdr_n[5];
      hdr_r_4_sv2v_reg <= hdr_n[4];
    end 
    if(N34) begin
      hdr_r_3_sv2v_reg <= hdr_n[3];
      hdr_r_2_sv2v_reg <= hdr_n[2];
      hdr_r_1_sv2v_reg <= hdr_n[1];
      hdr_r_0_sv2v_reg <= hdr_n[0];
    end 
  end


endmodule



module bsg_mux2_gatestack_width_p2_harden_p1
(
  i0,
  i1,
  i2,
  o
);

  input [1:0] i0;
  input [1:0] i1;
  input [1:0] i2;
  output [1:0] o;
  wire [1:0] o;
  wire N0,N1,N2,N3;
  assign o[0] = (N0)? i1[0] : 
                (N2)? i0[0] : 1'b0;
  assign N0 = i2[0];
  assign o[1] = (N1)? i1[1] : 
                (N3)? i0[1] : 1'b0;
  assign N1 = i2[1];
  assign N2 = ~i2[0];
  assign N3 = ~i2[1];

endmodule



module bsg_dff_width_p2_harden_p1
(
  clk_i,
  data_i,
  data_o
);

  input [1:0] data_i;
  output [1:0] data_o;
  input clk_i;
  wire [1:0] data_o;
  reg data_o_1_sv2v_reg,data_o_0_sv2v_reg;
  assign data_o[1] = data_o_1_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(1'b1) begin
      data_o_1_sv2v_reg <= data_i[1];
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bsg_tag_client_unsync_width_p2
(
  data_async_r_o,
  bsg_tag_i_clk_,
  bsg_tag_i_op_,
  bsg_tag_i_param_,
  bsg_tag_i_en_
);

  output [1:0] data_async_r_o;
  input bsg_tag_i_clk_;
  input bsg_tag_i_op_;
  input bsg_tag_i_param_;
  input bsg_tag_i_en_;
  wire [1:0] data_async_r_o,tag_data_n;
  wire op_r;
  wire [1:1] tag_data_shift;
  reg op_r_sv2v_reg,tag_data_shift_1_sv2v_reg;
  assign op_r = op_r_sv2v_reg;
  assign tag_data_shift[1] = tag_data_shift_1_sv2v_reg;

  bsg_mux2_gatestack_width_p2_harden_p1
  tag_data_mux
  (
    .i0(data_async_r_o),
    .i1({ tag_data_shift[1:1], data_async_r_o[1:1] }),
    .i2({ op_r, op_r }),
    .o(tag_data_n)
  );


  bsg_dff_width_p2_harden_p1
  tag_data_reg
  (
    .clk_i(bsg_tag_i_clk_),
    .data_i(tag_data_n),
    .data_o(data_async_r_o)
  );


  always @(posedge bsg_tag_i_clk_) begin
    if(1'b1) begin
      op_r_sv2v_reg <= bsg_tag_i_op_;
      tag_data_shift_1_sv2v_reg <= bsg_tag_i_param_;
    end 
  end


endmodule



module bsg_mux2_gatestack_width_p3_harden_p1
(
  i0,
  i1,
  i2,
  o
);

  input [2:0] i0;
  input [2:0] i1;
  input [2:0] i2;
  output [2:0] o;
  wire [2:0] o;
  wire N0,N1,N2,N3,N4,N5;
  assign o[0] = (N0)? i1[0] : 
                (N3)? i0[0] : 1'b0;
  assign N0 = i2[0];
  assign o[1] = (N1)? i1[1] : 
                (N4)? i0[1] : 1'b0;
  assign N1 = i2[1];
  assign o[2] = (N2)? i1[2] : 
                (N5)? i0[2] : 1'b0;
  assign N2 = i2[2];
  assign N3 = ~i2[0];
  assign N4 = ~i2[1];
  assign N5 = ~i2[2];

endmodule



module bsg_dff_width_p3_harden_p1
(
  clk_i,
  data_i,
  data_o
);

  input [2:0] data_i;
  output [2:0] data_o;
  input clk_i;
  wire [2:0] data_o;
  reg data_o_2_sv2v_reg,data_o_1_sv2v_reg,data_o_0_sv2v_reg;
  assign data_o[2] = data_o_2_sv2v_reg;
  assign data_o[1] = data_o_1_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(1'b1) begin
      data_o_2_sv2v_reg <= data_i[2];
      data_o_1_sv2v_reg <= data_i[1];
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bsg_sync_sync_unit
(
  oclk_i,
  iclk_data_i,
  oclk_data_o
);

  input oclk_i;
  input iclk_data_i;
  output oclk_data_o;
  wire oclk_data_o,bsg_SYNC_1_r,bsg_SYNC_2_n;

  sky130_fd_sc_hd__dfxtp_1
  hard_sync_int1_BSG_SYNC
  (
    .CLK(oclk_i),
    .D(iclk_data_i),
    .Q(bsg_SYNC_1_r)
  );


  sky130_fd_sc_hd__buf_1
  hard_sync_buf_BSG_DONT_TOUCH
  (
    .o(bsg_SYNC_2_n),
    .i(bsg_SYNC_1_r)
  );


  sky130_fd_sc_hd__dfxtp_1
  hard_sync_int2_BSG_SYNC
  (
    .CLK(oclk_i),
    .D(bsg_SYNC_2_n),
    .Q(oclk_data_o)
  );


endmodule



module bsg_launch_sync_sync_posedge_1_unit
(
  iclk_i,
  iclk_reset_i,
  oclk_i,
  iclk_data_i,
  iclk_data_o,
  oclk_data_o
);

  input [0:0] iclk_data_i;
  output [0:0] iclk_data_o;
  output [0:0] oclk_data_o;
  input iclk_i;
  input iclk_reset_i;
  input oclk_i;
  wire [0:0] iclk_data_o,oclk_data_o;
  reg iclk_data_o_0_sv2v_reg;
  assign iclk_data_o[0] = iclk_data_o_0_sv2v_reg;

  bsg_sync_sync_unit
  \bss_unit_0_.bss1 
  (
    .oclk_i(oclk_i),
    .iclk_data_i(iclk_data_o[0]),
    .oclk_data_o(oclk_data_o[0])
  );


  always @(posedge iclk_i) begin
    if(iclk_reset_i) begin
      iclk_data_o_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      iclk_data_o_0_sv2v_reg <= iclk_data_i[0];
    end 
  end


endmodule



module bsg_launch_sync_sync_width_p1
(
  iclk_i,
  iclk_reset_i,
  oclk_i,
  iclk_data_i,
  iclk_data_o,
  oclk_data_o
);

  input [0:0] iclk_data_i;
  output [0:0] iclk_data_o;
  output [0:0] oclk_data_o;
  input iclk_i;
  input iclk_reset_i;
  input oclk_i;
  wire [0:0] iclk_data_o,oclk_data_o;

  bsg_launch_sync_sync_posedge_1_unit
  \sync.p.z.blss 
  (
    .iclk_i(iclk_i),
    .iclk_reset_i(iclk_reset_i),
    .oclk_i(oclk_i),
    .iclk_data_i(iclk_data_i[0]),
    .iclk_data_o(iclk_data_o[0]),
    .oclk_data_o(oclk_data_o[0])
  );


endmodule



module bsg_dff_en_width_p3_harden_p1
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [2:0] data_i;
  output [2:0] data_o;
  input clk_i;
  input en_i;
  wire [2:0] data_o;
  reg data_o_2_sv2v_reg,data_o_1_sv2v_reg,data_o_0_sv2v_reg;
  assign data_o[2] = data_o_2_sv2v_reg;
  assign data_o[1] = data_o_1_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(en_i) begin
      data_o_2_sv2v_reg <= data_i[2];
      data_o_1_sv2v_reg <= data_i[1];
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bsg_tag_client_width_p3
(
  recv_clk_i,
  recv_new_r_o,
  recv_data_r_o,
  bsg_tag_i_clk_,
  bsg_tag_i_op_,
  bsg_tag_i_param_,
  bsg_tag_i_en_
);

  output [2:0] recv_data_r_o;
  input recv_clk_i;
  input bsg_tag_i_clk_;
  input bsg_tag_i_op_;
  input bsg_tag_i_param_;
  input bsg_tag_i_en_;
  output recv_new_r_o;
  wire [2:0] recv_data_r_o,tag_data_shift,tag_data_n;
  wire recv_new_r_o,op_r,op_r_r,reset_op,no_op,send_now,_3_net_,tag_toggle_r,
  recv_toggle_n,recv_toggle_r,recv_new,recv_new_r,recv_new_r_r,N0,N1,N2,N3;
  wire [0:0] tag_data_r;
  reg op_r_sv2v_reg,tag_data_shift_2_sv2v_reg,op_r_r_sv2v_reg,recv_toggle_r_sv2v_reg,
  recv_new_r_sv2v_reg,recv_new_r_r_sv2v_reg;
  assign op_r = op_r_sv2v_reg;
  assign tag_data_shift[2] = tag_data_shift_2_sv2v_reg;
  assign op_r_r = op_r_r_sv2v_reg;
  assign recv_toggle_r = recv_toggle_r_sv2v_reg;
  assign recv_new_r = recv_new_r_sv2v_reg;
  assign recv_new_r_r = recv_new_r_r_sv2v_reg;

  bsg_mux2_gatestack_width_p3_harden_p1
  tag_data_mux
  (
    .i0({ tag_data_shift[1:0], tag_data_r[0:0] }),
    .i1(tag_data_shift),
    .i2({ op_r, op_r, op_r }),
    .o(tag_data_n)
  );


  bsg_dff_width_p3_harden_p1
  tag_data_reg
  (
    .clk_i(bsg_tag_i_clk_),
    .data_i(tag_data_n),
    .data_o({ tag_data_shift[1:0], tag_data_r[0:0] })
  );


  bsg_launch_sync_sync_width_p1
  blss
  (
    .iclk_i(bsg_tag_i_clk_),
    .iclk_reset_i(reset_op),
    .oclk_i(recv_clk_i),
    .iclk_data_i(_3_net_),
    .iclk_data_o(tag_toggle_r),
    .oclk_data_o(recv_toggle_n)
  );


  bsg_dff_en_width_p3_harden_p1
  recv
  (
    .clk_i(recv_clk_i),
    .data_i({ tag_data_shift[1:0], tag_data_r[0:0] }),
    .en_i(recv_new_r),
    .data_o(recv_data_r_o)
  );

  assign reset_op = N0 & tag_data_shift[2];
  assign N0 = ~op_r;
  assign no_op = N1 & N2;
  assign N1 = ~op_r;
  assign N2 = ~tag_data_shift[2];
  assign send_now = op_r_r & no_op;
  assign _3_net_ = tag_toggle_r ^ send_now;
  assign recv_new = N3 & bsg_tag_i_en_;
  assign N3 = recv_toggle_r ^ recv_toggle_n;
  assign recv_new_r_o = recv_new_r_r & bsg_tag_i_en_;

  always @(posedge bsg_tag_i_clk_) begin
    if(1'b1) begin
      op_r_sv2v_reg <= bsg_tag_i_op_;
      tag_data_shift_2_sv2v_reg <= bsg_tag_i_param_;
      op_r_r_sv2v_reg <= op_r;
    end 
  end


  always @(posedge recv_clk_i) begin
    if(1'b1) begin
      recv_toggle_r_sv2v_reg <= recv_toggle_n;
      recv_new_r_sv2v_reg <= recv_new;
      recv_new_r_r_sv2v_reg <= recv_new_r;
    end 
  end


endmodule



module bsg_mux2_gatestack_width_p1_harden_p1
(
  i0,
  i1,
  i2,
  o
);

  input [0:0] i0;
  input [0:0] i1;
  input [0:0] i2;
  output [0:0] o;
  wire [0:0] o;
  wire N0,N1;
  assign o[0] = (N0)? i1[0] : 
                (N1)? i0[0] : 1'b0;
  assign N0 = i2[0];
  assign N1 = ~i2[0];

endmodule



module bsg_dff_width_p1_harden_p1
(
  clk_i,
  data_i,
  data_o
);

  input [0:0] data_i;
  output [0:0] data_o;
  input clk_i;
  wire [0:0] data_o;
  reg data_o_0_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(1'b1) begin
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bsg_tag_client_unsync_width_p1
(
  data_async_r_o,
  bsg_tag_i_clk_,
  bsg_tag_i_op_,
  bsg_tag_i_param_,
  bsg_tag_i_en_
);

  output [0:0] data_async_r_o;
  input bsg_tag_i_clk_;
  input bsg_tag_i_op_;
  input bsg_tag_i_param_;
  input bsg_tag_i_en_;
  wire [0:0] data_async_r_o,tag_data_shift,tag_data_n;
  wire op_r;
  reg op_r_sv2v_reg,tag_data_shift_0_sv2v_reg;
  assign op_r = op_r_sv2v_reg;
  assign tag_data_shift[0] = tag_data_shift_0_sv2v_reg;

  bsg_mux2_gatestack_width_p1_harden_p1
  tag_data_mux
  (
    .i0(data_async_r_o[0]),
    .i1(tag_data_shift[0]),
    .i2(op_r),
    .o(tag_data_n[0])
  );


  bsg_dff_width_p1_harden_p1
  tag_data_reg
  (
    .clk_i(bsg_tag_i_clk_),
    .data_i(tag_data_n[0]),
    .data_o(data_async_r_o[0])
  );


  always @(posedge bsg_tag_i_clk_) begin
    if(1'b1) begin
      op_r_sv2v_reg <= bsg_tag_i_op_;
      tag_data_shift_0_sv2v_reg <= bsg_tag_i_param_;
    end 
  end


endmodule



module bsg_dff_en_width_p1_harden_p1
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [0:0] data_i;
  output [0:0] data_o;
  input clk_i;
  input en_i;
  wire [0:0] data_o;
  reg data_o_0_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(en_i) begin
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bsg_tag_client_width_p1
(
  recv_clk_i,
  recv_new_r_o,
  recv_data_r_o,
  bsg_tag_i_clk_,
  bsg_tag_i_op_,
  bsg_tag_i_param_,
  bsg_tag_i_en_
);

  output [0:0] recv_data_r_o;
  input recv_clk_i;
  input bsg_tag_i_clk_;
  input bsg_tag_i_op_;
  input bsg_tag_i_param_;
  input bsg_tag_i_en_;
  output recv_new_r_o;
  wire [0:0] recv_data_r_o,tag_data_shift,tag_data_r,tag_data_n;
  wire recv_new_r_o,op_r,op_r_r,reset_op,no_op,send_now,_3_net_,tag_toggle_r,
  recv_toggle_n,recv_toggle_r,recv_new,recv_new_r,recv_new_r_r,N0,N1,N2,N3;
  reg op_r_sv2v_reg,tag_data_shift_0_sv2v_reg,op_r_r_sv2v_reg,recv_toggle_r_sv2v_reg,
  recv_new_r_sv2v_reg,recv_new_r_r_sv2v_reg;
  assign op_r = op_r_sv2v_reg;
  assign tag_data_shift[0] = tag_data_shift_0_sv2v_reg;
  assign op_r_r = op_r_r_sv2v_reg;
  assign recv_toggle_r = recv_toggle_r_sv2v_reg;
  assign recv_new_r = recv_new_r_sv2v_reg;
  assign recv_new_r_r = recv_new_r_r_sv2v_reg;

  bsg_mux2_gatestack_width_p1_harden_p1
  tag_data_mux
  (
    .i0(tag_data_r[0]),
    .i1(tag_data_shift[0]),
    .i2(op_r),
    .o(tag_data_n[0])
  );


  bsg_dff_width_p1_harden_p1
  tag_data_reg
  (
    .clk_i(bsg_tag_i_clk_),
    .data_i(tag_data_n[0]),
    .data_o(tag_data_r[0])
  );


  bsg_launch_sync_sync_width_p1
  blss
  (
    .iclk_i(bsg_tag_i_clk_),
    .iclk_reset_i(reset_op),
    .oclk_i(recv_clk_i),
    .iclk_data_i(_3_net_),
    .iclk_data_o(tag_toggle_r),
    .oclk_data_o(recv_toggle_n)
  );


  bsg_dff_en_width_p1_harden_p1
  recv
  (
    .clk_i(recv_clk_i),
    .data_i(tag_data_r[0]),
    .en_i(recv_new_r),
    .data_o(recv_data_r_o[0])
  );

  assign reset_op = N0 & tag_data_shift[0];
  assign N0 = ~op_r;
  assign no_op = N1 & N2;
  assign N1 = ~op_r;
  assign N2 = ~tag_data_shift[0];
  assign send_now = op_r_r & no_op;
  assign _3_net_ = tag_toggle_r ^ send_now;
  assign recv_new = N3 & bsg_tag_i_en_;
  assign N3 = recv_toggle_r ^ recv_toggle_n;
  assign recv_new_r_o = recv_new_r_r & bsg_tag_i_en_;

  always @(posedge bsg_tag_i_clk_) begin
    if(1'b1) begin
      op_r_sv2v_reg <= bsg_tag_i_op_;
      tag_data_shift_0_sv2v_reg <= bsg_tag_i_param_;
      op_r_r_sv2v_reg <= op_r;
    end 
  end


  always @(posedge recv_clk_i) begin
    if(1'b1) begin
      recv_toggle_r_sv2v_reg <= recv_toggle_n;
      recv_new_r_sv2v_reg <= recv_new;
      recv_new_r_r_sv2v_reg <= recv_new_r;
    end 
  end


endmodule



module bsg_mux2_gatestack_width_p5_harden_p1
(
  i0,
  i1,
  i2,
  o
);

  input [4:0] i0;
  input [4:0] i1;
  input [4:0] i2;
  output [4:0] o;
  wire [4:0] o;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9;
  assign o[0] = (N0)? i1[0] : 
                (N5)? i0[0] : 1'b0;
  assign N0 = i2[0];
  assign o[1] = (N1)? i1[1] : 
                (N6)? i0[1] : 1'b0;
  assign N1 = i2[1];
  assign o[2] = (N2)? i1[2] : 
                (N7)? i0[2] : 1'b0;
  assign N2 = i2[2];
  assign o[3] = (N3)? i1[3] : 
                (N8)? i0[3] : 1'b0;
  assign N3 = i2[3];
  assign o[4] = (N4)? i1[4] : 
                (N9)? i0[4] : 1'b0;
  assign N4 = i2[4];
  assign N5 = ~i2[0];
  assign N6 = ~i2[1];
  assign N7 = ~i2[2];
  assign N8 = ~i2[3];
  assign N9 = ~i2[4];

endmodule



module bsg_dff_width_p5_harden_p1
(
  clk_i,
  data_i,
  data_o
);

  input [4:0] data_i;
  output [4:0] data_o;
  input clk_i;
  wire [4:0] data_o;
  reg data_o_4_sv2v_reg,data_o_3_sv2v_reg,data_o_2_sv2v_reg,data_o_1_sv2v_reg,
  data_o_0_sv2v_reg;
  assign data_o[4] = data_o_4_sv2v_reg;
  assign data_o[3] = data_o_3_sv2v_reg;
  assign data_o[2] = data_o_2_sv2v_reg;
  assign data_o[1] = data_o_1_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(1'b1) begin
      data_o_4_sv2v_reg <= data_i[4];
      data_o_3_sv2v_reg <= data_i[3];
      data_o_2_sv2v_reg <= data_i[2];
      data_o_1_sv2v_reg <= data_i[1];
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bsg_tag_client_unsync_width_p5
(
  data_async_r_o,
  bsg_tag_i_clk_,
  bsg_tag_i_op_,
  bsg_tag_i_param_,
  bsg_tag_i_en_
);

  output [4:0] data_async_r_o;
  input bsg_tag_i_clk_;
  input bsg_tag_i_op_;
  input bsg_tag_i_param_;
  input bsg_tag_i_en_;
  wire [4:0] data_async_r_o,tag_data_n;
  wire op_r;
  wire [4:4] tag_data_shift;
  reg op_r_sv2v_reg,tag_data_shift_4_sv2v_reg;
  assign op_r = op_r_sv2v_reg;
  assign tag_data_shift[4] = tag_data_shift_4_sv2v_reg;

  bsg_mux2_gatestack_width_p5_harden_p1
  tag_data_mux
  (
    .i0(data_async_r_o),
    .i1({ tag_data_shift[4:4], data_async_r_o[4:1] }),
    .i2({ op_r, op_r, op_r, op_r, op_r }),
    .o(tag_data_n)
  );


  bsg_dff_width_p5_harden_p1
  tag_data_reg
  (
    .clk_i(bsg_tag_i_clk_),
    .data_i(tag_data_n),
    .data_o(data_async_r_o)
  );


  always @(posedge bsg_tag_i_clk_) begin
    if(1'b1) begin
      op_r_sv2v_reg <= bsg_tag_i_op_;
      tag_data_shift_4_sv2v_reg <= bsg_tag_i_param_;
    end 
  end


endmodule



module bsg_decode_num_out_p25
(
  i,
  o
);

  input [4:0] i;
  output [24:0] o;
  wire [24:0] o;
  assign o = { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1 } << i;

endmodule



module bsg_rp_clk_gen_osc_v3_row
(
  async_reset_neg_i,
  async_set_neg_i,
  clkgate_i,
  clkdly_i,
  clkfb_i,
  ctl_i,
  clk_o
);

  input async_reset_neg_i;
  input async_set_neg_i;
  input clkgate_i;
  input clkdly_i;
  input clkfb_i;
  input ctl_i;
  output clk_o;
  wire clk_o,hibit,lobit,ctl_r,ctl_en,fb;

  sky130_fd_sc_hd__conb_1
  T0
  (
    .HI(hibit),
    .LO(lobit)
  );


  sky130_fd_sc_hd__dfbbp_1
  D0
  (
    .Q(ctl_r),
    .CLK(clkgate_i),
    .D(ctl_i),
    .RESET_B(async_reset_neg_i),
    .SET_B(async_set_neg_i)
  );


  sky130_fd_sc_hd__nand2_1
  N0
  (
    .Y(ctl_en),
    .A(clkdly_i),
    .B(ctl_r)
  );


  sky130_fd_sc_hd__nand2_1
  N1
  (
    .Y(fb),
    .A(clkfb_i),
    .B(hibit)
  );


  sky130_fd_sc_hd__nand2_1
  N2
  (
    .Y(clk_o),
    .A(fb),
    .B(ctl_en)
  );


endmodule



module bsg_rp_clk_gen_osc_v3_col
(
  async_reset_i,
  clkgate_i,
  clkdly_i,
  clkfb_i,
  ctl_one_hot_i,
  clk_o
);

  input [4:0] ctl_one_hot_i;
  input async_reset_i;
  input clkgate_i;
  input clkdly_i;
  input clkfb_i;
  output clk_o;
  wire clk_o,lobit,clkgate_inv,clkdly_inv;
  wire [4:1] clkfb;
  wire [0:0] async_reset_neg_li,async_set_neg_li;

  sky130_fd_sc_hd__conb_1
  T0
  (
    .HI(async_reset_neg_li[0]),
    .LO(lobit)
  );


  sky130_fd_sc_hd__inv_1
  I0
  (
    .Y(clkgate_inv),
    .A(clkgate_i)
  );


  sky130_fd_sc_hd__inv_1
  I1
  (
    .Y(clkdly_inv),
    .A(clkdly_i)
  );


  sky130_fd_sc_hd__inv_1
  I2
  (
    .Y(async_set_neg_li[0]),
    .A(async_reset_i)
  );


  bsg_rp_clk_gen_osc_v3_row
  row_0_BSG_DONT_TOUCH
  (
    .async_reset_neg_i(async_reset_neg_li[0]),
    .async_set_neg_i(async_set_neg_li[0]),
    .clkgate_i(clkgate_inv),
    .clkdly_i(clkdly_inv),
    .clkfb_i(clkfb_i),
    .ctl_i(ctl_one_hot_i[0]),
    .clk_o(clkfb[1])
  );


  bsg_rp_clk_gen_osc_v3_row
  row_1_BSG_DONT_TOUCH
  (
    .async_reset_neg_i(async_set_neg_li[0]),
    .async_set_neg_i(async_reset_neg_li[0]),
    .clkgate_i(clkgate_inv),
    .clkdly_i(clkdly_inv),
    .clkfb_i(clkfb[1]),
    .ctl_i(ctl_one_hot_i[1]),
    .clk_o(clkfb[2])
  );


  bsg_rp_clk_gen_osc_v3_row
  row_2_BSG_DONT_TOUCH
  (
    .async_reset_neg_i(async_set_neg_li[0]),
    .async_set_neg_i(async_reset_neg_li[0]),
    .clkgate_i(clkgate_inv),
    .clkdly_i(clkdly_inv),
    .clkfb_i(clkfb[2]),
    .ctl_i(ctl_one_hot_i[2]),
    .clk_o(clkfb[3])
  );


  bsg_rp_clk_gen_osc_v3_row
  row_3_BSG_DONT_TOUCH
  (
    .async_reset_neg_i(async_set_neg_li[0]),
    .async_set_neg_i(async_reset_neg_li[0]),
    .clkgate_i(clkgate_inv),
    .clkdly_i(clkdly_inv),
    .clkfb_i(clkfb[3]),
    .ctl_i(ctl_one_hot_i[3]),
    .clk_o(clkfb[4])
  );


  bsg_rp_clk_gen_osc_v3_row
  row_4_BSG_DONT_TOUCH
  (
    .async_reset_neg_i(async_set_neg_li[0]),
    .async_set_neg_i(async_reset_neg_li[0]),
    .clkgate_i(clkgate_inv),
    .clkdly_i(clkdly_inv),
    .clkfb_i(clkfb[4]),
    .ctl_i(ctl_one_hot_i[4]),
    .clk_o(clk_o)
  );


endmodule



module bsg_rp_clk_gen_osc_v3
(
  async_reset_i,
  trigger_i,
  ctl_one_hot_i,
  clk_o
);

  input [24:0] ctl_one_hot_i;
  input async_reset_i;
  input trigger_i;
  output clk_o;
  wire clk_o,hibit,lobit,async_reset_neg,fb_inv,fb_dly,fb_gate,gate_en_sync_1_r,
  gate_en_sync_2_r,fb_gated;
  wire [2:0] n;
  wire [5:1] fb_col;

  sky130_fd_sc_hd__conb_1
  T0
  (
    .HI(hibit),
    .LO(lobit)
  );


  sky130_fd_sc_hd__inv_1
  I0
  (
    .Y(async_reset_neg),
    .A(async_reset_i)
  );


  sky130_fd_sc_hd__clkinv_1
  I1
  (
    .Y(fb_inv),
    .A(fb_col[5])
  );


  sky130_fd_sc_hd__nand2_1
  N0
  (
    .Y(n[0]),
    .A(fb_inv),
    .B(async_reset_neg)
  );


  sky130_fd_sc_hd__clkbuf_2
  B0
  (
    .X(n[1]),
    .A(n[0])
  );


  sky130_fd_sc_hd__clkbuf_2
  B1
  (
    .X(n[2]),
    .A(n[1])
  );


  sky130_fd_sc_hd__buf_1
  fb_dly_BSG_DONT_TOUCH
  (
    .o(fb_dly),
    .i(n[2])
  );


  sky130_fd_sc_hd__clkinv_4
  I2
  (
    .Y(clk_o),
    .A(fb_dly)
  );


  sky130_fd_sc_hd__clkinv_4
  I3
  (
    .Y(fb_gate),
    .A(fb_dly)
  );


  sky130_fd_sc_hd__dfxtp_1
  S1
  (
    .D(trigger_i),
    .CLK(fb_gate),
    .Q(gate_en_sync_1_r)
  );


  sky130_fd_sc_hd__dfxtp_1
  S2
  (
    .D(gate_en_sync_1_r),
    .CLK(fb_gate),
    .Q(gate_en_sync_2_r)
  );


  sky130_fd_sc_hd__dlclkp_1
  CG0
  (
    .GCLK(fb_gated),
    .CLK(fb_gate),
    .GATE(gate_en_sync_2_r)
  );


  bsg_rp_clk_gen_osc_v3_col
  col_0_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .clkgate_i(fb_gated),
    .clkdly_i(fb_dly),
    .clkfb_i(1'b0),
    .ctl_one_hot_i(ctl_one_hot_i[4:0]),
    .clk_o(fb_col[1])
  );


  bsg_rp_clk_gen_osc_v3_col
  col_1_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .clkgate_i(fb_gated),
    .clkdly_i(fb_dly),
    .clkfb_i(fb_col[1]),
    .ctl_one_hot_i(ctl_one_hot_i[9:5]),
    .clk_o(fb_col[2])
  );


  bsg_rp_clk_gen_osc_v3_col
  col_2_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .clkgate_i(fb_gated),
    .clkdly_i(fb_dly),
    .clkfb_i(fb_col[2]),
    .ctl_one_hot_i(ctl_one_hot_i[14:10]),
    .clk_o(fb_col[3])
  );


  bsg_rp_clk_gen_osc_v3_col
  col_3_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .clkgate_i(fb_gated),
    .clkdly_i(fb_dly),
    .clkfb_i(fb_col[3]),
    .ctl_one_hot_i(ctl_one_hot_i[19:15]),
    .clk_o(fb_col[4])
  );


  bsg_rp_clk_gen_osc_v3_col
  col_4_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .clkgate_i(fb_gated),
    .clkdly_i(fb_dly),
    .clkfb_i(fb_col[4]),
    .ctl_one_hot_i(ctl_one_hot_i[24:20]),
    .clk_o(fb_col[5])
  );


endmodule



module bsg_clk_gen_osc_v3_num_taps_p25
(
  async_reset_i,
  clk_o,
  bsg_tag_trigger_i_clk_,
  bsg_tag_trigger_i_op_,
  bsg_tag_trigger_i_param_,
  bsg_tag_trigger_i_en_,
  bsg_tag_i_clk_,
  bsg_tag_i_op_,
  bsg_tag_i_param_,
  bsg_tag_i_en_
);

  input async_reset_i;
  input bsg_tag_trigger_i_clk_;
  input bsg_tag_trigger_i_op_;
  input bsg_tag_trigger_i_param_;
  input bsg_tag_trigger_i_en_;
  input bsg_tag_i_clk_;
  input bsg_tag_i_op_;
  input bsg_tag_i_param_;
  input bsg_tag_i_en_;
  output clk_o;
  wire clk_o,trigger_r;
  wire [4:0] ctl_r;
  wire [24:0] ctl_one_hot_lo;

  bsg_tag_client_unsync_width_p1
  btc_clkgate
  (
    .data_async_r_o(trigger_r),
    .bsg_tag_i_clk_(bsg_tag_trigger_i_clk_),
    .bsg_tag_i_op_(bsg_tag_trigger_i_op_),
    .bsg_tag_i_param_(bsg_tag_trigger_i_param_),
    .bsg_tag_i_en_(bsg_tag_trigger_i_en_)
  );


  bsg_tag_client_unsync_width_p5
  btc_ctl
  (
    .data_async_r_o(ctl_r),
    .bsg_tag_i_clk_(bsg_tag_i_clk_),
    .bsg_tag_i_op_(bsg_tag_i_op_),
    .bsg_tag_i_param_(bsg_tag_i_param_),
    .bsg_tag_i_en_(bsg_tag_i_en_)
  );


  bsg_decode_num_out_p25
  decode
  (
    .i(ctl_r),
    .o(ctl_one_hot_lo)
  );


  bsg_rp_clk_gen_osc_v3
  osc_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .trigger_i(trigger_r),
    .ctl_one_hot_i(ctl_one_hot_lo),
    .clk_o(clk_o)
  );


endmodule



module bsg_dff_width_p1_harden_p0_strength_p2
(
  clk_i,
  data_i,
  data_o
);

  input [0:0] data_i;
  output [0:0] data_o;
  input clk_i;
  wire [0:0] data_o;
  reg data_o_0_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(1'b1) begin
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bsg_xnor_width_p2_harden_p1
(
  a_i,
  b_i,
  o
);

  input [1:0] a_i;
  input [1:0] b_i;
  output [1:0] o;
  wire [1:0] o;
  wire N0,N1;
  assign o[1] = ~N0;
  assign N0 = a_i[1] ^ b_i[1];
  assign o[0] = ~N1;
  assign N1 = a_i[0] ^ b_i[0];

endmodule



module bsg_muxi2_gatestack_width_p2_harden_p1
(
  i0,
  i1,
  i2,
  o
);

  input [1:0] i0;
  input [1:0] i1;
  input [1:0] i2;
  output [1:0] o;
  wire [1:0] o;
  wire N0,N1,N2,N3,N4,N5;
  assign N3 = (N0)? i1[0] : 
              (N2)? i0[0] : 1'b0;
  assign N0 = i2[0];
  assign N5 = (N1)? i1[1] : 
              (N4)? i0[1] : 1'b0;
  assign N1 = i2[1];
  assign N2 = ~i2[0];
  assign o[0] = ~N3;
  assign N4 = ~i2[1];
  assign o[1] = ~N5;

endmodule



module bsg_dff_width_p2_harden_p0_strength_p4
(
  clk_i,
  data_i,
  data_o
);

  input [1:0] data_i;
  output [1:0] data_o;
  input clk_i;
  wire [1:0] data_o;
  reg data_o_1_sv2v_reg,data_o_0_sv2v_reg;
  assign data_o[1] = data_o_1_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(1'b1) begin
      data_o_1_sv2v_reg <= data_i[1];
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bsg_nand_width_p2_harden_p1
(
  a_i,
  b_i,
  o
);

  input [1:0] a_i;
  input [1:0] b_i;
  output [1:0] o;
  wire [1:0] o;
  wire N0,N1;
  assign o[1] = ~N0;
  assign N0 = a_i[1] & b_i[1];
  assign o[0] = ~N1;
  assign N1 = a_i[0] & b_i[0];

endmodule



module bsg_nor3_width_p1_harden_p1
(
  a_i,
  b_i,
  c_i,
  o
);

  input [0:0] a_i;
  input [0:0] b_i;
  input [0:0] c_i;
  output [0:0] o;
  wire [0:0] o;
  wire N0,N1;
  assign o[0] = ~N1;
  assign N1 = N0 | c_i[0];
  assign N0 = a_i[0] | b_i[0];

endmodule



module bsg_reduce_width_p2_and_p1_harden_p1
(
  i,
  o
);

  input [1:0] i;
  output o;
  wire o;
  assign o = i[1] & i[0];

endmodule



module bsg_buf_width_p1
(
  i,
  o
);

  input [0:0] i;
  output [0:0] o;
  wire [0:0] o;

  sky130_fd_sc_hd__buf_1
  \macro.genblk1_0_.b 
  (
    .X(o[0]),
    .A(i[0])
  );


endmodule



module bsg_strobe_width_p2_harden_p0
(
  clk_i,
  reset_r_i,
  init_val_r_i,
  strobe_r_o
);

  input [1:0] init_val_r_i;
  input clk_i;
  input reset_r_i;
  output strobe_r_o;
  wire strobe_r_o,strobe_n,new_val,strobe_n_buf;
  wire [0:0] C_n,C_r;
  wire [1:0] S_r,S_n,S_n_n,C_n_prereset;
  reg strobe_r_o_sv2v_reg;
  assign strobe_r_o = strobe_r_o_sv2v_reg;

  bsg_dff_width_p1_harden_p0_strength_p2
  C_reg
  (
    .clk_i(clk_i),
    .data_i(C_n[0]),
    .data_o(C_r[0])
  );


  bsg_xnor_width_p2_harden_p1
  xnor_S_n
  (
    .a_i(S_r),
    .b_i({ C_r[0:0], 1'b1 }),
    .o(S_n)
  );


  bsg_muxi2_gatestack_width_p2_harden_p1
  muxi2_S_n
  (
    .i0(S_n),
    .i1(init_val_r_i),
    .i2({ new_val, new_val }),
    .o(S_n_n)
  );


  bsg_dff_width_p2_harden_p0_strength_p4
  S_reg
  (
    .clk_i(clk_i),
    .data_i(S_n_n),
    .data_o(S_r)
  );


  bsg_nand_width_p2_harden_p1
  nand_C_n
  (
    .a_i(S_r),
    .b_i({ C_r[0:0], 1'b1 }),
    .o(C_n_prereset)
  );


  bsg_nor3_width_p1_harden_p1
  nor3_C_n
  (
    .a_i(strobe_n_buf),
    .b_i(C_n_prereset[0]),
    .c_i(reset_r_i),
    .o(C_n[0])
  );


  bsg_reduce_width_p2_and_p1_harden_p1
  andr
  (
    .i(S_r),
    .o(strobe_n)
  );


  bsg_buf_width_p1
  strobe_buf_gate
  (
    .i(strobe_n),
    .o(strobe_n_buf)
  );

  assign new_val = reset_r_i | strobe_n;

  always @(posedge clk_i) begin
    if(1'b1) begin
      strobe_r_o_sv2v_reg <= strobe_n_buf;
    end 
  end


endmodule



module bsg_counter_clock_downsample_width_p2
(
  clk_i,
  reset_i,
  val_i,
  clk_r_o
);

  input [1:0] val_i;
  input clk_i;
  input reset_i;
  output clk_r_o;
  wire clk_r_o,N0,strobe_r,N1,N2,N3;
  reg clk_r_o_sv2v_reg;
  assign clk_r_o = clk_r_o_sv2v_reg;

  bsg_strobe_width_p2_harden_p0
  strobe
  (
    .clk_i(clk_i),
    .reset_r_i(reset_i),
    .init_val_r_i(val_i),
    .strobe_r_o(strobe_r)
  );

  assign N3 = (N0)? 1'b1 : 
              (N1)? 1'b0 : 1'b0;
  assign N0 = strobe_r;
  assign N1 = ~strobe_r;
  assign N2 = ~clk_r_o;

  always @(posedge clk_i) begin
    if(reset_i) begin
      clk_r_o_sv2v_reg <= 1'b0;
    end else if(N3) begin
      clk_r_o_sv2v_reg <= N2;
    end 
  end


endmodule



module bsg_mux_width_p1_els_p4_harden_p1_balanced_p1
(
  data_i,
  sel_i,
  data_o
);

  input [3:0] data_i;
  input [1:0] sel_i;
  output [0:0] data_o;
  wire [0:0] data_o;

  sky130_fd_sc_hd__mux4_1
  \macro.genblk1_0_.m 
  (
    .X(data_o[0]),
    .A3(data_i[3]),
    .A2(data_i[2]),
    .A1(data_i[1]),
    .A0(data_i[0]),
    .S1(sel_i[1]),
    .S0(sel_i[0])
  );


endmodule



module bsg_rp_dly_line_unit_v3
(
  async_reset_i,
  trigger_i,
  ctl_one_hot_i,
  clk_i,
  clk_o
);

  input [24:0] ctl_one_hot_i;
  input async_reset_i;
  input trigger_i;
  input clk_i;
  output clk_o;
  wire clk_o,hibit,lobit,trigger0,trigger1,trigger2,trigger3,trigger4,trigger,fb_inv,
  gate_en_sync_1_r,gate_en_sync_2_r,fb_gated;
  wire [5:1] fb_col;

  sky130_fd_sc_hd__conb_1
  T0
  (
    .HI(hibit),
    .LO(lobit)
  );


  sky130_fd_sc_hd__dlygate4sd3_1
  B1A
  (
    .X(trigger0),
    .A(trigger_i)
  );


  sky130_fd_sc_hd__dlygate4sd3_1
  B1B
  (
    .X(trigger1),
    .A(trigger0)
  );


  sky130_fd_sc_hd__dlygate4sd3_1
  B1C
  (
    .X(trigger2),
    .A(trigger1)
  );


  sky130_fd_sc_hd__dlygate4sd3_1
  B1D
  (
    .X(trigger3),
    .A(trigger2)
  );


  sky130_fd_sc_hd__dlygate4sd3_1
  B1E
  (
    .X(trigger4),
    .A(trigger3)
  );


  sky130_fd_sc_hd__dlygate4sd3_1
  B1X
  (
    .X(trigger),
    .A(trigger4)
  );


  sky130_fd_sc_hd__clkinv_4
  I0
  (
    .Y(fb_inv),
    .A(clk_i)
  );


  sky130_fd_sc_hd__dfxtp_1
  S1
  (
    .D(trigger),
    .CLK(clk_i),
    .Q(gate_en_sync_1_r)
  );


  sky130_fd_sc_hd__dfxtp_1
  S2
  (
    .D(gate_en_sync_1_r),
    .CLK(clk_i),
    .Q(gate_en_sync_2_r)
  );


  sky130_fd_sc_hd__dlclkp_1
  CG0
  (
    .GCLK(fb_gated),
    .CLK(clk_i),
    .GATE(gate_en_sync_2_r)
  );


  bsg_rp_clk_gen_osc_v3_col
  col_0_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .clkgate_i(fb_gated),
    .clkdly_i(fb_inv),
    .clkfb_i(1'b0),
    .ctl_one_hot_i(ctl_one_hot_i[4:0]),
    .clk_o(fb_col[1])
  );


  bsg_rp_clk_gen_osc_v3_col
  col_1_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .clkgate_i(fb_gated),
    .clkdly_i(fb_inv),
    .clkfb_i(fb_col[1]),
    .ctl_one_hot_i(ctl_one_hot_i[9:5]),
    .clk_o(fb_col[2])
  );


  bsg_rp_clk_gen_osc_v3_col
  col_2_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .clkgate_i(fb_gated),
    .clkdly_i(fb_inv),
    .clkfb_i(fb_col[2]),
    .ctl_one_hot_i(ctl_one_hot_i[14:10]),
    .clk_o(fb_col[3])
  );


  bsg_rp_clk_gen_osc_v3_col
  col_3_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .clkgate_i(fb_gated),
    .clkdly_i(fb_inv),
    .clkfb_i(fb_col[3]),
    .ctl_one_hot_i(ctl_one_hot_i[19:15]),
    .clk_o(fb_col[4])
  );


  bsg_rp_clk_gen_osc_v3_col
  col_4_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .clkgate_i(fb_gated),
    .clkdly_i(fb_inv),
    .clkfb_i(fb_col[4]),
    .ctl_one_hot_i(ctl_one_hot_i[24:20]),
    .clk_o(fb_col[5])
  );


  sky130_fd_sc_hd__clkbuf_4
  B0
  (
    .X(clk_o),
    .A(fb_col[5])
  );


endmodule



module bsg_rp_dly_line_ctl_reg
(
  clk_i,
  async_reset_neg,
  async_set_neg,
  shift_right,
  shift_left,
  counter_en,
  ctl_m1,
  ctl_p1,
  ctl_o
);

  input clk_i;
  input async_reset_neg;
  input async_set_neg;
  input shift_right;
  input shift_left;
  input counter_en;
  input ctl_m1;
  input ctl_p1;
  output ctl_o;
  wire ctl_o,set_right,set_left,set,ctl_n;

  sky130_fd_sc_hd__and2_1
  A0
  (
    .A(shift_right),
    .B(ctl_m1),
    .X(set_right)
  );


  sky130_fd_sc_hd__and2_1
  A1
  (
    .A(shift_left),
    .B(ctl_p1),
    .X(set_left)
  );


  sky130_fd_sc_hd__or2_1
  O0
  (
    .A(set_left),
    .B(set_right),
    .X(set)
  );


  sky130_fd_sc_hd__mux2_1
  M0
  (
    .X(ctl_n),
    .S(counter_en),
    .A0(ctl_o),
    .A1(set)
  );


  sky130_fd_sc_hd__dfbbp_1
  D0
  (
    .Q(ctl_o),
    .CLK(clk_i),
    .D(ctl_n),
    .RESET_B(async_reset_neg),
    .SET_B(async_set_neg)
  );


endmodule



module bsg_rp_dly_line_v3
(
  async_reset_i,
  clk_i,
  clk_o
);

  input async_reset_i;
  input clk_i;
  output clk_o;
  wire clk_o,hibit,lobit,async_reset_neg,trigger_off,trigger_on,counter_en,pause,
  clk_dly,meta,meta_sync,meta_sync_sync,meta_sync_sync_inv;
  wire [24:0] ctl_r;
  wire [2:0] n;

  sky130_fd_sc_hd__conb_1
  T0
  (
    .HI(hibit),
    .LO(lobit)
  );


  sky130_fd_sc_hd__inv_1
  I0
  (
    .Y(async_reset_neg),
    .A(async_reset_i)
  );


  sky130_fd_sc_hd__dfstp_2
  D0
  (
    .Q(trigger_off),
    .CLK(clk_i),
    .D(trigger_on),
    .SET_B(async_reset_neg)
  );


  sky130_fd_sc_hd__dfrtp_2
  D1
  (
    .Q(counter_en),
    .CLK(clk_i),
    .D(trigger_off),
    .RESET_B(async_reset_neg)
  );


  sky130_fd_sc_hd__dfrtp_2
  D2
  (
    .Q(pause),
    .CLK(clk_i),
    .D(counter_en),
    .RESET_B(async_reset_neg)
  );


  sky130_fd_sc_hd__dfrtp_2
  D3
  (
    .Q(trigger_on),
    .CLK(clk_i),
    .D(pause),
    .RESET_B(async_reset_neg)
  );


  bsg_rp_dly_line_unit_v3
  d90_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .trigger_i(trigger_on),
    .ctl_one_hot_i(ctl_r),
    .clk_i(clk_i),
    .clk_o(clk_o)
  );


  bsg_rp_dly_line_unit_v3
  d180_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .trigger_i(trigger_on),
    .ctl_one_hot_i(ctl_r),
    .clk_i(clk_o),
    .clk_o(n[0])
  );


  sky130_fd_sc_hd__clkbuf_1
  B0
  (
    .X(n[1]),
    .A(n[0])
  );


  sky130_fd_sc_hd__clkbuf_1
  B1
  (
    .X(n[2]),
    .A(n[1])
  );


  sky130_fd_sc_hd__buf_1
  clk_dly_BSG_DONT_TOUCH
  (
    .o(clk_dly),
    .i(n[2])
  );


  sky130_fd_sc_hd__dfrtn_1
  meta_r
  (
    .Q(meta),
    .CLK_N(clk_i),
    .RESET_B(async_reset_neg),
    .D(clk_dly)
  );


  sky130_fd_sc_hd__dfrbp_1
  bsg_SYNC_1_r
  (
    .Q(meta_sync),
    .CLK(clk_i),
    .D(meta),
    .RESET_B(async_reset_neg)
  );


  sky130_fd_sc_hd__dfrbp_1
  bsg_SYNC_2_r
  (
    .Q(meta_sync_sync),
    .Q_N(meta_sync_sync_inv),
    .CLK(clk_i),
    .D(meta_sync),
    .RESET_B(async_reset_neg)
  );


  bsg_rp_dly_line_ctl_reg
  ctl_0
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[0]),
    .ctl_p1(ctl_r[1]),
    .ctl_o(ctl_r[0])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_1
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[0]),
    .ctl_p1(ctl_r[2]),
    .ctl_o(ctl_r[1])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_2
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[1]),
    .ctl_p1(ctl_r[3]),
    .ctl_o(ctl_r[2])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_3
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[2]),
    .ctl_p1(ctl_r[4]),
    .ctl_o(ctl_r[3])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_4
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[3]),
    .ctl_p1(ctl_r[5]),
    .ctl_o(ctl_r[4])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_5
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[4]),
    .ctl_p1(ctl_r[6]),
    .ctl_o(ctl_r[5])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_6
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[5]),
    .ctl_p1(ctl_r[7]),
    .ctl_o(ctl_r[6])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_7
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[6]),
    .ctl_p1(ctl_r[8]),
    .ctl_o(ctl_r[7])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_8
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[7]),
    .ctl_p1(ctl_r[9]),
    .ctl_o(ctl_r[8])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_9
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[8]),
    .ctl_p1(ctl_r[10]),
    .ctl_o(ctl_r[9])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_10
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[9]),
    .ctl_p1(ctl_r[11]),
    .ctl_o(ctl_r[10])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_11
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[10]),
    .ctl_p1(ctl_r[12]),
    .ctl_o(ctl_r[11])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_12
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[11]),
    .ctl_p1(ctl_r[13]),
    .ctl_o(ctl_r[12])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_13
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[12]),
    .ctl_p1(ctl_r[14]),
    .ctl_o(ctl_r[13])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_14
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[13]),
    .ctl_p1(ctl_r[15]),
    .ctl_o(ctl_r[14])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_15
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[14]),
    .ctl_p1(ctl_r[16]),
    .ctl_o(ctl_r[15])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_16
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[15]),
    .ctl_p1(ctl_r[17]),
    .ctl_o(ctl_r[16])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_17
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[16]),
    .ctl_p1(ctl_r[18]),
    .ctl_o(ctl_r[17])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_18
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[17]),
    .ctl_p1(ctl_r[19]),
    .ctl_o(ctl_r[18])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_19
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[18]),
    .ctl_p1(ctl_r[20]),
    .ctl_o(ctl_r[19])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_20
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[19]),
    .ctl_p1(ctl_r[21]),
    .ctl_o(ctl_r[20])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_21
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[20]),
    .ctl_p1(ctl_r[22]),
    .ctl_o(ctl_r[21])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_22
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[21]),
    .ctl_p1(ctl_r[23]),
    .ctl_o(ctl_r[22])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_23
  (
    .clk_i(clk_i),
    .async_reset_neg(async_reset_neg),
    .async_set_neg(hibit),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[22]),
    .ctl_p1(ctl_r[24]),
    .ctl_o(ctl_r[23])
  );


  bsg_rp_dly_line_ctl_reg
  ctl_24
  (
    .clk_i(clk_i),
    .async_reset_neg(hibit),
    .async_set_neg(async_reset_neg),
    .shift_right(meta_sync_sync_inv),
    .shift_left(meta_sync_sync_inv),
    .counter_en(counter_en),
    .ctl_m1(ctl_r[23]),
    .ctl_p1(ctl_r[24]),
    .ctl_o(ctl_r[24])
  );


endmodule



module bsg_dmc_dly_line_v3_num_taps_p25
(
  clk_i,
  async_reset_i,
  clk_o
);

  input clk_i;
  input async_reset_i;
  output clk_o;
  wire clk_o;

  bsg_rp_dly_line_v3
  dly_BSG_DONT_TOUCH
  (
    .async_reset_i(async_reset_i),
    .clk_i(clk_i),
    .clk_o(clk_o)
  );


endmodule



module bsg_mux_width_p1_els_p2_harden_p1_balanced_p1
(
  data_i,
  sel_i,
  data_o
);

  input [1:0] data_i;
  input [0:0] sel_i;
  output [0:0] data_o;
  wire [0:0] data_o;

  sky130_fd_sc_hd__mux2_1
  \macro.genblk1_0_.m 
  (
    .X(data_o[0]),
    .A1(data_i[1]),
    .A0(data_i[0]),
    .S(sel_i[0])
  );


endmodule



module bsg_lfsr_div30
(
  clk_i,
  reset_i,
  clk_div_o
);

  input clk_i;
  input reset_i;
  output clk_div_o;
  wire clk_div_o,N0,N1,N2,N3,N4;
  wire [3:0] data_r;
  reg clk_div_o_sv2v_reg,data_r_3_sv2v_reg,data_r_2_sv2v_reg,data_r_1_sv2v_reg,
  data_r_0_sv2v_reg;
  assign clk_div_o = clk_div_o_sv2v_reg;
  assign data_r[3] = data_r_3_sv2v_reg;
  assign data_r[2] = data_r_2_sv2v_reg;
  assign data_r[1] = data_r_1_sv2v_reg;
  assign data_r[0] = data_r_0_sv2v_reg;
  assign N0 = N4 ^ clk_div_o;
  assign N4 = ~N3;
  assign N3 = N2 | data_r[0];
  assign N2 = data_r[2] | data_r[1];
  assign N1 = data_r[0] ^ data_r[3];

  always @(posedge clk_i) begin
    if(reset_i) begin
      clk_div_o_sv2v_reg <= 1'b0;
      data_r_1_sv2v_reg <= 1'b1;
    end else if(1'b1) begin
      clk_div_o_sv2v_reg <= N0;
      data_r_1_sv2v_reg <= data_r[2];
    end 
    if(1'b1) begin
      data_r_3_sv2v_reg <= data_r[0];
      data_r_2_sv2v_reg <= N1;
      data_r_0_sv2v_reg <= data_r[1];
    end 
  end


endmodule



module bsg_counter_clear_up_max_val_p255_init_val_p0_disable_overflow_warning_p1
(
  clk_i,
  reset_i,
  clear_i,
  up_i,
  count_o
);

  output [7:0] count_o;
  input clk_i;
  input reset_i;
  input clear_i;
  input up_i;
  wire [7:0] count_o;
  wire N0,N1,N4,N5,N6,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,N2,N3,N7,N30,
  N21;
  reg count_o_7_sv2v_reg,count_o_6_sv2v_reg,count_o_5_sv2v_reg,count_o_4_sv2v_reg,
  count_o_3_sv2v_reg,count_o_2_sv2v_reg,count_o_1_sv2v_reg,count_o_0_sv2v_reg;
  assign count_o[7] = count_o_7_sv2v_reg;
  assign count_o[6] = count_o_6_sv2v_reg;
  assign count_o[5] = count_o_5_sv2v_reg;
  assign count_o[4] = count_o_4_sv2v_reg;
  assign count_o[3] = count_o_3_sv2v_reg;
  assign count_o[2] = count_o_2_sv2v_reg;
  assign count_o[1] = count_o_1_sv2v_reg;
  assign count_o[0] = count_o_0_sv2v_reg;
  assign N21 = reset_i | clear_i;
  assign { N13, N12, N11, N10, N9, N8, N6, N5 } = count_o + 1'b1;
  assign N14 = (N0)? 1'b1 : 
               (N7)? 1'b1 : 
               (N3)? 1'b0 : 1'b0;
  assign N0 = clear_i;
  assign N16 = (N1)? 1'b1 : 
               (N30)? 1'b0 : 1'b0;
  assign N1 = up_i;
  assign N15 = (N0)? up_i : 
               (N7)? N5 : 1'b0;
  assign N4 = N20;
  assign N17 = ~reset_i;
  assign N18 = ~clear_i;
  assign N19 = N17 & N18;
  assign N20 = up_i & N19;
  assign N2 = up_i | clear_i;
  assign N3 = ~N2;
  assign N7 = up_i & N18;
  assign N30 = ~up_i;

  always @(posedge clk_i) begin
    if(N21) begin
      count_o_7_sv2v_reg <= 1'b0;
      count_o_6_sv2v_reg <= 1'b0;
      count_o_5_sv2v_reg <= 1'b0;
      count_o_4_sv2v_reg <= 1'b0;
      count_o_3_sv2v_reg <= 1'b0;
      count_o_2_sv2v_reg <= 1'b0;
      count_o_1_sv2v_reg <= 1'b0;
    end else if(N16) begin
      count_o_7_sv2v_reg <= N13;
      count_o_6_sv2v_reg <= N12;
      count_o_5_sv2v_reg <= N11;
      count_o_4_sv2v_reg <= N10;
      count_o_3_sv2v_reg <= N9;
      count_o_2_sv2v_reg <= N8;
      count_o_1_sv2v_reg <= N6;
    end 
    if(reset_i) begin
      count_o_0_sv2v_reg <= 1'b0;
    end else if(N14) begin
      count_o_0_sv2v_reg <= N15;
    end 
  end


endmodule



module bsg_buf_width_p8_harden_p1
(
  i,
  o
);

  input [7:0] i;
  output [7:0] o;
  wire [7:0] o;

  sky130_fd_sc_hd__buf_1
  \macro.genblk1_0_.b 
  (
    .X(o[0]),
    .A(i[0])
  );


  sky130_fd_sc_hd__buf_1
  \macro.genblk1_1_.b 
  (
    .X(o[1]),
    .A(i[1])
  );


  sky130_fd_sc_hd__buf_1
  \macro.genblk1_2_.b 
  (
    .X(o[2]),
    .A(i[2])
  );


  sky130_fd_sc_hd__buf_1
  \macro.genblk1_3_.b 
  (
    .X(o[3]),
    .A(i[3])
  );


  sky130_fd_sc_hd__buf_1
  \macro.genblk1_4_.b 
  (
    .X(o[4]),
    .A(i[4])
  );


  sky130_fd_sc_hd__buf_1
  \macro.genblk1_5_.b 
  (
    .X(o[5]),
    .A(i[5])
  );


  sky130_fd_sc_hd__buf_1
  \macro.genblk1_6_.b 
  (
    .X(o[6]),
    .A(i[6])
  );


  sky130_fd_sc_hd__buf_1
  \macro.genblk1_7_.b 
  (
    .X(o[7]),
    .A(i[7])
  );


endmodule



module bsg_clk_dly_gen
(
  ext_clk_i,
  ext_reset_i,
  tag_clk_i,
  tag_en_i,
  tag_data_i,
  osc_clk_o,
  ds_clk_o,
  gen_clk_o,
  dly_clk_o,
  mon_clk_o,
  div_clk_o,
  ds_reset_o,
  mon_reset_o,
  div_count_o
);

  output [7:0] div_count_o;
  input ext_clk_i;
  input ext_reset_i;
  input tag_clk_i;
  input tag_en_i;
  input tag_data_i;
  output osc_clk_o;
  output ds_clk_o;
  output gen_clk_o;
  output dly_clk_o;
  output mon_clk_o;
  output div_clk_o;
  output ds_reset_o;
  output mon_reset_o;
  wire [7:0] div_count_o,div_count_r_lo;
  wire osc_clk_o,ds_clk_o,gen_clk_o,dly_clk_o,mon_clk_o,div_clk_o,ds_reset_o,
  mon_reset_o,tag_clk_buf_lo,_0_net__0_,osc_clk_lo,osc_ds_new_r_lo,mon_reset_new_r_lo,
  div_clk_lo,div_reset_new_r_lo,div_enable_new_r_lo,div_clear_new_r_lo,ds_clk_lo,
  oscmux_lo,dly_clk_lo,monmux_lo;
  wire [0:0] ext_reset_buf_lo,tag_data_buf_lo,tag_en_buf_lo,osc_async_reset_r_lo,
  dly_async_reset_r_lo,mon_sel_r_lo,mon_reset_r_lo,div_reset_r_lo,div_enable_r_lo,
  div_clear_r_lo;
  wire [43:0] tag_lines_lo;
  wire [1:0] osc_sel_r_lo;
  wire [2:0] osc_ds_r_lo;
  wire [2:2] oscmux_li;

  bsg_clkbuf_width_p1_strength_p4_harden_p1
  ext_clkbuf
  (
    .i(ext_clk_i),
    .o(oscmux_li[2])
  );


  bsg_buf_width_p1_harden_p1
  ext_reset_databuf
  (
    .i(ext_reset_i),
    .o(ext_reset_buf_lo[0])
  );


  bsg_clkbuf_width_p1_strength_p4_harden_p1
  tag_clkbuf
  (
    .i(tag_clk_i),
    .o(tag_clk_buf_lo)
  );


  bsg_buf_width_p1_harden_p1
  tag_data_databuf
  (
    .i(tag_data_i),
    .o(tag_data_buf_lo[0])
  );


  bsg_buf_width_p1_harden_p1
  tag_en_databuf
  (
    .i(tag_en_i),
    .o(tag_en_buf_lo[0])
  );


  bsg_tag_master_decentralized_els_p1024_local_els_p11_lg_width_p4
  btm
  (
    .clk_i(tag_clk_buf_lo),
    .data_i(_0_net__0_),
    .node_id_offset_i({ 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 }),
    .clients_o(tag_lines_lo)
  );


  bsg_tag_client_unsync_width_p2
  btc_osc_sel
  (
    .data_async_r_o(osc_sel_r_lo),
    .bsg_tag_i_clk_(tag_lines_lo[19]),
    .bsg_tag_i_op_(tag_lines_lo[18]),
    .bsg_tag_i_param_(tag_lines_lo[17]),
    .bsg_tag_i_en_(tag_lines_lo[16])
  );


  bsg_tag_client_width_p3
  btc_osc_ds
  (
    .recv_clk_i(osc_clk_lo),
    .recv_new_r_o(osc_ds_new_r_lo),
    .recv_data_r_o(osc_ds_r_lo),
    .bsg_tag_i_clk_(tag_lines_lo[15]),
    .bsg_tag_i_op_(tag_lines_lo[14]),
    .bsg_tag_i_param_(tag_lines_lo[13]),
    .bsg_tag_i_en_(tag_lines_lo[12])
  );


  bsg_tag_client_unsync_width_p1
  btc_osc_async_reset
  (
    .data_async_r_o(osc_async_reset_r_lo[0]),
    .bsg_tag_i_clk_(tag_lines_lo[3]),
    .bsg_tag_i_op_(tag_lines_lo[2]),
    .bsg_tag_i_param_(tag_lines_lo[1]),
    .bsg_tag_i_en_(tag_lines_lo[0])
  );


  bsg_tag_client_unsync_width_p1
  btc_dly_async_reset
  (
    .data_async_r_o(dly_async_reset_r_lo[0]),
    .bsg_tag_i_clk_(tag_lines_lo[23]),
    .bsg_tag_i_op_(tag_lines_lo[22]),
    .bsg_tag_i_param_(tag_lines_lo[21]),
    .bsg_tag_i_en_(tag_lines_lo[20])
  );


  bsg_tag_client_unsync_width_p1
  btc_mon_sel
  (
    .data_async_r_o(mon_sel_r_lo[0]),
    .bsg_tag_i_clk_(tag_lines_lo[31]),
    .bsg_tag_i_op_(tag_lines_lo[30]),
    .bsg_tag_i_param_(tag_lines_lo[29]),
    .bsg_tag_i_en_(tag_lines_lo[28])
  );


  bsg_tag_client_width_p1
  btc_mon_reset
  (
    .recv_clk_i(monmux_lo),
    .recv_new_r_o(mon_reset_new_r_lo),
    .recv_data_r_o(mon_reset_r_lo[0]),
    .bsg_tag_i_clk_(tag_lines_lo[27]),
    .bsg_tag_i_op_(tag_lines_lo[26]),
    .bsg_tag_i_param_(tag_lines_lo[25]),
    .bsg_tag_i_en_(tag_lines_lo[24])
  );


  bsg_tag_client_width_p1
  btc_div_reset
  (
    .recv_clk_i(div_clk_lo),
    .recv_new_r_o(div_reset_new_r_lo),
    .recv_data_r_o(div_reset_r_lo[0]),
    .bsg_tag_i_clk_(tag_lines_lo[35]),
    .bsg_tag_i_op_(tag_lines_lo[34]),
    .bsg_tag_i_param_(tag_lines_lo[33]),
    .bsg_tag_i_en_(tag_lines_lo[32])
  );


  bsg_tag_client_width_p1
  btc_div_enable
  (
    .recv_clk_i(div_clk_lo),
    .recv_new_r_o(div_enable_new_r_lo),
    .recv_data_r_o(div_enable_r_lo[0]),
    .bsg_tag_i_clk_(tag_lines_lo[39]),
    .bsg_tag_i_op_(tag_lines_lo[38]),
    .bsg_tag_i_param_(tag_lines_lo[37]),
    .bsg_tag_i_en_(tag_lines_lo[36])
  );


  bsg_tag_client_width_p1
  btc_div_clear
  (
    .recv_clk_i(div_clk_lo),
    .recv_new_r_o(div_clear_new_r_lo),
    .recv_data_r_o(div_clear_r_lo[0]),
    .bsg_tag_i_clk_(tag_lines_lo[43]),
    .bsg_tag_i_op_(tag_lines_lo[42]),
    .bsg_tag_i_param_(tag_lines_lo[41]),
    .bsg_tag_i_en_(tag_lines_lo[40])
  );


  bsg_clk_gen_osc_v3_num_taps_p25
  osc
  (
    .async_reset_i(osc_async_reset_r_lo[0]),
    .clk_o(osc_clk_lo),
    .bsg_tag_trigger_i_clk_(tag_lines_lo[11]),
    .bsg_tag_trigger_i_op_(tag_lines_lo[10]),
    .bsg_tag_trigger_i_param_(tag_lines_lo[9]),
    .bsg_tag_trigger_i_en_(tag_lines_lo[8]),
    .bsg_tag_i_clk_(tag_lines_lo[7]),
    .bsg_tag_i_op_(tag_lines_lo[6]),
    .bsg_tag_i_param_(tag_lines_lo[5]),
    .bsg_tag_i_en_(tag_lines_lo[4])
  );


  bsg_clkbuf_width_p1_strength_p4_harden_p1
  osc_clkbuf
  (
    .i(osc_clk_lo),
    .o(osc_clk_o)
  );


  bsg_counter_clock_downsample_width_p2
  clk_gen_ds_inst
  (
    .clk_i(osc_clk_o),
    .reset_i(osc_ds_r_lo[0]),
    .val_i(osc_ds_r_lo[2:1]),
    .clk_r_o(ds_clk_lo)
  );


  bsg_buf_width_p1_harden_p1
  ds_reset_r_databuf
  (
    .i(osc_ds_r_lo[0]),
    .o(ds_reset_o)
  );


  bsg_clkbuf_width_p1_strength_p4_harden_p1
  ds_clkbuf
  (
    .i(ds_clk_lo),
    .o(ds_clk_o)
  );


  bsg_mux_width_p1_els_p4_harden_p1_balanced_p1
  osc_clkmux
  (
    .data_i({ 1'b0, oscmux_li[2:2], ds_clk_o, osc_clk_o }),
    .sel_i(osc_sel_r_lo),
    .data_o(oscmux_lo)
  );


  bsg_clkbuf_width_p1_strength_p4_harden_p1
  gen_clkbuf
  (
    .i(oscmux_lo),
    .o(gen_clk_o)
  );


  bsg_dmc_dly_line_v3_num_taps_p25
  dly
  (
    .clk_i(osc_clk_o),
    .async_reset_i(dly_async_reset_r_lo[0]),
    .clk_o(dly_clk_lo)
  );


  bsg_clkbuf_width_p1_strength_p4_harden_p1
  dly_clkbuf
  (
    .i(dly_clk_lo),
    .o(dly_clk_o)
  );


  bsg_mux_width_p1_els_p2_harden_p1_balanced_p1
  mon_clkmux
  (
    .data_i({ dly_clk_o, gen_clk_o }),
    .sel_i(mon_sel_r_lo[0]),
    .data_o(monmux_lo)
  );


  bsg_clkbuf_width_p1_strength_p4_harden_p1
  mon_clkbuf
  (
    .i(monmux_lo),
    .o(mon_clk_o)
  );


  bsg_lfsr_div30
  lfsr
  (
    .clk_i(mon_clk_o),
    .reset_i(mon_reset_r_lo[0]),
    .clk_div_o(div_clk_lo)
  );


  bsg_clkbuf_width_p1_strength_p4_harden_p1
  div_clkbuf
  (
    .i(div_clk_lo),
    .o(div_clk_o)
  );


  bsg_buf_width_p1_harden_p1
  mon_reset_r_databuf
  (
    .i(mon_reset_r_lo[0]),
    .o(mon_reset_o)
  );


  bsg_counter_clear_up_max_val_p255_init_val_p0_disable_overflow_warning_p1
  div_counter
  (
    .clk_i(div_clk_lo),
    .reset_i(div_reset_r_lo[0]),
    .clear_i(div_clear_r_lo[0]),
    .up_i(div_enable_r_lo[0]),
    .count_o(div_count_r_lo)
  );


  bsg_buf_width_p8_harden_p1
  div_count_r_databuf
  (
    .i(div_count_r_lo),
    .o(div_count_o)
  );

  assign _0_net__0_ = tag_data_buf_lo[0] & tag_en_buf_lo[0];

endmodule



module tt_um_dpetrisko_ttdll
(
  ui_in,
  uo_out,
  uio_in,
  uio_out,
  uio_oe,
  ena,
  clk,
  rst_n
);

  input [7:0] ui_in;
  output [7:0] uo_out;
  input [7:0] uio_in;
  output [7:0] uio_out;
  output [7:0] uio_oe;
  input ena;
  input clk;
  input rst_n;
  wire [7:0] uo_out,uio_out,uio_oe;
  wire p_ext_reset_i;
  assign uio_oe[0] = 1'b1;
  assign uio_oe[1] = 1'b1;
  assign uio_oe[2] = 1'b1;
  assign uio_oe[3] = 1'b1;
  assign uio_oe[4] = 1'b1;
  assign uio_oe[5] = 1'b1;
  assign uio_oe[6] = 1'b1;
  assign uio_oe[7] = 1'b1;

  bsg_clk_dly_gen
  top
  (
    .ext_clk_i(clk),
    .ext_reset_i(p_ext_reset_i),
    .tag_clk_i(ui_in[0]),
    .tag_en_i(ui_in[1]),
    .tag_data_i(ui_in[2]),
    .osc_clk_o(uo_out[0]),
    .ds_clk_o(uo_out[1]),
    .gen_clk_o(uo_out[2]),
    .dly_clk_o(uo_out[3]),
    .mon_clk_o(uo_out[4]),
    .div_clk_o(uo_out[5]),
    .ds_reset_o(uo_out[6]),
    .mon_reset_o(uo_out[7]),
    .div_count_o(uio_out)
  );

  assign p_ext_reset_i = ~rst_n;

endmodule


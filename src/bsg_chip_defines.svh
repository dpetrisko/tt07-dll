
`ifndef BSG_CHIP_DEFINES_SVH
`define BSG_CHIP_DEFINES_SVH

  `define BSG_TAG_CLIENT_UNSYNC(tag_line_mp, signal_mp, width_mp) \
    logic [width_mp-1:0] ``signal_mp``_r_lo;               \
    bsg_tag_client_unsync #(.width_p(width_mp))            \
    btc_``signal_mp``                                      \
     (.bsg_tag_i(tag_line_mp)                              \
      ,.data_async_r_o(``signal_mp``_r_lo)                 \
      )

  `define BSG_TAG_CLIENT_SYNC(tag_line_mp, signal_mp, width_mp, recv_clk_mp) \
    logic ``signal_mp``_new_r_lo;                          \
    logic [width_mp-1:0] ``signal_mp``_r_lo;               \
    bsg_tag_client #(.width_p(width_mp))                   \
    btc_``signal_mp``                                      \
     (.bsg_tag_i(tag_line_mp)                              \
      ,.recv_clk_i(recv_clk_mp)                            \
      ,.recv_new_r_o(``signal_mp``_new_r_lo)               \
      ,.recv_data_r_o(``signal_mp``_r_lo)                  \
      )

  `define BSG_CLKMUX4(mux_mp) \
    wire [3:0] ``mux_mp``mux_li;                                    \
    wire [1:0] ``mux_mp``mux_sel_li;                                \
    wire ``mux_mp``mux_lo;                                          \
    bsg_mux #(.width_p(1), .els_p(4), .harden_p(1), .balanced_p(1)) \
      ``mux_mp``_clkmux                                             \
      (.data_i(``mux_mp``mux_li)                                    \
       ,.sel_i(``mux_mp``mux_sel_li)                                \
       ,.data_o(``mux_mp``mux_lo)                                   \
       );

  `define BSG_CLKMUX2(mux_mp) \
    wire [1:0] ``mux_mp``mux_li;                                    \
    wire ``mux_mp``mux_sel_li;                                      \
    wire ``mux_mp``mux_lo;                                          \
    bsg_mux #(.width_p(1), .els_p(2), .harden_p(1), .balanced_p(1)) \
      ``mux_mp``_clkmux                                             \
      (.data_i(``mux_mp``mux_li)                                    \
       ,.sel_i(``mux_mp``mux_sel_li)                                \
       ,.data_o(``mux_mp``mux_lo)                                   \
       );

  `define BSG_CLKBUF(clk_mp) \
    wire ``clk_mp``_clk_buf_lo;                             \
    bsg_clkbuf #(.width_p(1), .strength_p(8), .harden_p(1)) \
     ``clk_mp``_clkbuf                                      \
      (.i(``clk_mp``_clk_lo), .o(``clk_mp``_clk_buf_lo))

  `define BSG_DATABUF(data_mp, width_mp) \
    wire [width_mp-1:0] ``data_mp``_buf_lo;         \
    bsg_buf #(.width_p(width_mp), .harden_p(1))     \
     ``data_mp``_databuf                            \
      (.i(``data_mp``_lo), .o(``data_mp``_buf_lo))

`endif


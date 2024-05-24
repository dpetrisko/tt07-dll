
module bsg_nonsynth_delay_line # (parameter width_p=1)

   (input  [width_p-1:0]   i
    , output logic [width_p-1:0] o
    );

`ifdef __openlane__
   assign o = i;
`else
   assign #10 o = i;
`endif

endmodule


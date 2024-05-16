
package bsg_chip_pkg;
  //////////////////////////////////////////////////////////////////////
  //////// Packages
  //////////////////////////////////////////////////////////////////////

    // For bsg_tag_s
    import bsg_tag_pkg::*;
    
  //////////////////////////////////////////////////////////////////////
  //////// Parameters
  //////////////////////////////////////////////////////////////////////
  
    // Maximum number of tag elements in the system
    localparam tag_els_gp = 1024;
    
    // ID width of tag client
    localparam tag_lg_els_gp = 10;
    
    // Max payload width for a tag client
    localparam tag_max_payload_width_gp = 12;
    
    // Length of the max payload width
    localparam tag_lg_width_gp = 4;
    
    // Number of rows for oscillator
    localparam osc_num_rows_gp = 2;
    
    // Number of cols for oscillator
    localparam osc_num_cols_gp = 2;
    
    // Number of taps for oscillator
    localparam osc_num_taps_gp = 4;
    
    // Width of control regs for oscillator
    localparam osc_ctl_width_gp = 2;
    
    // Length of post oscillator buffer chain
    localparam osc_post_buf_gp = 2;
    
    // Width of oscillator downsampler
    localparam osc_ds_width_gp = 2;
    
    // Number of rows for delay line
    localparam dly_num_rows_gp = 2;
    
    // Number of cols for delay line
    localparam dly_num_cols_gp = 2;
    
    // Number of taps for delay line
    localparam dly_num_taps_gp = 4;
    
    // Width of control regs for delay line
    localparam dly_ctl_width_gp = 2;
    
    // Length of post delay buffer chain
    localparam dly_post_buf_gp = 4;
    
    // Width of the digital period approximater
    localparam div_count_width_gp = 8;
    
  //////////////////////////////////////////////////////////////////////
  //////// Clients
  //////////////////////////////////////////////////////////////////////
  
  typedef struct packed
  {
  
    // Selection: 0=osc, 1=dly
    // Width=2
    bsg_tag_s sel;
    
    // Synchronous reset
    // Width=1
    bsg_tag_s reset;
    
  } bsg_chip_mon_tag_lines_s;
  localparam bsg_chip_mon_tag_local_els_gp =
    $bits(bsg_chip_mon_tag_lines_s) / $bits(bsg_tag_s);
    
  typedef struct packed
  {
  
    // Unused placeholder
    // Width=1
    bsg_tag_s unused;
    
  } bsg_chip_dly_tag_lines_s;
  localparam bsg_chip_dly_tag_local_els_gp =
    $bits(bsg_chip_dly_tag_lines_s) / $bits(bsg_tag_s);
    
  typedef struct packed
  {
  
    // Selection: 0=oscillator, 1=downsampler, 2=external, 3=zero
    // Width=2
    bsg_tag_s sel;
    
    // Downsampler width
    // Width=3
    bsg_tag_s ds;
    
    // Trigger for oscillator
    // Width=1
    bsg_tag_s trigger;
    
    // Programmable control for oscillator
    // Width=2
    bsg_tag_s ctl;
    
  } bsg_chip_osc_tag_lines_s;
  localparam bsg_chip_osc_tag_local_els_gp =
    $bits(bsg_chip_osc_tag_lines_s) / $bits(bsg_tag_s);
    
  //////////////////////////////////////////////////////////////////////
  //////// Warning: Danger Zone
  //////// Must set parameters below correctly, else chip may fail
  //////////////////////////////////////////////////////////////////////
  typedef struct packed
  {
  
    bsg_chip_mon_tag_lines_s mon;

    bsg_chip_dly_tag_lines_s dly;

    bsg_chip_osc_tag_lines_s osc;

  } bsg_chip_tag_lines_s;
  localparam bsg_chip_tag_local_els_gp =
    $bits(bsg_chip_tag_lines_s) / $bits(bsg_tag_s);

endpackage


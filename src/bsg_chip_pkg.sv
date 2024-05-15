
package bsg_chip_pkg;
  //////////////////////////////////////////////////////////////////////
  //////// Packages
  //////////////////////////////////////////////////////////////////////

    // For bsg_tag_s
    import bsg_tag_pkg::*;
    
  //////////////////////////////////////////////////////////////////////
  //////// Parameters
  //////////////////////////////////////////////////////////////////////
  
    // Number of rows for oscillator
    localparam osc_num_rows = 2;
    
    // Number of cols for oscillator
    localparam osc_num_cols = 2;
    
    // Number of taps for oscillator
    localparam osc_num_taps = 4;
    
    // Width of control regs for oscillator
    localparam osc_ctl_width = 2;
    
    // Length of post oscillator buffer chain
    localparam osc_post_buf = 2;
    
    // Width of oscillator downsampler
    localparam osc_ds_width = 2;
    
    // Number of rows for delay line
    localparam dly_num_rows = 2;
    
    // Number of cols for delay line
    localparam dly_num_cols = 2;
    
    // Number of taps for delay line
    localparam dly_num_taps = 4;
    
    // Width of control regs for delay line
    localparam dly_ctl_width = 2;
    
    // Length of post delay buffer chain
    localparam dly_post_buf = 4;
    
    // Width of the digital period approximater
    localparam dly_count_width = 8;
    
  //////////////////////////////////////////////////////////////////////
  //////// Clients
  //////////////////////////////////////////////////////////////////////
  
  typedef struct packed
  {
  
    // Programmable control for oscillator
    // Width=2
    bsg_tag_s ctl;
    
    // Trigger for oscillator
    // Width=1
    bsg_tag_s trigger;
    
    // Downsampler width
    // Width=3
    bsg_tag_s ds;
    
    // Selection: 0=oscillator, 1=downsampler, 2=external, 3=zero
    // Width=2
    bsg_tag_s sel;
    
  typedef struct packed
  {
  
    // Unused placeholder
    // Width=1
    bsg_tag_s unused;
    
  typedef struct packed
  {
  
    // Synchronous reset
    // Width=1
    bsg_tag_s reset;
    
    // Selection: 0=osc, 1=dly
    // Width=2
    bsg_tag_s sel;
    
  } bsg_chip_mon_tag_lines_s;
  localparam bsg_chip_mon_tag_local_els_gp =
    $bits(bsg_chip_mon_tag_lines_s) / $bits(bsg_tag_s);
    
  //////////////////////////////////////////////////////////////////////
  //////// Warning: Danger Zone
  //////// Must set parameters below correctly, else chip may fail
  //////////////////////////////////////////////////////////////////////
  typedef struct packed
  {
  
    bsg_chip_osc_tag_lines_s osc;

    bsg_chip_dly_tag_lines_s dly;

    bsg_chip_mon_tag_lines_s mon;

  } bsg_chip_tag_lines_s;
  localparam bsg_chip_tag_local_els_gp =
    $bits(bsg_chip_tag_lines_s) / $bits(bsg_tag_s);

endpackage


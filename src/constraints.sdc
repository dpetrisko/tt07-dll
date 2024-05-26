
set ext_name "clk"

set clk_name "clk_gen"
set clk_gen_period_int 10; # 100 MHz
set clk_gen_period_ext 10; # 100 MHz
set clk_gen_period_ds [expr $clk_gen_period_int * 2.0]
set clk_uncertainty 0.25

#create_clock -period $clk_gen_period_int -name ${clk_name}_osc [get_pins -of_objects [get_cells *osc_BSG_DONT_TOUCH.I2] -filter "direction==output"]
#set_clock_uncertainty $clk_uncertainty [get_clocks ${clk_name}_osc]
#
#create_clock -period $clk_gen_period_int -name ${clk_name}_ds [get_pins -of_objects [get_cells *ds_clkbuf.macro.genblk1_0_.b] -filter "direction==output"]
#set_clock_uncertainty $clk_uncertainty [get_clocks ${clk_name}_ds]
#
create_clock -period $clk_gen_period_ext -name ${clk_name} [get_pins -of_objects [get_cells *gen_clkbuf.macro.genblk1_0_.b] -filter "direction==output"]
set_clock_uncertainty $clk_uncertainty [get_clocks ${clk_name}]

set_false_path -setup -to [get_pins -of_objects [get_cells *hard_sync_int2_BSG_SYNC] -filter "name==D"]
set_false_path -hold -to [get_pins -of_objects [get_cells *hard_sync_int2_BSG_SYNC] -filter "name==D"]

set dly_name "dly_gen"
set dly_gen_period_int 10; # 100 MHz
set dly_gen_period_ext 10; # 100 MHz
set dly_gen_period_ds [expr $dly_gen_period_int * 2.0]
set dly_uncertainty 0.25

create_clock -period $dly_gen_period_int -name ${dly_name} [get_pins -of_objects [get_cells *dly_clkbuf.macro.genblk1_0_.b] -filter "direction==output"]
set_clock_uncertainty $dly_uncertainty [get_clocks ${dly_name}]

set_false_path -setup -to [get_pins -of_objects [get_cells *dly_BSG_DONT_TOUCH.meta_r] -filter "name==D"]
set_false_path -hold -to [get_pins -of_objects [get_cells *dly_BSG_DONT_TOUCH.meta_r] -filter "name==D"]

set_clock_groups -asynchronous -group "${ext_name}" -group "${clk_name}" -group "${dly_name}"


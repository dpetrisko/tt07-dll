# Based on https://yosyshq.net/yosys/
yosys -import
plugin -i systemverilog
yosys -import

set pdk_root $::env(PDK_ROOT)
set pdk $::env(PDK)
set proj_dir $::env(PROJ_ROOT)
set basejump_stl_dir $::env(BASEJUMP_STL_DIR)
set techmap_dir ${pdk_root}/${pdk}/libs.tech
set pdk_type $::env(PDK_TYPE)
source ${techmap_dir}/openlane/config.tcl
set lib_file $::env(LIB_SYNTH)

set tiehi_cell       ${pdk_type}__conb_1
set tiehi_pin        HI
set tielo_cell       ${pdk_type}__conb_1
set tielo_pin        LO
set clkbuf_cell      ${pdk_type}__clkbuf_1
set clkbuf_pin       X
set buf_cell         ${pdk_type}__buf_1
set buf_ipin         A
set buf_opin         X

set design tt_um_dpetrisko_ttdll
set json_file ${design}.json
set verilog_v_file ${design}.sv2v.v
set elab_v_file ${design}.elab.v
set opt_v_file ${design}.opt.v
set map_v_file ${design}.map.v
set syn_v_file ${design}.syn.v

set check_file check.rpt
set stat_file stat.rpt

set use_synlig $::env(USE_SYNLIG)

if {${use_synlig} == 1} {
    systemverilog_defaults -add "-I${proj_dir}/src"
    systemverilog_defaults -add "-I${proj_dir}/src/basejump_stl/bsg_clk_gen"
    systemverilog_defaults -add "-I${proj_dir}/src/basejump_stl/bsg_misc"
    systemverilog_defaults -add "-I${proj_dir}/src/basejump_stl/bsg_tag"
    
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_tag/bsg_tag_pkg.sv"
    
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_misc/bsg_counter_clear_up.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_misc/bsg_counter_clock_downsample.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_misc/bsg_decode.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_misc/bsg_dff_en.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_misc/bsg_dff.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_misc/bsg_mux2_gatestack.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_misc/bsg_muxi2_gatestack.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_misc/bsg_nor3.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_misc/bsg_nand.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_misc/bsg_reduce.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_misc/bsg_strobe.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_misc/bsg_xnor.sv"
    
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_tag/bsg_tag_client.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_tag/bsg_tag_client_unsync.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/bsg_tag/bsg_tag_master_decentralized.sv"
    
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/hard/sky_130/bsg_async/bsg_launch_sync_sync.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/hard/sky_130/bsg_async/bsg_sync_sync.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/hard/sky_130/bsg_async/bsg_sync_sync_async_reset_unit.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/hard/sky_130/bsg_async/bsg_sync_sync_unit.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/hard/sky_130/bsg_clk_gen/bsg_clk_gen_osc_v3.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/hard/sky_130/bsg_dmc/bsg_dmc_dly_line_v3.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/hard/sky_130/bsg_misc/bsg_buf.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/hard/sky_130/bsg_misc/bsg_clkbuf.sv"
    read_systemverilog -defer "${proj_dir}/src/basejump_stl/hard/sky_130/bsg_misc/bsg_mux.sv"
    
    read_systemverilog -defer "${proj_dir}/src/bsg_chip_pkg.sv"
    read_systemverilog -defer "${proj_dir}/src/bsg_rp_clk_gen_osc_unit_v3.sv"
    read_systemverilog -defer "${proj_dir}/src/bsg_rp_clk_gen_osc_v3.sv"
    read_systemverilog -defer "${proj_dir}/src/bsg_rp_dly_line_v3.sv"
    read_systemverilog -defer "${proj_dir}/src/bsg_lfsr_div30.sv"
    read_systemverilog -defer "${proj_dir}/src/bsg_clk_dly_gen.sv"
    read_systemverilog -defer "${proj_dir}/src/project.v"
    
    read_systemverilog -link --top-module ${design}
} else {
    verilog_defaults -add "-I${proj_dir}/src"
    
    read_verilog -sv ${proj_dir}/src/sv2v_build/tt_um_dpetrisko_ttdll.sv2v.v
    read_verilog -sv ${proj_dir}/src/bsg_nonsynth_delay_line.sv
}

# keep rp groups
setattr -mod -set keep 1 {\bsg_rp_clk_gen_osc_v3}
setattr -mod -set keep 1 {\bsg_rp_clk_gen_osc_v3_col}
setattr -mod -set keep 1 {\bsg_rp_clk_gen_osc_v3_row}
setattr -mod -set keep 1 {\bsg_rp_dly_line_ctl_reg}
setattr -mod -set keep 1 {\bsg_rp_dly_line_unit_v3}
setattr -mod -set keep 1 {\bsg_rp_dly_line_v3}

# write verilog design
write_verilog -nostr -noattr -noexpr -nohex -nodec ${verilog_v_file}

# elaborate design hierarchy
hierarchy -generate -check -top ${design}

# write elab design
write_verilog -nostr -noattr -noexpr -nohex -nodec ${elab_v_file}

# write json
yosys proc; write_json ${json_file}

# the high-level stuff
yosys opt; fsm; opt; yosys memory; opt

# write opt design
write_verilog -nostr -noattr -noexpr -nohex -nodec ${opt_v_file}

# mapping to internal cell library
techmap; opt
techmap -map ${techmap_dir}/openlane/${pdk_type}/csa_map.v
techmap -map ${techmap_dir}/openlane/${pdk_type}/fa_map.v
techmap -map ${techmap_dir}/openlane/${pdk_type}/latch_map.v
techmap -map ${techmap_dir}/openlane/${pdk_type}/mux2_map.v
techmap -map ${techmap_dir}/openlane/${pdk_type}/mux4_map.v
techmap -map ${techmap_dir}/openlane/${pdk_type}/rca_map.v
techmap -map ${techmap_dir}/openlane/${pdk_type}/tribuff_map.v

# mapping to cell lib
dfflibmap -liberty ${lib_file}

# write mapped design
write_verilog -nostr -noattr -noexpr -nohex -nodec ${map_v_file}

# mapping logic to cell lib
abc -liberty ${lib_file}

# Set X to zero
setundef -zero

# mapping constants and clock buffers to cell lib
hilomap -hicell ${tiehi_cell} ${tiehi_pin} -locell ${tielo_cell} ${tielo_pin}
clkbufmap -buf ${clkbuf_cell} ${clkbuf_pin}

# Split nets to single bits and map to buffers
splitnets
insbuf -buf ${buf_cell} ${buf_ipin} ${buf_opin}

# Clean up the design
opt_clean -purge

# Check and print statistics
tee -o ${check_file} check -mapped -noinit
tee -o ${stat_file} stat -top ${design} -liberty ${lib_file} -tech cmos -width -json

# write synthesized design
write_verilog -nostr -noattr -noexpr -nohex -nodec ${syn_v_file}


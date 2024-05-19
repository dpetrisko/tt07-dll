# Setup environment
TOP := $(PWD)/../..
include $(TOP)/Makefile.common

# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../src
TEST_DIR = $(PWD)/../test

ifeq ($(RTL_HARD),yes)
SIM := verilator
# RTL Hard simulation:
SIM_BUILD        = sim_build/rtl_hard

VERILOG_SOURCES += $(TEST_DIR)/config.vlt

VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_tag/bsg_tag_pkg.sv

VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_decode.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_counter_clear_up.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_counter_clock_downsample.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_dff_en.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_dff.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_mux2_gatestack.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_muxi2_gatestack.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_nor3.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_nand.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_reduce.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_strobe.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_xnor.sv

VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_tag/bsg_tag_client.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_tag/bsg_tag_client_unsync.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_tag/bsg_tag_master_decentralized.sv

VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_async/bsg_launch_sync_sync.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_async/bsg_sync_sync.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_async/bsg_sync_sync_async_reset_unit.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_async/bsg_sync_sync_unit.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_clk_gen/bsg_clk_gen_osc_v3.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_dmc/bsg_dmc_dly_line_v3.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_misc/bsg_buf.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_misc/bsg_clkbuf.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_misc/bsg_mux.sv

VERILOG_SOURCES += $(SRC_DIR)/bsg_chip_pkg.sv
VERILOG_SOURCES += $(SRC_DIR)/bsg_rp_clk_gen_osc_unit_v3.sv
VERILOG_SOURCES += $(SRC_DIR)/bsg_rp_clk_gen_osc_v3.sv
VERILOG_SOURCES += $(SRC_DIR)/bsg_rp_dly_line_v3.sv
VERILOG_SOURCES += $(SRC_DIR)/bsg_lfsr_div30.sv
VERILOG_SOURCES += $(SRC_DIR)/bsg_clk_dly_gen.sv
VERILOG_SOURCES += $(SRC_DIR)/project.v

#VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v

COMPILE_ARGS    += -sv
COMPILE_ARGS    += --trace-fst
COMPILE_ARGS    += --trace-structs
COMPILE_ARGS    += --trace-depth 10
COMPILE_ARGS    += --timing
COMPILE_ARGS    += -I$(SRC_DIR)
COMPILE_ARGS    += -I$(SRC_DIR)/basejump_stl/bsg_clk_gen
COMPILE_ARGS    += -I$(SRC_DIR)/basejump_stl/bsg_misc
COMPILE_ARGS    += -I$(SRC_DIR)/basejump_stl/bsg_tag
COMPILE_ARGS    += -DBSG_OSC_GRANULARITY=20
COMPILE_ARGS    += -DUNIT_DELAY="\#1"
COMPILE_ARGS    += -DFUNCTIONAL


PLUSARGS        += --trace
PLUSARGS        += --trace-file tb.fst

view:
	surfer tb.fst &

else ifeq ($(GATES),yes)

SIM := iverilog
# Gate level simulation:
SIM_BUILD        = sim_build/gl
COMPILE_ARGS    += -DGL_TEST
COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DUSE_POWER_PINS
COMPILE_ARGS    += -DSIM
COMPILE_ARGS    += -DUNIT_DELAY=\#1
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v

# this gets copied in by the GDS action workflow
VERILOG_SOURCES += $(PWD)/gate_level_netlist.v

else
SIM := verilator
# RTL simulation:
SIM_BUILD        = sim_build/rtl

VERILOG_SOURCES += $(TEST_DIR)/config.vlt

VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_tag/bsg_tag_pkg.sv
VERILOG_SOURCES += $(SRC_DIR)/bsg_chip_pkg.sv

VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_async/bsg_launch_sync_sync.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_clk_gen/bsg_clk_gen_osc_v3.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_dmc/bsg_dmc_dly_line_v3.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_buf.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_clkbuf.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_mux.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_tag/bsg_tag_client.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_tag/bsg_tag_client_unsync.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_tag/bsg_tag_master_decentralized.sv
VERILOG_SOURCES += $(SRC_DIR)/bsg_clk_dly_gen.sv
VERILOG_SOURCES += $(SRC_DIR)/bsg_lfsr_div30.sv
VERILOG_SOURCES += $(SRC_DIR)/project.v

COMPILE_ARGS    += -sv
COMPILE_ARGS    += --trace-fst
COMPILE_ARGS    += --trace-structs
COMPILE_ARGS    += --trace-depth 10
COMPILE_ARGS    += --timing
COMPILE_ARGS    += -I$(SRC_DIR)
COMPILE_ARGS    += -I$(SRC_DIR)/basejump_stl/bsg_clk_gen
COMPILE_ARGS    += -I$(SRC_DIR)/basejump_stl/bsg_misc
COMPILE_ARGS    += -I$(SRC_DIR)/basejump_stl/bsg_tag
COMPILE_ARGS    += -DBSG_OSC_GRANULARITY=20

PLUSARGS        += --trace
PLUSARGS        += --trace-file tb.fst

view:
	surfer tb.fst &

endif

# Include the testbench sources:
VERILOG_SOURCES += $(PWD)/tb.v 
TOPLEVEL = tb

# MODULE is the basename of the Python test file
MODULE = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../src
TEST_DIR = $(PWD)/../test

ifneq ($(GATES),yes)
SIM ?= verilator

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
VERILOG_SOURCES += $(SRC_DIR)/bsg_clk_dly_gen.sv
VERILOG_SOURCES += $(SRC_DIR)/bsg_lfsr_div30.sv

VERILOG_SOURCES += $(SRC_DIR)/project.v

COMPILE_ARGS    += -sv
COMPILE_ARGS    += --trace
COMPILE_ARGS    += --trace-structs
COMPILE_ARGS    += --timing
COMPILE_ARGS    += -I$(SRC_DIR)
COMPILE_ARGS    += -I$(SRC_DIR)/basejump_stl/bsg_clk_gen
COMPILE_ARGS    += -I$(SRC_DIR)/basejump_stl/bsg_misc
COMPILE_ARGS    += -I$(SRC_DIR)/basejump_stl/bsg_tag
COMPILE_ARGS    += -DBSG_OSC_GRANULARITY=20

PLUSARGS        += --trace
PLUSARGS        += --trace-file=tb.vcd

else

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

endif

# Include the testbench sources:
VERILOG_SOURCES += $(PWD)/tb.v 
TOPLEVEL = tb

# MODULE is the basename of the Python test file
MODULE = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

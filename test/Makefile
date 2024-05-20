# Setup environment
TOP := $(PWD)/../..
include $(TOP)/Makefile.common

# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info
SIM := vcs

# defaults
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../src
TEST_DIR = $(PWD)/../test

VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_tag/bsg_tag_pkg.sv
VERILOG_SOURCES += $(SRC_DIR)/bsg_chip_pkg.sv

VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_counter_clear_up.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_counter_clock_downsample.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_decode.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_dff.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_dff_en.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_mux2_gatestack.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_muxi2_gatestack.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_nor3.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_nand.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_reduce.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_strobe.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/bsg_misc/bsg_xnor.sv

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

ifeq ($(RTL_HARD),yes)
# RTL Hard simulation:
SIM_BUILD        = sim_build/rtl_hard

FILTER_OUT = $(foreach v,$(2),$(if $(findstring $(1),$(v)),,$(v)))

VERILOG_SOURCES := $(call FILTER_OUT,bsg_launch_sync_sync.sv,$(VERILOG_SOURCES))
VERILOG_SOURCES := $(call FILTER_OUT,bsg_sync_sync.sv,$(VERILOG_SOURCES))
VERILOG_SOURCES := $(call FILTER_OUT,bsg_sync_sync_async_reset_unit.sv,$(VERILOG_SOURCES))
VERILOG_SOURCES := $(call FILTER_OUT,bsg_sync_sync_unit.sv,$(VERILOG_SOURCES))
VERILOG_SOURCES := $(call FILTER_OUT,bsg_clk_gen_osc_v3.sv,$(VERILOG_SOURCES))
VERILOG_SOURCES := $(call FILTER_OUT,bsg_dmc_dly_line_v3.sv,$(VERILOG_SOURCES))
VERILOG_SOURCES := $(call FILTER_OUT,bsg_buf.sv,$(VERILOG_SOURCES))
VERILOG_SOURCES := $(call FILTER_OUT,bsg_clkbuf.sv,$(VERILOG_SOURCES))
VERILOG_SOURCES := $(call FILTER_OUT,bsg_mux.sv,$(VERILOG_SOURCES))

VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_async/bsg_launch_sync_sync.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_async/bsg_sync_sync.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_async/bsg_sync_sync_async_reset_unit.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_async/bsg_sync_sync_unit.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_clk_gen/bsg_clk_gen_osc_v3.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_dmc/bsg_dmc_dly_line_v3.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_misc/bsg_buf.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_misc/bsg_clkbuf.sv
VERILOG_SOURCES += $(SRC_DIR)/basejump_stl/hard/sky_130/bsg_misc/bsg_mux.sv

VERILOG_SOURCES += $(SRC_DIR)/bsg_rp_clk_gen_osc_unit_v3.sv
VERILOG_SOURCES += $(SRC_DIR)/bsg_rp_clk_gen_osc_v3.sv
VERILOG_SOURCES += $(SRC_DIR)/bsg_rp_dly_line_v3.sv

VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v

COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DSIM

else ifeq ($(GATES),yes)

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

# RTL sim
else
# RTL simulation:
SIM_BUILD        = sim_build/rtl

endif

ifeq ($(SIM),verilator)

VERILOG_SOURCES += $(TEST_DIR)/config.vlt

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
view: tb.fst
	surfer $< &

else ifeq ($(SIM),vcs)

VCS_BIN_DIR := $(VCS_BIN)

COMPILE_ARGS    += -full64
COMPILE_ARGS    += -sverilog
COMPILE_ARGS    += +v2k
COMPILE_ARGS    += +noportcoerce
COMPILE_ARGS    += +incdir+$(SRC_DIR)
COMPILE_ARGS    += +incdir+$(SRC_DIR)/basejump_stl/bsg_clk_gen
COMPILE_ARGS    += +incdir+$(SRC_DIR)/basejump_stl/bsg_misc
COMPILE_ARGS    += +incdir+$(SRC_DIR)/basejump_stl/bsg_tag

ifeq ($(RTL_HARD),yes)
COMPILE_ARGS    += +notimingcheck
COMPILE_ARGS    += +nospecify
endif

PLUSARGS        += +vcs+vcdpluson
PLUSARGS        += +vcs+vcdplusautoflushon
PLUSARGS        += +vcs+dumpfile+tb.vpd

view: vcdplus.vpd
	$(DVE) -full64 -vpd $< &

endif

# Include the testbench sources:
VERILOG_SOURCES += $(PWD)/tb.v 
TOPLEVEL = tb

# MODULE is the basename of the Python test file
MODULE = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim


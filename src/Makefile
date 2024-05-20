# Setup environment
TOP := $(PWD)/../..
include $(TOP)/Makefile.common

PYTHON ?= python

HARD ?= basejump_stl/hard/sky_130
HARD_CLK ?= $(HARD)/bsg_clk_gen
HARD_DMC ?= $(HARD)/bsg_dmc

all: bsg_rp_clk_gen_osc_v3.sv bsg_rp_clk_gen_osc_unit_v3.sv bsg_rp_dly_line_v3.sv

bsg_chip_pkg.sv: bsg_chip_pkg.py
	$(PYTHON) $< --gentype=pkg > $@

bsg_rp_clk_gen_osc_unit_v3.sv: basejump_stl/hard/sky_130/bsg_clk_gen/bsg_rp_clk_gen_osc_unit_v3.py bsg_chip_pkg.sv
	$(PYTHON) $< \
		$(shell $(PYTHON) bsg_chip_pkg.py --gentype=param --par=osc_num_rows) \
		$(shell $(PYTHON) bsg_chip_pkg.py --gentype=param --par=osc_num_cols) \
		$(shell $(PYTHON) bsg_chip_pkg.py --gentype=param --par=osc_post_buf) \
		> $@

bsg_rp_clk_gen_osc_v3.sv: basejump_stl/hard/sky_130/bsg_clk_gen/bsg_rp_clk_gen_osc_v3.py bsg_chip_pkg.sv
	$(PYTHON) $< \
		$(shell $(PYTHON) bsg_chip_pkg.py --gentype=param --par=osc_num_rows) \
		$(shell $(PYTHON) bsg_chip_pkg.py --gentype=param --par=osc_num_cols) \
		$(shell $(PYTHON) bsg_chip_pkg.py --gentype=param --par=osc_post_buf) \
		> $@

bsg_rp_dly_line_v3.sv: basejump_stl/hard/sky_130/bsg_dmc/bsg_rp_dly_line_v3.py bsg_chip_pkg.sv
	$(PYTHON) $< \
		$(shell $(PYTHON) bsg_chip_pkg.py --gentype=param --par=dly_num_rows) \
		$(shell $(PYTHON) bsg_chip_pkg.py --gentype=param --par=dly_num_cols) \
		$(shell $(PYTHON) bsg_chip_pkg.py --gentype=param --par=dly_post_buf) \
		> $@

SYN_DIR ?= syn_build

$(SYN_DIR)/output.syn.v: yosys.tcl all
	mkdir -p $(SYN_DIR)
	cp $< $(@D)
	cd $(SYN_DIR); \
		yosys -c $<

synth: $(SYN_DIR)/output.syn.v

clean:
	rm -rf slpp_all/
	rm -f bsg_chip_pkg.sv
	rm -f bsg_rp_clk_gen_osc_v3.sv
	rm -f bsg_rp_clk_gen_osc_unit_v3.sv
	rm -f bsg_rp_dly_line_v3.sv
	rm -f check.rpt
	rm -f output.elab.v
	rm -f output.map.v
	rm -f output.opt.v
	rm -f output.sv2v.v
	rm -f output.syn.v
	rm -f stat.rpt


# Setup environment
TOP := $(PWD)/../..
include $(TOP)/Makefile.common

SRC_DIR = $(PWD)/../src
TEST_DIR = $(PWD)/../test

PYTHON ?= python

HARD ?= basejump_stl/hard/sky_130
HARD_CLK ?= $(HARD)/bsg_clk_gen
HARD_DMC ?= $(HARD)/bsg_dmc

RP_FILES := bsg_rp_clk_gen_osc_v3.sv bsg_rp_clk_gen_osc_unit_v3.sv bsg_rp_dly_line_v3.sv

all: $(RP_FILES)

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

$(SYN_DIR)/output.syn.v: yosys.tcl $(RP_FILES)
	mkdir -p $(SYN_DIR)
	cp $< $(@D)
	cd $(SYN_DIR); \
		yosys -c $<

synth: $(SYN_DIR)/output.syn.v

SV2V_DIR ?= sv2v_build

$(BSG_SV2V_DIR)/cmd.txt: $(SRC_DIR)/flist.txt $(RP_FILES)
	cat $< | envsubst > $@

$(SV2V_DIR)/tt_um_dpetrisko_ttdll.sv2v.v: $(BSG_SV2V_DIR)/cmd.txt
	mkdir -p $(SV2V_DIR)
	$(MAKE) -C $(BSG_SV2V_DIR) clean convert_sv2v DESIGN_NAME=tt_um_dpetrisko_ttdll DESIGN_FILELIST=$<
	cp $(BSG_SV2V_DIR)/results/$(@F) $@

sv2v: $(SV2V_DIR)/tt_um_dpetrisko_ttdll.sv2v.v

clean:
	rm -rf __pycache__/
	rm -rf slpp_all/
	rm -f bsg_chip_pkg.sv
	rm -f bsg_rp_clk_gen_osc_v3.sv
	rm -f bsg_rp_clk_gen_osc_unit_v3.sv
	rm -f bsg_rp_dly_line_v3.sv
	rm -rf $(SYN_DIR)
	rm -f check.rpt
	rm -f output.elab.v
	rm -f output.map.v
	rm -f output.opt.v
	rm -f output.sv2v.v
	rm -f output.syn.v
	rm -f stat.rpt
	rm -f *_patched*
	rm -f user_config.tcl
	rm -rf sv2v_build


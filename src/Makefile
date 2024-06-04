# Setup environment
TOP ?= $(shell git rev-parse --show-toplevel)
TT_ROOT := $(TOP)/..
include $(TT_ROOT)/Makefile.common

PYTHON ?= python

HARD ?= basejump_stl/hard/sky_130
HARD_CLK ?= $(HARD)/bsg_clk_gen
HARD_DMC ?= $(HARD)/bsg_dmc

RP_FILES := bsg_rp_clk_gen_osc_v3.sv bsg_rp_clk_gen_osc_unit_v3.sv bsg_rp_dly_line_v3.sv

all: sv2v

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

ifeq ($(USE_SYNLIG),1)

$(SV2V_RESULT)/$(TT_NAME).sv2v.v: yosys.tcl $(RP_FILES)
	mkdir -p $(SV2V_RESULT)
	cp $< $(@D)
	cd $(SV2V_RESULT); \
		$(YOSYS) -c $<

else

$(SV2V_RESULT)/cmd.txt: $(SRC_DIR)/flist.txt $(RP_FILES)
	mkdir -p $(SV2V_RESULT)
	cat $< | envsubst > $@

$(SV2V_RESULT)/$(TT_NAME).sv2v.v: $(SV2V_RESULT)/cmd.txt
	$(MAKE) -C $(BSG_SV2V_DIR) clean convert_sv2v DESIGN_NAME=$(TT_NAME) DESIGN_FILELIST=$<
	cp $(BSG_SV2V_DIR)/results/$(@F) $@

endif

sv2v: $(SV2V_RESULT)/$(TT_NAME).sv2v.v
	cp $< project.sv2v.v

clean:
	rm -rf __pycache__/
	rm -rf slpp_all/
	rm -f bsg_chip_pkg.sv
	rm -f bsg_rp_clk_gen_osc_v3.sv
	rm -f bsg_rp_clk_gen_osc_unit_v3.sv
	rm -f bsg_rp_dly_line_v3.sv
	rm -rf $(SV2V_RESULT)
	rm -f check.rpt
	rm -f output.elab.v
	rm -f output.map.v
	rm -f output.opt.v
	rm -f output.sv2v.v
	rm -f output.syn.v
	rm -f stat.rpt
	rm -f *_patched*
	rm -f user_config.tcl


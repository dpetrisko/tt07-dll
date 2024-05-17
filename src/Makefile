
PYTHON ?= python

HARD ?= basejump_stl/hard/sky_130
HARD_CLK ?= $(HARD)/bsg_clk_gen
HARD_DMC ?= $(HARD)/bsg_dmc

BSG_CHIP_SCRIPT ?= bsg_chip_pkg.py

bsg_rp_clk_gen_osc_unit_v3.sv: basejump_stl/hard/sky_130/bsg_clk_gen/bsg_rp_clk_gen_osc_unit_v3.py $(BSG_CHIP_SCRIPT) 
	$(PYTHON) $< \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=osc_num_rows) \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=osc_num_cols) \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=osc_post_buf) \
		> $@

bsg_rp_clk_gen_osc_v3.sv: basejump_stl/hard/sky_130/bsg_clk_gen/bsg_rp_clk_gen_osc_v3.py $(BSG_CHIP_SCRIPT)
	$(PYTHON) $< \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=osc_num_rows) \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=osc_num_cols) \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=osc_post_buf) \
		> $@

bsg_rp_dly_line_v3.sv: basejump_stl/hard/sky_130/bsg_dmc/bsg_rp_dly_line_v3.py $(BSG_CHIP_SCRIPT)
	$(PYTHON) $< \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=dly_num_rows) \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=dly_num_cols) \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=dly_post_buf) \
		> $@

synth: yosys.tcl bsg_rp_clk_gen_osc_unit_v3.sv bsg_rp_clk_gen_osc_unit_v3.sv bsg_rp_dly_line_v3.sv
	yosys -c $<

clean:
	rm -rf slpp_all/
	rm -f bsg_rp_clk_gen_osc_unit_v3.sv
	rm -f bsg_rp_clk_gen_osc_unit_v3.sv
	rm -f bsg_rp_dly_line_v3.sv
	rm -f check.rpt
	rm -f output.elab.v
	rm -f output.map.v
	rm -f output.opt.v
	rm -f output.sv2v.v
	rm -f output.syn.v
	rm -f stat.rpt


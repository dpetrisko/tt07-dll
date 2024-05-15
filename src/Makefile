
PYTHON ?= python

HARD ?= basejump_stl/hard/sky_130
HARD_CLK ?= $(HARD)/bsg_clk_gen
HARD_DMC ?= $(HARD)/bsg_dmc

BSG_CHIP_SCRIPT ?= bsg_chip_pkg.py

all: $(BSG_CHIP_SCRIPT)
	$(PYTHON) $(HARD_CLK)/bsg_rp_clk_gen_osc_unit_v3.py \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=osc_num_rows) \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=osc_num_cols) \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=osc_post_buf) \
		> bsg_rp_clk_gen_osc_unit_v3.sv
	$(PYTHON) $(HARD_CLK)/bsg_rp_clk_gen_osc_v3.py \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=osc_num_rows) \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=osc_num_cols) \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=osc_post_buf) \
	  	> bsg_rp_clk_gen_osc_v3.sv
	$(PYTHON) $(HARD_DMC)/bsg_rp_dly_line_v3.py \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=dly_num_rows) \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=dly_num_cols) \
		$(shell $(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=param --par=dly_post_buf) \
		> bsg_rp_dly_line_v3.sv
	$(PYTHON) $(BSG_CHIP_SCRIPT) --gentype=pkg > bsg_chip_pkg.sv

clean:
	rm -f bsg_rp_dly_line_v3.sv
	rm -f bsg_rp_clk_gen_osc_unit_v3.sv
	rm -f bsg_rp_clk_gen_osc_v3.sv

all:


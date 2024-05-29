
# Setup environment
TOP := $(PWD)/..
include ../Makefile.common

SRC_DIR = $(PROJ_ROOT)/src
TEST_DIR = $(PROJ_ROOT)/test

sv2v_netlist ?= $(SRC_DIR)/sv2v_build/tt_um_dpetrisko_ttdll.sv2v.v

RUNKEY ?= interactive

all: $(SRC_DIR)/user_config.tcl
	$(TT_TOOL_ROOT)/tt_tool.py \
		--debug \
		--openlane2 \
		--yaml $(PROJ_ROOT)/info.yaml \
		--harden
	cp ./runs/wokwi/final/gds/*.gds gds/
	cp ./runs/wokwi/final/lef/*.lef lef/
	cp ./runs/wokwi/final/pnl/*.pnl.v lef/
	cp ./runs/wokwi/final/nl/*.nl.v lef/

$(SRC_DIR)/user_config.tcl: $(sv2v_netlist) $(SRC_DIR)/constraints_patched.pnr.sdc $(SRC_DIR)/constraints_patched.signoff.sdc
	$(TT_TOOL_ROOT)/tt_tool.py \
		--debug \
		--openlane2 \
		--yaml $(PROJ_ROOT)/info.yaml \
		--create-user-config
	echo "set ::env(FP_DEF_TEMPLATE) $$::env(DESIGN_DIR)/tt_block_1x1_pg.def" >> $@
	echo "set ::env(PNR_SDC_FILE) $$::env(DESIGN_DIR)/constraints_patched.pnr.sdc" >> $@
	echo "set ::env(SIGNOFF_SDC_FILE) $$::env(DESIGN_DIR)/constraints_patched.signoff.sdc" >> $@

$(SRC_DIR)/constraints_patched.pnr.sdc: $(SRC_DIR)/constraints.sdc
	cat $(OPENLANE_ROOT)/openlane/scripts/base.sdc $< > $@
	echo "set_max_fanout 16 [current_design]" >> $@

$(SRC_DIR)/constraints_patched.signoff.sdc: $(SRC_DIR)/constraints.sdc
	cat $(OPENLANE_ROOT)/openlane/scripts/base.sdc $< > $@
	echo "set_max_fanout 48 [current_design]" >> $@

open.klayout:
	python -m openlane --dockerized --run-tag wokwi --force-run-dir runs/wokwi --flow OpenInKLayout src/config_patched.tcl

open.openroad:
	python -m openlane --dockerized --run-tag wokwi --force-run-dir runs/wokwi --flow OpenInOpenROAD src/config_patched.tcl


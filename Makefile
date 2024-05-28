
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

$(SRC_DIR)/user_config.tcl: $(sv2v_netlist) $(SRC_DIR)/constraints_patched.sdc
	$(TT_TOOL_ROOT)/tt_tool.py \
		--debug \
		--openlane2 \
		--yaml $(PROJ_ROOT)/info.yaml \
		--create-user-config
	echo "set ::env(FP_DEF_TEMPLATE) $$::env(DESIGN_DIR)/tt_block_1x1_pg.def" >> $@
	echo "set ::env(BASE_SDC_FILE) $$::env(DESIGN_DIR)/constraints_patched.sdc" >> $@

$(SRC_DIR)/constraints_patched.sdc: $(SRC_DIR)/constraints.sdc
	cat $(OPENLANE_ROOT)/openlane/scripts/base.sdc $< > $@

open:
	python -m openlane --dockerized --run-tag wokwi --force-run-dir runs/wokwi --flow OpenInOpenROAD src/config_patched.tcl


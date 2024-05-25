
# Setup environment
TOP := $(PWD)/..
include $(TOP)/Makefile.common

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
	echo "set ::env(BASE_SDC_FILE) $$::env(DESIGN_DIR)/constraints_patched.sdc" >> $@

$(SRC_DIR)/constraints_patched.sdc: $(SRC_DIR)/constraints.sdc
	cat $(OPENLANE_ROOT)/openlane/scripts/base.sdc $< > $@

open:
	openlane --last-run --flow openinklayout $(SRC_DIR)/config_patched.tcl

$(sv2v_netlist):
	cd $(SRC_DIR); \
		$(MAKE) sv2v



# Setup environment
TOP := $(PWD)/..
include $(TOP)/Makefile.common

SRC_DIR = $(PROJ_ROOT)/src
TEST_DIR = $(PROJ_ROOT)/test

sv2v_netlist ?= $(SRC_DIR)/sv2v_build/tt_um_dpetrisko_ttdll.sv2v.v

$(sv2v_netlist):
	$(MAKE) -C $(SRC_DIR) sv2v

all: $(sv2v_netlist)
	$(TT_TOOL_ROOT)/tt_tool.py \
		--debug \
		--openlane2 \
		--yaml $(PROJ_ROOT)/info.yaml \
		--create-user-config \
		--harden


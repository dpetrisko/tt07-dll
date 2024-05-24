
# Setup environment
TOP := $(PWD)/..
include $(TOP)/Makefile.common

SRC_DIR = $(PWD)/../src
TEST_DIR = $(PWD)/../test

all:
	$(TT_TOOL_ROOT)/tt_tool.py --create-user-config --debug --harden


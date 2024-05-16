import sys

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Combine
from cocotb.triggers import RisingEdge, FallingEdge
from cocotb.triggers import ReadWrite, ReadOnly

sys.path.append("../test")
sys.path.append("../src")
from bsg_chip_pkg import BsgChipPkg

from pprint import pprint


class Object(object):
    pass


class BsgChipPinUtils:
    def __init__(self, pkg):
        pass

    # Read a pin from the cocotb model
    def pin_read(self, pin):
        pinst = self.pinmap[pin]

        return pinst.value

    # Write a pin from the cocotb model (which must be synchronized
    def pin_write(self, pin, val):
        pinst = self.pinmap[pin]

        pinst.value = val

    # Register a clock for the testbench
    def clock_register(self, clk):
        print("Registering clock")
        self.clk = clk

    # Register a pinmap for a certain chip
    def pinmap_register(self, pinmap):
        print("Registering pinmap")
        self.pinmap = pinmap

        for pin in pinmap.keys():
            self.pin_write(pin, 0)

    # Registers a bsg_tag bus in the pinmap
    def tagmap_register(self, tagmap):
        print("Registering tagmap")
        self.tag_clk = tagmap["tag_clk"]
        self.tag_en = tagmap["tag_en"]
        self.tag_data = tagmap["tag_data"]

        self.pin_write(self.tag_clk, 1)
        self.pin_write(self.tag_en, 1),
        self.pin_write(self.tag_data, 1)

    # Sends a tagseq using an agnostic edge function
    async def tagbus_send(self, seq):
        for b in seq:
            t = cocotb.utils.get_sim_time()
            self.pin_write(self.tag_data, b)
            self.pin_write(self.tag_clk, 0)
            await RisingEdge(self.clk)
            self.pin_write(self.tag_clk, 1)
            await RisingEdge(self.clk)


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
        pinst, pmask, pdir = self.pinmap[pin]
        pval = self.pinmon[pinst]

        if (pval & pmask) == 0:
            return 0
        else:
            return 1

    # Write a pin from the cocotb model (which must be synchronized
    def pin_write(self, pin, val):
        pinst, pmask, pdir = self.pinmap[pin]
        pval = self.pinmon[pinst]

        if val == 0:
            pval = pval & ~pmask
        else:
            pval = pval | pmask

        self.pinmon[pinst] = pval

    # Register a pinmap for a certain chip
    async def pinmap_register(self, pinmap):
        self.pinmap = pinmap
        self.pinmon = {}

        for pin, (pinst, pmask, pdir) in self.pinmap.items():
            self.pinmon[pinst] = 0

        await cocotb.start_soon(self.sync())

    # Registers a bsg_tag bus in the pinmap
    async def tagmap_register(self, tagmap):
        self.tag_clk = tagmap["tag_clk"]
        self.tag_en = tagmap["tag_en"]
        self.tag_data = tagmap["tag_data"]

        self.pin_write(self.tag_clk, 1)
        self.pin_write(self.tag_en, 1),
        self.pin_write(self.tag_data, 1)

        await cocotb.start_soon(self.sync())

    # Synchronize pin changes and advance the clock
    async def sync(self):
        await ReadWrite()
        for pin, (pinst, pmask, pdir) in self.pinmap.items():
            if pdir == 0:
                t = cocotb.utils.get_sim_time()
                print("[{}] Syncing {} to {}".format(t, pin, self.pinmon[pinst]))
                pinst.value = self.pinmon[pinst]
            else:
                self.pinmon[pinst] = pinst.value

    # Sends a tagseq using an agnostic edge function
    async def tagbus_send(self, seq, clk):
        for b in seq:
            t = cocotb.utils.get_sim_time()
            print("[{}] SEND B: {}".format(t, b))
            self.pin_write(self.tag_data, b)
            self.pin_write(self.tag_clk, 0)
            await cocotb.start_soon(self.sync())
            await RisingEdge(clk)
            self.pin_write(self.tag_clk, 1)
            await cocotb.start_soon(self.sync())
            await RisingEdge(clk)


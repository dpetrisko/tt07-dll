import sys

sys.path.append("../test")
sys.path.append("../src")
from bsg_chip_pkg import BsgChipPkg
from bsg_chip_tag_utils import BsgChipTagUtils
from bsg_chip_pin_utils import BsgChipPinUtils

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.triggers import RisingEdge
from cocotb.triggers import Combine
from cocotb.utils import get_sim_time


class BsgChipTester:
    def __init__(self, pkg):
        self.pin = BsgChipPinUtils(pkg)

    # Register a pinmap and tagbus
    async def register(self, clk, pinmap, tagmap):
        await Combine(
            cocotb.start_soon(self.pin.pinmap_register(pinmap)),
            cocotb.start_soon(self.pin.tagmap_register(tagmap)),
        )

    # Run a sequence produced by a sequencer
    async def run_gen(self, seq):
        await self.pin.tagbus_send(seq)

# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: MIT

# BSG Imports
import sys

sys.path.append("../test")
sys.path.append("../src")
from bsg_chip_pkg import BsgChipPkg
from bsg_chip_tester import BsgChipTester
from bsg_chip_sequencer import BsgChipSequencer

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.triggers import RisingEdge


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Test project behavior")

    # TODO: BSG BSG
    # TODO: This is coupled to toplevel

    pinmap = {
        "p_tag_clk_i": (dut.ui_in, 0b00000001, 0),
        "p_tag_en_i": (dut.ui_in, 0b00000010, 0),
        "p_tag_data_i": (dut.ui_in, 0b00000100, 0),
        "p_osc_clk_o": (dut.uo_out, 0b00000001, 1),
        "p_ds_clk_o": (dut.uo_out, 0b00000010, 1),
        "p_gen_clk_o": (dut.uo_out, 0b00000100, 1),
        "p_dly_clk_o": (dut.uo_out, 0b00001000, 1),
        "p_mon_clk_o": (dut.uo_out, 0b00010000, 1),
        "p_div_clk_o": (dut.uo_out, 0b00100000, 1),
        "p_ds_reset_o": (dut.uo_out, 0b01000000, 1),
        "p_mon_reset_o": (dut.uo_out, 0b10000000, 1),
        "p_div_count_0_o": (dut.uio_out, 0b00000001, 1),
        "p_div_count_1_o": (dut.uio_out, 0b00000010, 1),
        "p_div_count_2_o": (dut.uio_out, 0b00000100, 1),
        "p_div_count_3_o": (dut.uio_out, 0b00001000, 1),
        "p_div_count_4_o": (dut.uio_out, 0b00010000, 1),
        "p_div_count_5_o": (dut.uio_out, 0b00100000, 1),
        "p_div_count_6_o": (dut.uio_out, 0b01000000, 1),
        "p_div_count_7_o": (dut.uio_out, 0b10000000, 1),
    }

    tagmap = {
        "tag_clk": "p_tag_clk_i",
        "tag_en": "p_tag_en_i",
        "tag_data": "p_tag_data_i",
    }

    bcp = BsgChipPkg()
    bcs = BsgChipSequencer(bcp)
    bct = BsgChipTester(bcp)

    await bct.register(dut.clk, pinmap, tagmap)
    # await bct.run_gen(bcs.gen_init(), cocotb_tick)
    # await btu.tagseq_send( tick)

    # TODO: END BSG BSG

    # Set the input values you want to test
    dut.ui_in.value = 20
    dut.uio_in.value = 30

    # Wait for one clock cycle to see the output values
    await ClockCycles(dut.clk, 1)

    # The following assersion is just an example of how to check the output values.
    # Change it to match the actual expected output of your module:
    # assert dut.uo_out.value == 50

    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)


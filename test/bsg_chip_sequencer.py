
import sys

sys.path.append("../test")
sys.path.append("../src")
from bsg_chip_pkg import BsgChipPkg
from bsg_chip_tag_utils import BsgChipTagUtils
from bsg_chip_pin_utils import BsgChipPinUtils

class BsgChipSequencer:
    def __init__(self, pkg):
        self.btc = pkg.clients
        self.tag = BsgChipTagUtils(pkg)

    def gen_init(self):
        yield from self.tag.reset_master()
        yield from self.tag.reset_recurse(self.btc)

        yield from self.tag.idle(35)

        yield from self.tag.set_client(self.btc.osc.ctl, 0)
        yield from self.tag.set_client(self.btc.osc.ds, 1)
        yield from self.tag.set_client(self.btc.osc.ds, 0)
        yield from self.tag.set_client(self.btc.osc.sel, 0)

        yield from self.tag.set_client(self.btc.dly.unused, 0)

        yield from self.tag.set_client(self.btc.mon.reset, 1)
        yield from self.tag.set_client(self.btc.mon.sel, 0)
        yield from self.tag.set_client(self.btc.mon.reset, 0)

        yield from self.tag.idle(35)




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


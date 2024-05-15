
import sys

sys.path.append("../test")
sys.path.append("../src")
from bsg_chip_pkg import BsgChipPkg

class BsgChipTagUtils:
    def __init__(self, pkg):
        self.tag_els = pkg.params.tag_els[0]
        self.tag_lg_els = pkg.params.tag_lg_els[0]
        self.tag_width = pkg.params.tag_max_payload_width[0]
        self.tag_lg_width = pkg.params.tag_lg_width[0]

    # Generate a single start bit
    def start_bit(self):
        yield 1

    # Generate a single stop bit
    def stop_bit(self):
        yield 0

    # Generate a range of bits
    def gen_bits(self, width, payload):
        for i in range(width):
            yield ((payload >> i) & 0x1)

    # Idle for N cycles
    def idle(self, N):
        for _ in range(N):
            yield from self.stop_bit()

    # Reset tag master
    def reset_master(self):
        yield from self.start_bit()
        # Make sure we get enough cycles for tag master to initialize itself
        yield from self.idle(100)

    # Reset a client
    def reset_client(self, client):
        reset_val = (2**self.tag_width)-1
        yield from self.write_client(client[0], 0, client[1], reset_val)

    # Recursively reset all clients in the below hierarchy
    def reset_recurse(self, client):
        for a, f in client.__dict__.items():
            # Skip builtin
            if '__' in a:
                continue
            # Reset tuple
            if isinstance(f, tuple):
                yield from self.reset_client(f)
            else:
                yield from self.reset_recurse(f)

    # Write to a specific client
    def write_client(self, nodeId, data_not_reset, width, payload):
        # Start bit
        yield from self.start_bit()
        # Payload length
        yield from self.gen_bits(self.tag_lg_width, width)
        # data_not_reset
        yield data_not_reset
        # nodeID
        yield from self.gen_bits(self.tag_lg_els, nodeId)
        # Payload
        yield from self.gen_bits(self.tag_width, payload)
        # Stop bit
        yield from self.stop_bit()


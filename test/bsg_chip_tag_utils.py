
import sys

sys.path.append("../test")
sys.path.append("../src")
from bsg_chip_pkg import BsgChipPkg

class BsgChipTagUtils:
    def __init__(self, pkg):
        self.tag_id_width = pkg.params.tag_lg_els[0]
        self.tag_width = pkg.params.tag_max_payload_width[0]
        self.tag_len = pkg.params.tag_lg_width[0]

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
        yield from self.gen_bits(self.tag_len, width)
        # data_not_reset
        yield data_not_reset
        # nodeID
        yield from self.gen_bits(self.tag_id_width, nodeId)
        # Payload
        yield from self.gen_bits(width, payload)
        # Stop bit
        yield from self.stop_bit()

    # Reset tag master
    def reset_master(self):
        print("Resetting tag master")
        yield from self.start_bit()
        # Make sure we get enough cycles for tag master to initialize itself
        cycles = 20 + self.tag_id_width + self.tag_id_width + self.tag_len
        yield from self.idle(cycles)

    # Reset a client
    def reset_client(self, client):
        print("Resetting tag client {}".format(client))
        val = (2**client[1])-1
        yield from self.write_client(client[0], 0, client[1], 1)

    # Set a specific client
    def set_client(self, client, val):
        print("Setting tag client {}={}".format(client, val))
        yield from self.write_client(client[0], 1, client[1], val)

    # Idle for N cycles
    def idle(self, N):
        print("Idling for {} cycles...".format(N))
        for _ in range(N):
            yield from self.stop_bit()


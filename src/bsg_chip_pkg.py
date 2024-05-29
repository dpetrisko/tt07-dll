
import argparse

def clog2(x):
    return (x-1).bit_length()

class Object(object):
    pass


# Global Tag Info. MUST correspond to the verilog or dead chips could result
class BsgChipPkg:
    def __init__(self):
        ##########################
        ##### Initialize packages
        ##########################
        self.packages = Object()
        self.packages.bsg_tag_pkg = "For bsg_tag_s"

        ##########################
        ##### Initialize parameters
        ##########################
        self.params = Object()
        self.params.tag_els = (1024, "Maximum number of tag elements in the system")
        self.params.tag_lg_els = (
            int(clog2(self.params.tag_els[0])),
            "ID width of tag client",
        )
        self.params.tag_max_payload_width = (12, "Max payload width for a tag client")
        self.params.tag_lg_width = (
            int(clog2(self.params.tag_max_payload_width[0] + 1)),
            "Length of the max payload width",
        )
        self.params.osc_num_rows = (5, "Number of rows for oscillator")
        self.params.osc_num_cols = (5, "Number of cols for oscillator")
        self.params.osc_num_taps = (
            self.params.osc_num_rows[0] * self.params.osc_num_cols[0],
            "Number of taps for oscillator",
        )
        self.params.osc_ctl_width = (
            int(clog2(self.params.osc_num_taps[0])),
            "Width of control regs for oscillator",
        )
        self.params.osc_post_buf = (2, "Length of post oscillator buffer chain")
        self.params.osc_ds_width = (2, "Width of oscillator downsampler")
        self.params.dly_num_rows = (5, "Number of rows for delay line")
        self.params.dly_num_cols = (5, "Number of cols for delay line")
        self.params.dly_num_taps = (
            self.params.dly_num_rows[0] * self.params.dly_num_cols[0],
            "Number of taps for delay line",
        )
        self.params.dly_ctl_width = (
            int(clog2(self.params.dly_num_taps[0])),
            "Width of control regs for delay line",
        )
        self.params.dly_post_buf = (2, "Length of post delay buffer chain")
        self.params.div_count_width = (8, "Width of the digital period approximater")

        ##########################
        ##### Initialize tag clients
        ##########################
        i = 0
        self.clients = Object()

        ##########################
        ##### Oscillator Object Declaration
        ##########################
        self.clients.osc = Object()
        self.clients.osc.async_reset = (
            i,
            1,
            "Asynchronous reset"
        )
        i += 1
        self.clients.osc.ctl = (
            i,
            self.params.osc_ctl_width[0],
            "Programmable control for oscillator",
        )
        i += 1
        self.clients.osc.trigger = (i, 1, "Trigger for oscillator")
        i += 1
        self.clients.osc.ds = (i, self.params.osc_ds_width[0] + 1, "Downsampler width")
        i += 1
        self.clients.osc.sel = (
            i,
            2,
            "Selection: 0=oscillator, 1=downsampler, 2=external, 3=zero",
        )
        i += 1

        ##########################
        ##### Delay Object Declaration
        ##########################
        self.clients.dly = Object()
        self.clients.dly.async_reset = (
            i,
            1,
            "Asynchronous reset"
        )
        i += 1

        ##########################
        ##### Monitor Object Declaration
        ##########################
        self.clients.mon = Object()
        self.clients.mon.reset = (i, 1, "Synchronous reset")
        i += 1
        self.clients.mon.sel = (i, 2, "Selection: 0=osc, 1=dly")
        i += 1

        ##########################
        ##### Division Object Declaration
        ##########################
        self.clients.div = Object()
        self.clients.div.reset = (i, 1, "Synchronous reset")
        i += 1
        self.clients.div.enable = (i, 1, "Synchronous enable")
        i += 1
        self.clients.div.clear = (i, 1, "Synchronous clear")
        i += 1

    ###########################
    #### Recurse through a field and yield
    ###########################
    def print_param(self, param):
        print(self.params.__dict__[param][0], end="")

    def gen_packages(self, package):
        for a, f in package.__dict__.items():
            # Skip builtin
            if "__" in a:
                continue
            # Param tuple
            if isinstance(f, str):
                yield (a, f)
            else:
                yield from self.gen_packages(f)

    def gen_params(self, param):
        for a, f in param.__dict__.items():
            # Skip builtin
            if "__" in a:
                continue
            # Param tuple
            if isinstance(f, tuple):
                yield (a, f)
            else:
                yield from self.gen_params(f)

    def gen_clients(self, client):
        for a, f in reversed(client.__dict__.items()):
            # Skip builtin
            if "__" in a:
                continue
            # Client tuple
            if isinstance(f, tuple):
                yield a, f
            else:
                yield from self.gen_clients(f)

    def gen_tgroups(self, group):
        for a, f in reversed(group.__dict__.items()):
            # Skip builtin
            if "__" in a:
                continue
            # Client tuple
            if isinstance(f, tuple):
                continue
            else:
                yield a, f
                yield from self.gen_tgroups(f)

    def print_verilog(self):
        print(
            """
package bsg_chip_pkg;
  //////////////////////////////////////////////////////////////////////
  //////// Packages
  //////////////////////////////////////////////////////////////////////
""",
            end="",
        )
        for p, v in self.gen_packages(self.packages):
            print(
                """
    // {comment}
    import {pname}::*;
    """.format(
                    comment=v, pname=p
                ),
                end="",
            )
        print(
            """
  //////////////////////////////////////////////////////////////////////
  //////// Parameters
  //////////////////////////////////////////////////////////////////////
  """,
            end="",
        )
        for p, v in self.gen_params(self.params):
            print(
                """
    // {comment}
    localparam {pname}_gp = {pvalue};
    """.format(
                    comment=v[1], pname=p, pvalue=v[0]
                ),
                end="",
            )

        print(
            """
  //////////////////////////////////////////////////////////////////////
  //////// Clients
  //////////////////////////////////////////////////////////////////////
  """,
            end="",
        )
        for p, t in self.gen_tgroups(self.clients):
            print(
                """
  typedef struct packed
  {
  """,
                end="",
            )
            for c, v in self.gen_clients(t):
                print(
                    """
    // {comment}
    // Width={width}
    bsg_tag_s {name};
    """.format(
                        comment=v[2], width=v[1], name=c
                    ),
                    end="",
                )
            print(
            """
  }} bsg_chip_{name}_tag_lines_s;
  localparam bsg_chip_{name}_tag_local_els_gp =
    $bits(bsg_chip_{name}_tag_lines_s) / $bits(bsg_tag_s);
    """.format(
                name=p
            ),
            end="",
        )
        print(
            """
  //////////////////////////////////////////////////////////////////////
  //////// Warning: Danger Zone
  //////// Must set parameters below correctly, else chip may fail
  //////////////////////////////////////////////////////////////////////
  typedef struct packed
  {
  """,
            end="",
        )
        for p, t in self.gen_tgroups(self.clients):
            print(
                """
    bsg_chip_{name}_tag_lines_s {name};
""".format(
                    name=p
                ),
                end="",
            )
        print(
            """
  } bsg_chip_tag_lines_s;
  localparam bsg_chip_tag_local_els_gp =
    $bits(bsg_chip_tag_lines_s) / $bits(bsg_tag_s);

endpackage

""",
            end="",
        )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog="bsg_chip_pkg.py",
        description="Generates collateral for a bsg_chip",
        epilog="Read script for more details",
    )
    parser.add_argument(
        "--gentype",
        type=str,
        choices=["pkg", "param"],
        required=True,
        help="Which collateral",
    )
    parser.add_argument("--par", type=str, help="Parameter to inspect", required=False)

    args = parser.parse_args()

    x = BsgChipPkg()
    if args.gentype == "pkg":
        x.print_verilog()
    elif args.gentype == "param":
        x.print_param(args.par)

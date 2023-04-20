"""2 options. either compare to another folder or take some history

I think comparing to another folder seems like a better way
"""

import os

input_locations = "bundle notused_plugins".split()
output_locations = input_locations[:] + [os.path.join("notused_plugins", "Infrequent")]


def analyze(input, output):
    for loc in input_locations:
        for fd_ in os.listdir(os.path.join(input, loc)):
            fd = os.path.join(input, loc, fd_)
            if os.path.isdir(fd):
                locs = []
                for loc2 in output_locations:
                    fd2 = os.path.join(output, loc2, fd_)
                    if os.path.isdir(fd2):
                        locs.append((fd, fd2, loc, loc2))
                if len(locs) == 0:
                    print("Not found: ", fd)
                else:
                    if len(locs) > 1:
                        print("more than one found:")
                        for loc in locs:
                            print(loc)
                    else:
                        l1, l2 = locs[0][2:4]
                        if l1 != l2:
                            print("Mismatch...")
                            print(locs)


if __name__ == "__main__":
    analyze(".", "new")

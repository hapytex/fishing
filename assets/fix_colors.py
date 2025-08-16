#!/usr/bin/python3

import json
import sys

for f in sys.argv[1:]:
    with open(f, "r") as fh:
        data = json.load(fh)

    for rec in data.values():
        assert "rgb" in rec or "hex" in rec
        if "rgb" not in rec:
            hx = rec["hex"]
            if not hx.startswith("#"):
                rec["hex"] = hx = f"#{hx}"
            hx = int(hx[1:], 16)
            rec["rgb"] = [hx >> 16, (hx >> 8) & 0xFF, hx & 0xFF]
        elif "hex" not in rec:
            r, g, b = rec["rgb"]
            rec["hex"] = f"#{hex((r << 16) | (g << 8) | b)[2:]}"

    with open(f, "w") as fh:
        json.dump(data, fh)

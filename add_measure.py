#!/usr/bin/python3

import sys
from ast import literal_eval
from datetime import datetime
import json
import re
from dateparser import parse

DURATION = re.compile(r"\d{1,2}([:]\d{2})+")
ASSET_PATH = "measurements.json"

if __name__ == "__main__":
    assert (
        len(sys.argv) > 2
    ), "You should provide the name of the measurement and the corresponding value"
    try:
        with open(ASSET_PATH, "r") as f:
            data = json.load(f)
    except IOError:
        data = {}
    dt = datetime.now().isoformat()
    for i in range(1, len(sys.argv) - 1, 2):
        key = sys.argv[i]
        try:
            key, dt2 = key.rsplit('@', 1)
            dt2 = parse(dt2)
            if dt2 is not None:
                key_dt = dt2.isoformat()
        except ValueError:
            # key is already fine
            key_dt = dt
        val = sys.argv[i + 1].strip()
        if DURATION.fullmatch(val.strip()):
            d = 0
            for di in val.split(":"):
                d *= 60
                d += int(di)
            val = d
        else:
            try:
                val = literal_eval(val)
            except ValueError:
                try:
                    val = json.loads(val)
                except ValueError:
                    pass  # keep it a string
        datum = data
        for ky in key.split("."):
            datum = datum.setdefault(ky, {})
        datum[key_dt] = val
    with open(ASSET_PATH, "w") as f:
        json.dump(data, f, indent=4)

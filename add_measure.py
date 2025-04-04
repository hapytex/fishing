#!/usr/bin/python3

import json
import re
import sys
from ast import literal_eval
from datetime import datetime

from color_pprint import cprint
from dateparser import parse
from filelock import FileLock

DURATION = re.compile(r"\d{1,2}([:]\d{2})+")
ASSET_PATH = "measurements.json"

if __name__ == "__main__":
    n = len(sys.argv)
    assert (
        n > 1
    ), "You should provide the name of the measurement and the corresponding value"
    with FileLock(f"{ASSET_PATH}.lock"):
        try:
            with open(ASSET_PATH, "r") as f:
                data = json.load(f)
        except IOError:
            data = {}
        dt = datetime.now().replace(microsecond=0).isoformat()
        to_sort = {}
        _def = {}
        for i in range(1, n, 2):
            key = sys.argv[i]
            try:
                key, dt2 = key.rsplit("@", 1)
                dt2 = parse(dt2)
                if dt2 is not None:
                    key_dt = dt2.isoformat()
            except ValueError:
                # key is already fine
                key_dt = dt
            datum = data
            for ky in key.split("."):
                _datum = datum.setdefault(ky, _def)
                if _datum is _def:
                    _def = {}  # new one
                    # need to resort datum, new entry
                    to_sort[id(datum)] = datum
                datum = _datum
            if n > i + 1:
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
                    except (ValueError, SyntaxError):
                        try:
                            val = json.loads(val)
                        except ValueError:
                            pass  # keep it a string
                datum[key_dt] = val
                if key_dt is not dt:
                    # we add a key from the past
                    to_sort[id(datum)] = datum
            else:
                cprint(datum)
        for datum in to_sort.values():
            datum_sort = {k: v for k, v in sorted(datum.items())}
            datum.clear()
            datum.update(datum_sort)
        with open(ASSET_PATH, "w") as f:
            json.dump(data, f, indent=4)

#!/usr/bin/python3

import json
import re
import sys
from ast import literal_eval
from datetime import datetime
from shutil import move

from color_pprint import cprint
from dateparser import parse
from filelock import FileLock

DURATION = re.compile(r"\d{1,2}([:]\d{2})+")
ASSET_PATH = "assets/measurements.json"


def filter_dict(data, dt):
    if isinstance(data, dict):
        result = {}
        for k, v in data.items():
            v = filter_dict(v, dt)
            if v:
                try:
                    dt2 = datetime.fromisoformat(k)
                except ValueError:
                    result[k] = v
                else:
                    if dt2 >= dt:
                        result[k] = v
        return result
    return data


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
        timestamp = datetime.now().replace(microsecond=0)
        dt = timestamp.isoformat()
        to_sort = {}
        _def = {}
        for i in range(1, n, 2):
            key = sys.argv[i]
            try:
                key, dt2 = key.rsplit("@", 1)
                timefilter = dt2 = parse(dt2)
                if dt2 is not None:
                    key_dt = dt2.isoformat()
            except ValueError:
                # key is already fine
                timefilter = datetime.min
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
                if val:  # None, False, etc. are all omitted
                    datum[key_dt] = val
                    if key_dt is not dt:
                        # we add a key from the past
                        to_sort[id(datum)] = datum
            else:
                cprint(filter_dict(datum, timefilter))
        for datum in to_sort.values():
            datum_sort = {k: v for k, v in sorted(datum.items())}
            datum.clear()
            datum.update(datum_sort)
        with open(f"{ASSET_PATH}.tmp", "w") as f:
            json.dump(data, f, indent=4)
        move(f"{ASSET_PATH}.tmp", ASSET_PATH)

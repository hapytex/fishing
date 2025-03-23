#!/usr/bin/python3

import sys
from ast import literal_eval
from datetime import datetime
import json

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
        val = literal_eval(sys.argv[i + 1])
        datum = data
        for ky in key.split('.'):
            datum = datum.setdefault(ky, {})
        datum[dt] = val
    with open(ASSET_PATH, "w") as f:
        json.dump(data, f, indent=4)

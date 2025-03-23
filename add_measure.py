#!/usr/bin/python3

import sys
from ast import literal_eval
from datetime import datetime
import json

ASSET_PATH = 'measurements.json'

if __name__ == "__main__":
    assert (
        len(sys.argv) > 2
    ), "You should provide the name of the measurement and the corresponding value"
    try:
        with open(ASSET_PATH, "r") as f:
            data = json.load(f)
    except IOError:
        data = {}
    key = sys.argv[1]
    val = literal_eval(sys.argv[2])
    data.setdefault(key, {})[datetime.now().isoformat()] = val
    with open(ASSET_PATH, "w") as f:
        json.dump(data, f, indent=4)

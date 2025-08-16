#!/usr/bin/python3

import json
import sys
import os
from ast import literal_eval

if __name__ == "__main__":
    for val in sys.argv[1:]:
        try:
            val = literal_eval(val)
        except (ValueError, SyntaxError):
            try:
                val = json.loads(val)
            except ValueError:
                pass  # keep it a string
        if val:
            sys.exit(0)
        os._exit(1)

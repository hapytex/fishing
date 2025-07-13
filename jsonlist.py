#!/usr/bin/python3

import json
import sys
from ast import literal_eval

if __name__ == "__main__":
    lst = []
    for val in sys.argv[1:]:
        try:
            val = literal_eval(val)
        except (ValueError, SyntaxError):
            try:
                val = json.loads(val)
            except ValueError:
                pass  # keep it a string
        lst.append(val)
    print(json.dumps(lst))

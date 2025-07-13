#!/usr/bin/python3

import json
import sys
from ast import literal_eval

if __name__ == "__main__":
    lst = []
    dct = {}
    aslst = False
    for val in sys.argv[1:]:
        key = None
        if not aslst and val.startswith('-'):
            val = val[1:]
            if val.startswith('-'):
                val = val[1:]
                if not val:
                    aslst = True
                    continue
            key, val = val.split('=', 1)
        try:
            val = literal_eval(val)
        except (ValueError, SyntaxError):
            try:
                val = json.loads(val)
            except ValueError:
                pass  # keep it a string
        if key is not None:
            dct[key] = val
        else:
            lst.append(val)
    if dct:
        print(json.dumps(dct))
    else:
        print(json.dumps(lst))

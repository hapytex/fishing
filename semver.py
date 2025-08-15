#!/usr/bin/python3

import re
import sys

VERSION_PAT = re.compile(r"^\s*([^#><!=~\s]+)\s*[=][=]\s*(\d+)[.](\d+)([.].+?)?\s*$")

if __name__ == "__main__":
    for line in sys.stdin:
        line = line.strip()
        match = VERSION_PAT.match(line)
        if match:
            pkg, mj, mn, rest = match.groups()
            rest = rest or ""
            mn = int(mn)
            print(f"{pkg} >= {mj}.{mn}{rest} <{mj}.{mn+1}")
        else:
            print(line)

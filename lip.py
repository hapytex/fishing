#!/usr/bin/python3

import json
import math
import os
import sys
import urllib.request

import cv2
import numpy as np
from dateparser import parse

MONTHS = ("JA", "FE", "MR", "AP", "MY", "JN", "JL", "AU", "SE", "OC", "NV", "DE")


def gen_year(year):
    return [[set() for _ in range(31)] for _ in range(1, 13)]


def insert_datum(dates, years=None):
    if isinstance(dates, (list, tuple)):
        dates = dict.fromkeys(dates, True)
    if years is None:
        years = {}
    for date, dateval in dates.items():
        year = date.year
        dat = years.get(year)
        if dat is None:
            years[year] = dat = gen_year(year)
        dat[date.month - 1][date.day - 1].add(dateval)
    return years


def get_distict(years):
    return {di for y in years.values() for m in y for d in m for di in d}


def to_infill(value):
    if not value:
        return "  "
    else:
        return "██"


def life_in_pixels(*data):
    years = insert_datum(data)
    y1 = len(years) - 1
    muly = y1 > 0
    print("┏" + ("━" * 35 + "┳") * y1 + "━" * 35 + "┓")
    years = {k: v for k, v in sorted(years.items())}
    for y in years:
        print(f"┃{' '*16}{y}{' '*15}", end="")
    print("┃")
    print("┣" + ("━━┯" * 11 + "━━" + "╋") * y1 + ("━━┯" * 11 + "━━") + "┫")
    for d in range(-2, 31):
        if d == -1:
            print("┠", end="")
        else:
            print("┃", end="")
        for y, vs in years.items():
            if d != -1:
                for m in range(12):
                    if d == -2:
                        print(MONTHS[m], end="")
                    else:
                        print(to_infill(vs[m][d]), end="")
                    print("│" if m < 11 else "┃", end="")
        if d == -1:
            print(("──┼" * 11 + "──╂") * y1 + "──┼" * 11 + "──┨", end="")
        print()
    print("┗" + ("━━┷" * 11 + "━━┻") * y1 + "━━┷" * 11 + "━━┛")


if __name__ == "__main__":
    life_in_pixels(*[parse(d) for d in sys.argv[1:]])

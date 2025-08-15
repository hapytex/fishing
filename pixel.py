#!/usr/bin/python3

import json
import math
import os
import sys
import urllib.request

import cv2
import numpy as np

if __name__ == "__main__":
    col, rows = os.get_terminal_size()
    rows -= 1
    items = len(sys.argv) - 1
    reord = math.ceil(math.sqrt(items))
    coord = (items - 1 + reord) // reord
    col //= reord
    rows = 2 * rows // coord
    for i0 in range(1, items + 1, reord):
        imgs = []
        for arg in sys.argv[i0 : i0 + reord]:
            if arg.startswith("https://") or arg.startswith("http://"):
                url_response = urllib.request.urlopen(arg)
                img = cv2.imdecode(
                    np.array(bytearray(url_response.read()), dtype=np.uint8), -1
                )
            else:
                img = cv2.imread(arg)
            h, w, d = img.shape
            mul = min(col / w, rows / h)
            h = math.floor(mul * h)
            w = math.floor(mul * w)
            pix = np.zeros((rows, col, 3), dtype=np.uint8)
            shh = (rows - h) // 2
            shw = (col - w) // 2
            pix[shh : h + shh, shw : shw + w, :3] = cv2.resize(img, (w, h))[
                : max(h, rows), : max(w, col), :3
            ]
            imgs.append(pix)
        for i in range(0, rows + (rows & 1), 2):
            for img in imgs:
                for j in range(col):
                    first, *rest = img[i : i + 2, j]
                    [b1, g1, r1] = first
                    if rest:
                        first = rest[0]
                    else:
                        first = [0, 0, 0]
                    [b2, g2, r2] = first
                    print(
                        f"\033[48;2;{r1};{g1};{b1}m\033[38;2;{r2};{g2};{b2}m▄", end=""
                    )
            print("\033[0m")

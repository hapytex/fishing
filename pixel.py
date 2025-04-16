#!/usr/bin/python3

import json
import os
import sys

import cv2
import numpy as np

if __name__ == "__main__":
    col, __ = os.get_terminal_size()
    for arg in sys.argv[1:]:
        img = cv2.imread(arg)
        h, w, d = img.shape
        mulw = max(1, (w + col - 1) // col)
        h10 = h // mulw
        w20 = w // mulw
        img = (
            img[: mulw * h10, : mulw * w20]
            .reshape(h10, mulw, w20, mulw, -1)
            .swapaxes(1, 2)
        )
        pix = np.round(img.mean(axis=2).mean(axis=2)).astype(int)
        # bor = np.zeros((h10+(h10&1), w20, 3))
        # bor[:h10] = pix
        for i in range(0, h10 + (h10 & 1), 2):
            for j in range(w20):
                first, *rest = pix[i: i + 2, j]
                [b1, g1, r1] = first
                if rest:
                    first = rest[0]
                else:
                    first = [0, 0, 0]
                [b2, g2, r2] = first
                print(
                    f"\033[48;2;{r1};{g1};{b1}m\033[38;2;{r2};{g2};{b2}m▄", end="")
            print("\033[0m")

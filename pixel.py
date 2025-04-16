#!/usr/bin/python3

import json
import re
import sys
import cv2
import numpy as np

MUL_W = 2
MUL_H = 4

if __name__ == "__main__":
    for arg in sys.argv[1:]:
        img = cv2.imread(arg)
        h, w, d = img.shape
        h10 = h // MUL_H
        w20 = w // MUL_W
        img = (
            img[: MUL_H * h10, : MUL_W * w20]
            .reshape(h10, MUL_H, w20, MUL_W, -1)
            .swapaxes(1, 2)
        )
        pix = np.round(img.mean(axis=2).mean(axis=2)).astype(int)
        for i in range(h10):
            for j in range(w20):
                r, g, b = pix[i, j]
                print(f"\033[48;2;{r};{g};{b}m ", end="")
            print("\033[0m")

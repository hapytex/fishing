#!/bin/bash

sudo apt-get install apt-file fish rename git

pip3 --install --upgrade numpy pandas scipy sympy

# load the apt cache to find out what package exposes a certain command
sudo apt-file update

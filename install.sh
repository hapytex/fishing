#!/bin/bash

sudo apt-get install apt-file fish powerline rename

pip3 install --upgrade numpy pandas scipy sympy

# load the apt cache to find out what package exposes a certain command
sudo apt-file update

# Use powerline for fish
cat >> ~/.config/fish/config.fish <<EOF

set fish_function_path \$fish_function_path "/usr/share/powerline/bindings/fish"
source /usr/share/powerline/bindings/fish/powerline-setup.fish
powerline-setup
EOF

# Install Haskell support for vim
tmp=$(tempfile)
curl -L https://git.io/haskell-vim-now > "$tmp"
bash "$tmp"
rm -f "$tmp"

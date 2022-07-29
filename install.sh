#!/bin/bash

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get install apt-file agrep cloc curl djinn fish git hlint hoogle lambdabot nodejs npm pandoc pdfsam powerline pylint rename ulimit yarn

git config --global push.default current

pip3 install --upgrade black Click numpy pandas scipy sympy

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

stack update
hoogle generate
stack install ascii-art-to-unicode  # install ASCII-art to Unicode converter

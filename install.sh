#!/bin/bash

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo add-apt-repository ppa:tatokis/alarm-clock-applet

sudo apt-get update
sudo apt-get install -y alarm-clock-applet apt-file agrep certbot cloc curl djinn fish git git-filter-repo git-lfs haskell-stack hlint hoogle ipython3 jq lambdabot nodejs npm pandoc pdfsam powerline pylint python-wxtools python3-pytest rename sdate supervisor tig tox yarn zbar-tools xdotool
sudo snap install upscayl
git lfs install

git config --global push.default current


stack update &
pip3 install --upgrade black Click isort jinja2-cli jupyter keras nltk numpy pandas pip prefect pygments scipy sklearn sympy tabulate tensorflow youtube-dl &

# load the apt cache to find out what package exposes a certain command
sudo apt-file update

# Use powerline for fish
cat >> ~/.config/fish/config.fish <<EOF

set fish_function_path \$fish_function_path "/usr/share/powerline/bindings/fish"
source /usr/share/powerline/bindings/fish/powerline-setup.fish
powerline-setup
EOF

wait

# Install Haskell support for vim
tmp=$(tempfile)
curl -L https://git.io/haskell-vim-now > "$tmp"
bash "$tmp"
rm -f "$tmp"

# Install color plugin for vim
git clone https://github.com/ap/vim-css-color.git ~/.vim/pack/css-color/start/css-color

hoogle generate &
stack install ascii-art-to-unicode  # install ASCII-art to Unicode converter

sudo useradd prefect

cd /tmp
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts

wait

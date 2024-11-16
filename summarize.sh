#!/bin/bash

cat *.fish | grep -E -- '^function\s+[^\s]+.*--description.*$' | sed -E "s/function\s+([^ ]+).*--description[ =]*['\"]([^\"']*)['\"].*/ - **\`\\1\`**: \2;/g" # | diff --color=always -y - README.md

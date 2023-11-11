#!/bin/bash

for f in *.conf; do
  bn=$(basename "$f" '.conf')
  sudo ln -f "$f" "/etc/nginx/sites-enabled/"
  sudo ln -f "$f" "/etc/nginx/sites-available/$bn"
done

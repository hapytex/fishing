#!/bin/bash

sudo ln -f *.conf /etc/supervisor/conf.d/
sudo supervisorctl update

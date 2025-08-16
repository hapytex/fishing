#!/bin/bash

rm -rf .venv
virtualenv -p 3.12 .venv

. .venv/bin/activate

pip install -r requirements.txt

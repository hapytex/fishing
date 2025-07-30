#!/bin/bash

# can be added as cronjob, for example as:
#
#   00 10 01 * * /path/to/backup.sh measurements.json
#
# to backup asset files periodically (here every month)

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

dt=$(date '+%Y%m%d%H%M%S')

for f in "$@"; do
  gz="${dt}_${f}.gz"
  gzip -9 < "$f" > "$gz"
  chmod a-w -- "$gz"
  chattr +c -- "$gz"
done

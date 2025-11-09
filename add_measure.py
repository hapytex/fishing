#!/usr/bin/python3

import json
import re
import sys
from ast import literal_eval
from datetime import datetime
from shutil import move
import sqlite3
from peewee import DateTimeField, Model, SqliteDatabase, TextField

from color_pprint import cprint
from dateparser import parse
from filelock import FileLock

DURATION = re.compile(r"\d{1,2}([:]\d{2})+")
ASSET_PATH = "assets/measurements.db"

db = SqliteDatabase(ASSET_PATH)

class Measurement(Model):
    key = TextField()
    value = TextField()
    created_date = DateTimeField(default=datetime.now)

    class Meta:
        database = db


def to_rows(kv, key=''):
    if key:
        keyt = f'{key}.'
    else:
        keyt = ''
    if isinstance(kv, dict):
        for k, v in kv.items():
            if not isinstance(v, dict):
                yield parse(k), key, v
            else:
                yield from to_rows(v, key=f'{keyt}{k}')

with open('assets/measurements.json', 'rb') as f:
    data = json.load(f)
db.connect()
db.create_tables([Measurement])

for dt, ky, val in to_rows(data):
  Measurement.create(created_date=dt, key=ky, value=json.dumps(val))
exit(0)

if __name__ == "__main__":
    n = len(sys.argv)
    assert (
        n > 1
    ), "You should provide the name of the measurement and the corresponding value"
    with FileLock(f"{ASSET_PATH}.lock"):
        db.connect()
        db.create_tables([Measurement])
        key_dt = timestamp = datetime.now()
        dt = timestamp.isoformat()
        for i in range(1, n, 2):
            key = sys.argv[i]
            try:
                key, dt2 = key.rsplit("@", 1)
                timefilter = dt2 = parse(dt2).replace(tzinfo=None)
                if dt2 is not None:
                    key_dt = dt2.replace(tzinfo=None)
            except ValueError:
                # key is already fine
                timefilter = datetime.min
                key_dt = dt
            if n > i + 1:
                val = sys.argv[i + 1].strip()
                if DURATION.fullmatch(val.strip()):
                    d = 0
                    for di in val.split(":"):
                        d *= 60
                        d += int(di)
                    val = d
                else:
                    try:
                        val = literal_eval(val)
                    except (ValueError, SyntaxError):
                        try:
                            val = json.loads(val)
                        except ValueError:
                            pass  # keep it a string
                if val:  # None, False, etc. are all omitted
                    Measurement.create(created_date=key_dt, key=key, value=json.dumps(val))
            else:
                datum = {}
                for entry in Measurement.select().where(Measurement.key == key, Measurement.created_date >= timefilter.isoformat()):
                    datum[parse(entry.created_date).replace(microsecond=0)] = json.loads(entry.value)
                cprint(datum)

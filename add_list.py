#!/usr/bin/python3

import json
import re
import sys

from color_pprint import cprint
from filelock import FileLock

LIST_PATH = "list.json"
DEFAULT_NAME = "main"

if __name__ == "__main__":
    with FileLock(f"{LIST_PATH}.lock"):
        try:
            with open(LIST_PATH, "r") as f:
                data = json.load(f)
        except IOError:
            data = {}
        _def = {}
        if len(sys.argv) <= 1:
            list_name = DEFAULT_NAME
        else:
            list_name = sys.argv[1]
        list_names = list_name.split(".")
        for list_name in list_names[:-1]:
            data = data.setdefault(list_name, {})
        if list_names[-1]:
            my_list = data.setdefault(list_names[-1], [])
        else:
            # print all
            my_list = data
        if len(sys.argv) <= 2:
            cprint(my_list)
        else:
            for arg in sys.argv[2:]:
                if arg == "clear":
                    my_list.clear()
                else:
                    my_list += arg.split(",")
            with open(LIST_PATH, "w") as f:
                json.dump(data, f, indent=4)

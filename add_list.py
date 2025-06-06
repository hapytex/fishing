#!/usr/bin/python3

import json
import re
import sys
from shutil import move

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
        datum = data
        if len(sys.argv) <= 1:
            list_name = DEFAULT_NAME
        else:
            list_name = sys.argv[1]
        list_names = list_name.split(".")
        for list_name in list_names[:-1]:
            datum = datum.setdefault(list_name, {})
        if list_names[-1]:
            my_list = datum.setdefault(list_names[-1], [])
        else:
            # print all
            my_list = datum
        if len(sys.argv) <= 2:
            cprint(my_list)
        else:
            to_rem = set()
            for arg in sys.argv[2:]:
                if arg == "clear":
                    print("use CLEAR to clear")
                elif arg == "CLEAR":
                    my_list.clear()
                else:
                    items = arg.split(",")
                    for item in items:
                        if item.startswith("-"):
                            to_rem.add(item[1:])
                        else:
                            my_list.append(item)
            if to_rem:
                my_list[:] = [item for item in my_list if item not in to_rem]
            with open(f"{LIST_PATH}.tmp", "w") as f:
                json.dump(data, f, indent=4)
            move(f"{LIST_PATH}.tmp", LIST_PATH)

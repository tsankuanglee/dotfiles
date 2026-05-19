#!/usr/bin/env python3
"""
rename MacOS default screenshot filename to cleaner pattern
from
/Users/user/Desktop/Screenshot 2024-06-20 at 3.29.48 PM.png
to
/Users/user/Desktop/screenshot-20240620-152948.png
"""

import glob
from pathlib import Path
import os
import re

for filename in glob.glob(f"{Path.home()}/Desktop/Screenshot *.png"):
    if m := re.match("^(.*/)Screenshot (\d\d\d\d)-(\d\d)-(\d\d) at (\d+)\.(\d+)\.(\d+)(.*)\.png$", filename):
        (path, year, month, day, hour, minute, second, rest) = m.group(1, 2, 3, 4, 5, 6, 7, 8)
        year = int(year)
        month = int(month)
        hour = int(hour)
        minute = int(minute)
        second = int(second)
        if "PM" in rest:
            hour += 12
        rest = rest.replace("PM", "").replace("AM", "").strip()
        if len(rest):
            rest = f" {rest}"

        #print(year, month, day, hour, minute, second, rest)
        new_filename = f"{path}screenshot-{year}{month}{day}-{hour}{minute}{second}{rest}.png"
        os.rename(filename, new_filename)


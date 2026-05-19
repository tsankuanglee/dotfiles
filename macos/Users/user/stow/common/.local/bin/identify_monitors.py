#!/opt/homebrew/opt/coreutils/libexec/gnubin/env python3

import json
import subprocess

completedProcess = subprocess.run("system_profiler -json SPDisplaysDataType".split(" "), capture_output=True)
system_info = json.loads(str(completedProcess.stdout.decode()))

displays = None
for idx, card in enumerate(system_info["SPDisplaysDataType"]):
    if card["_name"] == "Apple M3 Max":
        displays = card["spdisplays_ndrvs"]
        break
if not displays:
    raise Exception("Can't find target card in system_info")

position_index_map = {}
for idx, display in enumerate(displays):

    output = ""

    if display["_name"] == "DELL P2419HC":
        # distinguish DELL left and right
        if display["_spdisplays_display-serial-number"].startswith("31323742"):
            position = "right"
        else:
            position = "left"
    elif display["_name"] == "Color LCD":
        position = "main"
    else:
        position = "middle"

    #print(f"""{idx+1} {position.ljust(10)} {display["_name"]}""")
    position_index_map[position] = idx+1

print(json.dumps(position_index_map))

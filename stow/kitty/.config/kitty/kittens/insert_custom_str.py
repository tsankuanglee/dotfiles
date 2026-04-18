from typing import List
import datetime
import os
import random
import re
import socket
import uuid


from kitty.boss import Boss
from kittens.tui.handler import result_handler

# --- REGEX PATTERNS ---
# UUID4: Standard 8-4-4-4-12 format
UUID4_RE = re.compile(r'[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}', re.I)
# IPv4: Standard dot-decimal
IPV4_RE = re.compile(r'\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b')

# IPv6: Handles standard, compressed (::), and mapped addresses
IPV6_RE = re.compile(
    r'(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|'          # 1:2:3:4:5:6:7:8
    r'([0-9a-fA-F]{1,4}:){1,7}:|'                         # 1:: or 1:2:3:4:5:6:7::
    r'([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|'         # 1::8 or 1:2:3:4:5:6::8
    r'([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|'  # 1::7:8
    r'([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|'  # 1::6:7:8
    r'([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|'  # 1::5:6:7:8
    r'([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|'  # 1::4:5:6:7:8
    r'[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|'       # 1::3:4:5:6:7:8
    r':((:[0-9a-fA-F]{1,4}){1,7}|:)|'                     # ::2:3:4:5:6:7:8 or ::
    r'fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|'     # link-local w/ zone index
    r'::(ffff(:0{1,4}){0,1}:){0,1}[^\s/:]+)',             # IPv4-mapped
    re.I
)
# MAC: Colon or dash separated hex
MAC_RE = re.compile(r'\b(?:[0-9A-Fa-f]{2}[:-]){5}(?:[0-9A-Fa-f]{2})\b')


def main(args: List[str]):
    pass
    # this is the main entry point of the kitten, it will be executed in
    # the overlay window when the kitten is launched
    #answer = input('Enter some text: ')
    # whatever this function returns will be available in the
    # handle_result() function
    #return answer


@result_handler(no_ui=True)
def handle_result(args: List[str], answer: str, target_window_id: int, boss: Boss) -> None:
    # get the kitty window into which to paste answer

    w = boss.window_id_map.get(target_window_id)

    if not w:
        return
    if args[1] == 'date':
        custom_str = datetime.datetime.now().strftime("%Y%m%d")
    elif args[1] == 'time':
        custom_str = datetime.datetime.now().strftime("%H%M%S")
    elif args[1] == 'datetime':
        custom_str = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
    elif args[1] == 'random_uuid':
        custom_str = str(uuid.uuid4())
    elif args[1] == 'random_float':
        custom_str = str(random.random())
    elif args[1] == 'obfuscation':
        # Fetch current clipboard text
        old_text = boss.clipboard.get_text()
        if not old_text:
            return
        custom_str = replace_uuids_with_randome_ones(old_text)
        custom_str = redact_username_and_network_info(custom_str)
        if not custom_str:
            return
    else:
        return

    w.paste_text(custom_str)

def replace_uuids_with_randome_ones(s):
    found_uuids = UUID4_RE.findall(s)
    if not found_uuids:
        return s

    # Map old UUIDs to new ones for consistency within this execution
    mapping = {u: str(uuid.uuid4()) for u in set(found_uuids)}

    # Perform the replacement
    new_text = s
    for old, new in mapping.items():
        new_text = new_text.replace(old, new)

    return new_text

def redact_username_and_network_info(s):
    if not s:
        return s

    # username
    current_user = os.getlogin()
    new_text = s.replace(current_user, "user")
    # hostname
    current_host = socket.gethostname()
    new_text = new_text.replace(current_host, "hostname")
    short_host = current_host.split('.')[0]
    new_text = new_text.replace(short_host, "hostname")

    # IPv4 replacement (Consistent mapping for clarity)
    found_v4 = set(IPV4_RE.findall(new_text))
    for i, ip in enumerate(found_v4):
        new_text = new_text.replace(ip, f"10.0.0.{i+10}")

    # IPv6 replacement
    # We find all matches, but filter out empty strings/false positives from the complex regex
    found_v6 = set(m[0] for m in IPV6_RE.findall(new_text) if m[0])
    for i, ip in enumerate(found_v6):
        new_text = new_text.replace(ip, f"fd00::dead:beef:{i+1}")

    # MAC address replacement
    found_macs = set(MAC_RE.findall(new_text))
    for mac in found_macs:
        new_text = new_text.replace(mac, "XX:XX:XX:XX:XX:XX")

    return new_text

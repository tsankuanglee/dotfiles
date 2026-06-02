#!/usr/bin/python

import argparse
import datetime
import subprocess
import time
from pathlib import Path

'''
Screenshot wrapper for both X11 and Wayland
'''

class Util:
    screenshot_file_path = f"{Path.home()}/Pictures/Screenshots"

    @classmethod
    def getFilename(cl):
        now = datetime.datetime.now()
        datetime_str= now.strftime("%Y%m%d-%H%M%S")
        return f"{cl.screenshot_file_path}/Screenshot-{datetime_str}.png"

    @classmethod
    def runCommandSilently(cl, cmd, pipedToCmd=None, contentToPipe=None):
        """
        if contentToPipe is not None, then pipe content into cmd
        if pipedToCmd is not None, then pipe cmd's output to pipedToCmd
        """
        if contentToPipe:
            p1 = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=None)
            out1, err1 = p1.communicate(input=contentToPipe)
        else:
            p1 = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=None)
            out1, err1 = p1.communicate()
        p1.stdout.close()

        if pipedToCmd:
            out1, err1 = p1.communicate()
            p1.stdout.close()

            p2 = subprocess.Popen(pipedToCmd, stdin=subprocess.PIPE, stdout=None, stderr=None)
            out2, err2 = p2.communicate(input=out1)
            p2.stdin.close()
        return out1

    @classmethod
    def x11_or_wayland(cl):
        return cl.runCommandSilently([
            "/usr/bin/bash",
            "-c",
            "loginctl show-session $(loginctl | grep $(whoami) | awk '{print $1}') -p Type | sed 's/Type=//g' | grep --color=never wayland | head -1"
        ]).decode("utf-8").strip()


class X11:

    maim_bin_path = "/usr/bin/maim"
    xclip_bin_path = "/usr/bin/xclip"
    xdotool_bin_path = "/usr/bin/xdotool"

    def get_active_window_id(self):
        content = Util.runCommandSilently(
            [self.xdotool_bin_path, "getactivewindow"],
        )
        return content

    def go(self, args):
        parameters = []
        if args.delay:
            parameters += [f"--delay={float(args.delay)}"]
        if args.source:
            #--xdisplay=hostname:number.screen_number
            if args.source == "left":
                parameters += ["-g", "1152x2048+0+0"]
            elif args.source == "middle":
                parameters += ["-g", "1920x1080+1152+420"]
            elif args.source == "right":
                parameters += ["-g", "1080x1920+3072+0"]
            elif args.source == "all":
                pass
            elif args.source == "active_window":
                parameters += ["--window", get_active_window_id()]
            elif args.source == "select":
                parameters += ["--select"]

        # copy to clipboard
        if args.target in ["clipboard", "both"]:
            content = Util.runCommandSilently(
                [self.maim_bin_path] + parameters,
                [self.xclip_bin_path,
                    "-selection", "clipboard",
                    "-t", "image/png"]
            )

            if args.target == "both":
                with open(Util.getFilename(), "wb") as f:
                    f.write(content)
        elif args.target == "file":
            Util.runCommandSilently(
                [self.maim_bin_path] + parameters + [Util.getFilename()],
            )

class Wayland():
    """
    `man slurp` to see hotkeys during selection
    """

    paths = {
        "capture": "/usr/bin/grim",
        "clip": "/usr/bin/wl-copy",
        "slurp": "/usr/bin/slurp",
        "wl-copy": "/usr/bin/wl-copy",
        "bash": "/usr/bin/bash",
    }

    @classmethod
    def get_active_monitor(cl):
        return Util.runCommandSilently([
            cl.paths["bash"],
            "-c",
            "swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name' "
        ]).decode("utf-8").strip()

    @classmethod
    def get_active_window(cl):
        return Util.runCommandSilently([
            cl.paths["bash"],
            "-c",
            """swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "(.x),(.y) (.width)x(.height)"' """
            #"""swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"' """
        ]).decode("utf-8").strip()

    @classmethod
    def get_slurp_info(cl):
        return Util.runCommandSilently([
            cl.paths["slurp"],
        ]).decode("utf-8").strip()

    def go(self, args):
        parameters = []
        if args.source:
            #--xdisplay=hostname:number.screen_number
            if args.source == "left":
                parameters += ["-o", "DVI-D-1"]
            elif args.source == "middle":
                parameters += ["-o", "DP-1"]
            elif args.source == "right":
                parameters += ["-o", "HDMI-A-1"]
            elif args.source == "active_monitor":
                parameters += ["-o", self.get_active_monitor()]
            elif args.source == "all":
                pass
            elif args.source == "active_window":
                parameters += ["-g", self.get_active_window()]
            elif args.source == "select":
                slurp_result = self.get_slurp_info()
                if slurp_result == "selection cancelled":
                    return
                parameters += ["-g", slurp_result]

        if args.delay:
            time.sleep(float(args.delay))

        content = Util.runCommandSilently(
            cmd=[
                self.paths["capture"],
                *parameters,
                "-",
            ]
        )

        if args.target in ["file", "both"]:
            with open(Util.getFilename(), "wb") as f:
                f.write(content)

        if args.target in ["clipboard", "both"]:
            content = Util.runCommandSilently(
                cmd=[
                    self.paths["wl-copy"],
                    "--type", "image/png"
                ],
                contentToPipe=content
            )


def parse():
    parser = argparse.ArgumentParser(description="screenshot utility")

    parser.add_argument("-t", "--target", default="file", choices=["clipboard", "file", "both"], help="[clipboard | file (default) | both]")
    parser.add_argument("-c", "--source", default="middle", choices=["left", "middle", "right", "all", "active_monitor", "active_window", "select"], help="source: left | middle (default) | right | active_monitor | all | active_window | select")
    parser.add_argument("-d", "--delay", nargs="?", const=0.0, type=float, help="0 (default) 0.5 1.0 1.5 2.2 ... (seconds in float)")

    args = parser.parse_args()

    if not args.delay:
        args.delay = 0

    if Util.x11_or_wayland() == "wayland":
        Wayland().go(args)
    else:
        X11().go(args)

if __name__ == '__main__':
    parse()

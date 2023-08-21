#!/usr/bin/python3 

import json
import subprocess
import sys

RIGHT = ["yabai", "-m", "window", "--focus", "east"]
DISPLAY_RIGHT = ["yabai", "-m", "display", "--focus", "2"]
DISPLAYS = ["yabai", "-m", "query", "--displays"]
SPACES = ["yabai", "-m", "query", "--spaces"]

display_check = subprocess.run(
    DISPLAYS,
    stdout=subprocess.PIPE, 
    stderr=subprocess.PIPE,
    text=True
)

display_query = json.loads(display_check.stdout)

#If only one display, just go right
if len(display_query) <= 1:
    subprocess.run(RIGHT)
    sys.exit()

#If two displays, find focused space
list_all_spaces = subprocess.run(
    SPACES,
    stdout=subprocess.PIPE, 
    stderr=subprocess.PIPE, 
    text=True
)

list_all_spaces = json.loads(list_all_spaces.stdout)

current_space = None
for space in list_all_spaces:
    if space["has-focus"]:
        current_space = space["index"]

if not current_space:
    subprocess.run(RIGHT)
    sys.exit()

windows_in_current_space = subprocess.run(
    ["yabai", "-m", "query", "--windows", "--space", str(current_space)],
    stdout=subprocess.PIPE, 
    stderr=subprocess.PIPE, 
    text=True
)

windows_in_current_space = json.loads(windows_in_current_space.stdout)

focused_window = None
for window in windows_in_current_space:
    if window["has-focus"]:
        focused_window = window

maximum_x = True
for w in windows_in_current_space:
    if focused_window.get("frame").get("x") < w.get("frame").get("x"):
        maximum_x = False

if maximum_x:
    subprocess.run(DISPLAY_RIGHT)
    sys.exit()

subprocess.run(RIGHT)
sys.exit()

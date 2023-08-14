#!/usr/bin/python3 

import json
import subprocess
import sys

LEFT = ["yabai", "-m", "window", "--focus", "west"]
DISPLAY_LEFT = ["yabai", "-m", "display", "--focus", "1"]
DISPLAYS = ["yabai", "-m", "query", "--displays"]
SPACES = ["yabai", "-m", "query", "--spaces"]

display_check = subprocess.run(
    DISPLAYS,
    stdout=subprocess.PIPE, 
    stderr=subprocess.PIPE,
    text=True
)

display_query = json.loads(display_check.stdout)

#If only one display, just go left
if len(display_query) <= 1:
    subprocess.run(LEFT)
    sys.exit()

print('more than 1')
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
    subprocess.run(LEFT)
    sys.exit()

print(f'current_space {current_space}')

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

print(f'focused {focused_window}')

minimum_x = True
print(focused_window.get("frame").get("x"))
for w in windows_in_current_space:
    print(w.get("frame").get("x"))
    if focused_window.get("frame").get("x") > w.get("frame").get("x"):
        minimum_x = False

if minimum_x:
    print('minimum')
    subprocess.run(DISPLAY_LEFT)
    sys.exit()

print('not minimum')
subprocess.run(LEFT)
sys.exit()

#!/bin/bash

CONNECTED=$(xrandr --query | awk '$2 == "connected" && $1 != "eDP-1" { print $1}')

FIRST=$(echo $CONNECTED | head -1)
SECOND=$(echo $CONNECTED | tail -1)

echo $EXTERNAL

xrandr --output $FIRST --auto --primary --output $SECOND --auto --right-of $FIRST

#!/bin/bash
CONNECTED=$(xrandr --query | awk '$2 == "connected" && $1 != "eDP-1" { print $1}')

INTERNAL="eDP-1"
RIGHT=$(echo $CONNECTED | cut -d " " -f 1)
LEFT=$(echo $CONNECTED | cut -d " " -f 2)

xrandr --output $INTERNAL --auto --output $LEFT --auto --primary --left-of $INTERNAL --output $RIGHT --auto --right-of $INTERNAL

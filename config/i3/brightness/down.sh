#!/bin/bash
FIRST=$(xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' ')
SECOND="0.1"
COUNT=$(bc <<< "$FIRST - $SECOND")
xrandr --output eDP-1 --brightness $COUNT

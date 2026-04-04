#!/usr/bin/env bash
# Usage: focus-or-slide.sh <left|right>
# Tries to focus in the given direction. If the focused window doesn't change
# (i.e. we're at the edge), slide to the prev/next workspace instead.

direction="$1"

if [[ "$direction" == "left" ]]; then
    ws_direction="prev"
elif [[ "$direction" == "right" ]]; then
    ws_direction="next"
else
    exit 1
fi

before=$(aerospace list-windows --focused --format '%{window-id}' 2>/dev/null)
aerospace focus "$direction" 2>/dev/null
after=$(aerospace list-windows --focused --format '%{window-id}' 2>/dev/null)

if [[ "$before" == "$after" ]]; then
    aerospace workspace "$ws_direction"
fi

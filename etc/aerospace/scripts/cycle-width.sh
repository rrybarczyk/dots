#!/usr/bin/env bash
# Cycles through preset column widths like niri's Mod+R (switch-preset-column-width)
# Presets: 1/2, 2/3, 1/3 of screen width (accounting for gaps)

STATE_FILE="/tmp/aerospace-width-state"
SCREEN_WIDTH=1470
GAPS=24  # 8px inner + 8px outer on each side

USABLE=$((SCREEN_WIDTH - GAPS))

# Preset widths: ~50%, ~66%, ~33%
W_HALF=$((USABLE / 2))
W_TWO_THIRDS=$((USABLE * 2 / 3))
W_ONE_THIRD=$((USABLE / 3))

# Read current state (0, 1, or 2)
state=0
if [[ -f "$STATE_FILE" ]]; then
    state=$(cat "$STATE_FILE")
fi

# Cycle to next state
next_state=$(( (state + 1) % 3 ))

case $next_state in
    0) width=$W_HALF ;;
    1) width=$W_TWO_THIRDS ;;
    2) width=$W_ONE_THIRD ;;
esac

echo "$next_state" > "$STATE_FILE"
aerospace resize width "$width"

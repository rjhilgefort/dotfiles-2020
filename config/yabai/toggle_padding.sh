#!/bin/bash
LOG=/tmp/toggle_padding.log
echo "=== $(date) ===" > "$LOG"

yabai -m space --toggle padding
yabai -m space --toggle gap

DISPLAY_COUNT=$(yabai -m query --displays | jq 'length')
echo "displays: $DISPLAY_COUNT" >> "$LOG"
[ "$DISPLAY_COUNT" -le 1 ] && exit 0

CUR_PAD=$(yabai -m query --spaces --space | jq '."top-padding"')
CUR_SPACE=$(yabai -m query --spaces --space | jq '.index')
echo "cur_space: $CUR_SPACE  cur_pad: $CUR_PAD" >> "$LOG"

VISIBLE=$(yabai -m query --spaces | jq -r '.[] | select(."is-visible" == true) | "\(.index):\(."top-padding")"')
echo "visible spaces: $VISIBLE" >> "$LOG"

for info in $VISIBLE; do
    SID="${info%%:*}"
    OPAD="${info##*:}"
    echo "  checking space $SID (pad=$OPAD)" >> "$LOG"
    [ "$SID" = "$CUR_SPACE" ] && { echo "  skipping (current)" >> "$LOG"; continue; }
    if [ "$CUR_PAD" != "$OPAD" ]; then
        echo "  toggling space $SID" >> "$LOG"
        yabai -m space "$SID" --toggle padding >> "$LOG" 2>&1
        yabai -m space "$SID" --toggle gap >> "$LOG" 2>&1
    else
        echo "  already matches" >> "$LOG"
    fi
done

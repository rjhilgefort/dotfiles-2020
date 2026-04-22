#!/bin/bash
# Toggle padding/gap on current space, then sync all other visible spaces to match

yabai -m space --toggle padding
yabai -m space --toggle gap

DISPLAY_COUNT=$(yabai -m query --displays | jq 'length')
[ "$DISPLAY_COUNT" -le 1 ] && exit 0

CUR_PAD=$(yabai -m query --spaces --space | jq '."top-padding"')
CUR_SPACE=$(yabai -m query --spaces --space | jq '.index')

# Find all visible spaces and sync padding to match current
for info in $(yabai -m query --spaces | jq -r '.[] | select(."is-visible" == true) | "\(.index):\(."top-padding")"'); do
    SID="${info%%:*}"
    OPAD="${info##*:}"
    [ "$SID" = "$CUR_SPACE" ] && continue
    if [ "$CUR_PAD" != "$OPAD" ]; then
        yabai -m space "$SID" --toggle padding
        yabai -m space "$SID" --toggle gap
    fi
done

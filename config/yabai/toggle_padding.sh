#!/bin/bash
# Toggle padding/gap on current space, then sync other displays to match

yabai -m space --toggle padding
yabai -m space --toggle gap

CUR_PAD=$(yabai -m query --spaces --space | jq '."top-padding"')
CUR_DIS=$(yabai -m query --displays --display | jq '.index')

for did in $(yabai -m query --displays | jq -r '.[].index'); do
    [ "$did" = "$CUR_DIS" ] && continue
    SID=$(yabai -m query --spaces --display "$did" | jq -r '.[] | select(."has-focus") | .index')
    [ -z "$SID" ] && continue
    OPAD=$(yabai -m query --spaces --space "$SID" | jq '."top-padding"')
    if [ "$CUR_PAD" != "$OPAD" ]; then
        yabai -m space "$SID" --toggle padding
        yabai -m space "$SID" --toggle gap
    fi
done

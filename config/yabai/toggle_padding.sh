#!/bin/bash
# Toggle padding/gap on ALL visible spaces (one per display) simultaneously
for space in $(yabai -m query --spaces | jq -r '.[] | select(."is-visible" == true) | .index'); do
    yabai -m space "$space" --toggle padding
    yabai -m space "$space" --toggle gap
done

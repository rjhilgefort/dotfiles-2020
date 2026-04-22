#!/bin/bash
# Sync spaces across displays: switching to space N on one display
# switches the other display(s) to their Nth space too.
# Uses a lock file to prevent infinite recursion from the signal.

LOCK="/tmp/yabai_sync_spaces.lock"
[ -f "$LOCK" ] && exit 0
touch "$LOCK"
trap "rm -f $LOCK" EXIT

DISPLAY_COUNT=$(yabai -m query --displays | jq 'length')
[ "$DISPLAY_COUNT" -le 1 ] && exit 0

CURRENT_DISPLAY=$(yabai -m query --displays --display | jq '.index')

# Get the relative index of the focused space on the current display
CURRENT_SPACE_REL=$(yabai -m query --spaces --display | jq '[to_entries[] | select(.value."has-focus")] | .[0].key')

# Switch each other display to its corresponding relative space
for display in $(yabai -m query --displays | jq -r '.[].index'); do
    [ "$display" = "$CURRENT_DISPLAY" ] && continue
    TARGET=$(yabai -m query --spaces --display "$display" | jq -r ".[$CURRENT_SPACE_REL].index // empty")
    [ -n "$TARGET" ] && yabai -m space --focus "$TARGET"
done

# Refocus original display
yabai -m display --focus "$CURRENT_DISPLAY"

#!/bin/bash
# Usage: focus_cycle.sh <h|j|k|l>
# Unified stack cycling across displays.
# BSP: directional focus with display fallback.
# Stack: h/j=prev, k/l=next — cross-display at stack edges,
#        landing at the correct end of the other display's stack.

VIMDIR=$1
LAYOUT=$(yabai -m query --spaces --space | jq -re '.type')
DISPLAY_COUNT=$(yabai -m query --displays | jq 'length')

if [ "$LAYOUT" = "bsp" ]; then
    case $VIMDIR in
        h) yabai -m window --focus west || yabai -m display --focus west ;;
        j) yabai -m window --focus south || yabai -m display --focus south ;;
        k) yabai -m window --focus north || yabai -m display --focus north ;;
        l) yabai -m window --focus east || yabai -m display --focus east ;;
    esac
    exit 0
fi

# Stack mode: h/j=prev, k/l=next
case $VIMDIR in
    h|j) STACK_DIR="prev"; STACK_WRAP="last"; ARRIVE_AT="last" ;;
    k|l) STACK_DIR="next"; STACK_WRAP="first"; ARRIVE_AT="first" ;;
esac

# Try moving within the current stack
if yabai -m window --focus "stack.$STACK_DIR" 2>/dev/null; then
    exit 0
fi

# At edge of stack — cross to other display or wrap
if [ "$DISPLAY_COUNT" -gt 1 ]; then
    if yabai -m display --focus next 2>/dev/null || yabai -m display --focus prev 2>/dev/null; then
        # Land at the correct end of the other display's stack
        yabai -m window --focus "stack.$ARRIVE_AT" 2>/dev/null
    fi
else
    # Single display — wrap around
    yabai -m window --focus "stack.$STACK_WRAP"
fi

#!/bin/bash
# Usage: focus_cycle.sh <h|j|k|l>
# Unified stack cycling across displays.
# BSP: directional focus with display fallback.
# Stack: h/j=prev, k/l=next.
# After crossing displays, lands at the correct end of the target's stack.

VIMDIR=$1
LAYOUT=$(yabai -m query --spaces --space | jq -re '.type')
DISPLAY_COUNT=$(yabai -m query --displays | jq 'length')

# Try to navigate within current space
MOVED=false
if [ "$LAYOUT" = "bsp" ]; then
    case $VIMDIR in
        h) yabai -m window --focus west 2>/dev/null && MOVED=true ;;
        j) yabai -m window --focus south 2>/dev/null && MOVED=true ;;
        k) yabai -m window --focus north 2>/dev/null && MOVED=true ;;
        l) yabai -m window --focus east 2>/dev/null && MOVED=true ;;
    esac
else
    case $VIMDIR in
        h|j) yabai -m window --focus stack.prev 2>/dev/null && MOVED=true ;;
        k|l) yabai -m window --focus stack.next 2>/dev/null && MOVED=true ;;
    esac
fi

$MOVED && exit 0

# Couldn't move within current space — try crossing displays
if [ "$DISPLAY_COUNT" -gt 1 ]; then
    case $VIMDIR in
        h) yabai -m display --focus west 2>/dev/null || yabai -m display --focus prev 2>/dev/null || yabai -m display --focus next 2>/dev/null ;;
        j) yabai -m display --focus south 2>/dev/null || yabai -m display --focus prev 2>/dev/null || yabai -m display --focus next 2>/dev/null ;;
        k) yabai -m display --focus north 2>/dev/null || yabai -m display --focus next 2>/dev/null || yabai -m display --focus prev 2>/dev/null ;;
        l) yabai -m display --focus east 2>/dev/null || yabai -m display --focus next 2>/dev/null || yabai -m display --focus prev 2>/dev/null ;;
    esac
    # Land at the correct end of the target's stack
    case $VIMDIR in
        h|j) yabai -m window --focus stack.last 2>/dev/null ;;
        k|l) yabai -m window --focus stack.first 2>/dev/null ;;
    esac
else
    # Single display — wrap stack
    case $VIMDIR in
        h|j) yabai -m window --focus stack.last 2>/dev/null ;;
        k|l) yabai -m window --focus stack.first 2>/dev/null ;;
    esac
fi

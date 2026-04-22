#!/bin/bash
# Toggle workspace sync signal on/off

if yabai -m signal --list | grep -q sync_spaces; then
    yabai -m signal --remove sync_spaces
    terminal-notifier -title "Yabai" -message "Workspace sync OFF"
else
    yabai -m signal --add event=space_changed action="$HOME/.config/yabai/sync_spaces.sh" label=sync_spaces
    terminal-notifier -title "Yabai" -message "Workspace sync ON"
fi

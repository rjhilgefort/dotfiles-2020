#!/bin/bash
# Move focused window to other display and follow focus
(yabai -m window --display next && yabai -m display --focus next) || \
(yabai -m window --display prev && yabai -m display --focus prev)

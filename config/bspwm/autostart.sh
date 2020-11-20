#!/bin/zsh

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
# RJH Note: I'm configuring this in /etc/X11/xorg.conf.d/10-monitor.conf

$HOME/.config/polybar/launch.sh &

# Keyboard settings
# TODO: This seems to get dropped after suspend or lid closed
xset r rate 150 50
#setxkbmap -layout be

dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
xsetroot -cursor_name left_ptr &
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

# Setup wallpaper
# TODO: Explore variety, nitrogen, etc.
run ~/.scripts/feh-randomizer ~/Store/Images/Wallpaper-Active/ 1m

# Setup lockscreen image
run ~/.scripts/betterlockscreen-randomizer ~/Store/Images/Wallpaper-Active/ 10m 

### Background Apps
# conky -c $HOME/.config/bspwm/system-overview &
run variety &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
picom --config $HOME/.config/bspwm/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
run volumeicon &
# run synology-drive &
run copyq &
run flameshot &
run rescuetime &
run logid &

### Foreground Apps
run termite &
run code &
run firefox &
run discord &
run slack &
run caprine &
run android-messages-desktop &
run todoist-nativefier &
run TogglDesktop &
run 1password &
run spotify &
run notion-app &

#nitrogen --restore &
#run emacs &
#run thunar &
#run caffeine &

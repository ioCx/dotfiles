﻿#!/bin/sh
#
# ~/.xinitrc
#

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

xhost +local:0 > /dev/null
#[ "$(cat /sys/class/power_supply/ACAD/online)" = "1" ] && /usr/sbin/pm-powersave false || /usr/sbin/pm-powersave true

# xsettings
xrdb ~/.Xresources &
xset fp+ /usr/share/fonts/local &
xset r rate 250 30 & # Keyboard repeat rate
xset +dpms &
xset dpms 0 0 600 &

# Set Mouse Pointer. xmonad does not do this
xsetroot -cursor_name left_ptr &

# Allow us to kill X with the standard keys
setxkbmap -option terminate:ctrl_alt_bksp &
#xmodmap -e "keycode 135 = Menu" &
xmodmap -e "keysym Menu = Super_R" &
#xmodmap -e "!add Super = Super_r"
#xmodmap -e 'keycode 135 = Super_R' &

# Monitors
xrandr --output LVDS1 --mode 1366x768 --primary
xrandr --output VGA1 --mode 1920x1080 --right-of LVDS1

# Set Background
# eval $(cat $HOME/.fehbg) &
feh --bg-fill $(find /home/sanford/shared/wallpapers/current -type f | shuf -n1)

# start terminal emulation daemon
/usr/bin/urxvtd -q -o -f &

# f.lux
#xflux -z 98144 -l 47.6063889 -g -122.3308333

#ibus-daemon -d -x &

#while true; do
#    xsetroot -name "$(date +"%a %d.%m // %I:%M %P")"
#    sleep 1m
#done &

#wmname LG3D &

# Start Window Manager
# exec startfluxbox
# exec openbox-session
# exec awesome
# exec dwm
# exec xmonad
# exec dwm
# exec xmonad
# exec dwm
exec xmonad


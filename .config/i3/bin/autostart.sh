#!/usr/bin/env bash

## Copyright (C) 2020-2021 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3
## Autostart Programs

# Kill already running process
_ps=(picom dunst xfce-polkit xfce4-power-manager blueman-applet nm-applet xsettingsd)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done
libinput-gestures-setup stop

setxkbmap -layout "us,ru"
setxkbmap -option "grp:caps_toggle,grp_led:scroll,compose:ralt"

libinput-gestures-setup start

# Lauch xsettingsd daemon
xsettingsd &

# Fix cursor
xsetroot -cursor_name left_ptr

# Polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

# Enable power management
xfce4-power-manager &

# Restore wallpaper
hsetroot -cover ~/.config/i3/wallpapers/bg.jpg

# Lauch notification daemon
~/.config/i3/bin/i3dunst.sh

# Lauch polybar
~/.config/i3/bin/i3bar.sh

# Lauch compositor
~/.config/i3/bin/i3comp.sh

# Launch audio daemon
if [[ ! `pidof pulseaudio` ]]; then
	pulseaudio &
fi
if [[ ! `pidof playerctld` ]]; then
	playerctld &
fi

# Connectivity applets
blueman-applet &
nm-applet &


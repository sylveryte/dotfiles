#!/bin/bash

ACTION=$(echo -e "dark\nlight\ntoggle_waybar"| fuzzel --dmenu "Choose:")

if [ "$ACTION" == "dark" ]; then
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
elif  [ "$ACTION" == "light" ]; then
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
fi
elif  [ "$ACTION" == "toggle_waybar" ]; then
  killall -SIGUSR1 waybar
fi

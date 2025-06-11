#!/bin/bash

ACTION=$(echo -e "dark\nlight\nlaptop_monitor_off\nlaptop_monitor_on"| fuzzel --dmenu "Choose:")

case "$ACTION" in
  "dark")
      # Set mode for GTK3 applications. Install arc-gtk-theme, because there is no Adwaita-dark theme anymore
          gsettings set org.gnome.desktop.interface gtk-theme Arc-Dark
      # Set mode for GTK4 applications
          niri msg action do-screen-transition && gsettings set org.gnome.desktop.interface color-scheme prefer-dark

      # Switch wallpaper
          ln -sf "$HOME"/Pictures/wally/wall_dark.* "$HOME"/Pictures/wally/wall
          systemctl restart --user swaybg
      # # Set brightness
      #     brightnessctl -q s 12
      # Set mako
          makoctl mode -s dark
      # Set fuzzel
          ln -sf "$HOME"/.config/fuzzel/dark_fuzzel.ini "$HOME"/.config/fuzzel/fuzzel.ini

      # Notification (for debug purposes)
          notify-send -c "system" "  Dark mode"
    ;;
    "light")
      # Make sure that you set env variable QT_QPA_PLATFORMTHEME=gtk3 for QT applications
      # Set mode for GTK3 applications
          gsettings set org.gnome.desktop.interface gtk-theme Adwaita
      # Set mode for GTK4 applications
          niri msg action do-screen-transition && gsettings set org.gnome.desktop.interface color-scheme prefer-light

      # Switch wallpaper
          ln -sf "$HOME"/Pictures/wally/wall_light.* "$HOME"/Pictures/wally/wall
          systemctl restart --user swaybg
      # # Set brightness
      #     brightnessctl -q s 14
      # Set mako
          makoctl mode -r dark
      # Set fuzzel
          ln -sf "$HOME"/.config/fuzzel/light_fuzzel.ini "$HOME"/.config/fuzzel/fuzzel.ini

      # Notification
          notify-send -c "system" "  Light mode"
    ;;
    "laptop_monitor_off")
      niri msg output eDP-1 off
      notify-send "Turing off"
    ;;
    "laptop_monitor_on")
    niri msg output eDP-1 on
    notify-send "Turing on"
  ;;
esac

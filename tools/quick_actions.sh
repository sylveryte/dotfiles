#!/bin/bash

THEME=$(echo -e "dark\nlight"| rofi -matching fuzzy -dmenu -p "Choose:")

if [ "$THEME" == "dark" ]; then
  plasma-apply-lookandfeel -a com.github.vinceliuice.WhiteSur-dark && plasma-apply-cursortheme oreo_blue_cursors
elif  [ "$THEME" == "light" ]; then
  plasma-apply-lookandfeel -a com.github.vinceliuice.WhiteSur-alt && plasma-apply-cursortheme oreo_blue_cursors
fi

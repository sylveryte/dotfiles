
#! /bin/sh
#
# screenshot.sh
# Copyright (C) 2025 sylveryte <sylveryte@gazelle>
#
# Distributed under terms of the MIT license.
#

case "$1" in
	"swappyshot")
		grim -g "$(slurp)" - | swappy -f -
		;;
	"sattyshot")
    grim -g "$(slurp)" - | satty -f - --fullscreen --init-tool arrow --annotation-size-factor 0.7 --no-window-decoration --actions-on-enter save-to-clipboard --actions-on-enter exit  --copy-command wl-copy --actions-on-right-click save-to-file --output-filename ~/Pictures/Screenshots/$(date +"%Y_%m_%d_%H_%M_%S").png
		;;
  "colorpick")
    zenity --color-selection
    ;;
esac

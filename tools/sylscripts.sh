#! /bin/sh
#
# sylscripts.sh
# Copyright (C) 2020 sylveryte <sylveryte@gazelle>
#
# Distributed under terms of the MIT license.
#

case "$(printf "music\nscreenshot\nbluetooth\nwallpaper\ntransparency" | dmenu)" in
	"music")
		~/sylveryte/dotfiles/tools/music.sh
		;;
	"screenshot")
		~/sylveryte/dotfiles/tools/screenshot.sh
		;;
	"wallpaper")
		~/sylveryte/dotfiles/tools/changewal.sh
		;;
	"transparency")
		~/sylveryte/dotfiles/tools/transparency.sh
		;;
	"bluetooth")
		~/sylveryte/dotfiles/tools/bluetooth.sh
		;;
esac

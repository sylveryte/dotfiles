#! /bin/sh
#
# sylscripts.sh
# Copyright (C) 2020 sylveryte <sylveryte@gazelle>
#
# Distributed under terms of the MIT license.
#

case "$(printf "music on\nwallpaper\ntransparency\nmusic off" | dmenu)" in
	"music on")
		~/sylveryte/dotfiles/tools/music.sh
		;;
	"wallpaper")
		~/sylveryte/dotfiles/tools/changewal.sh
		;;
	"transparency")
		~/sylveryte/dotfiles/tools/transparency.sh
		;;
	"music off")
		~/sylveryte/dotfiles/tools/music.sh off
		;;
esac

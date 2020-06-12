file=$(ls -d -1 /home/sylveryte/sylveryte/dotfiles/.remindme/* | sort -R | tail -1)
case "$(printf "playlist\non\noff" | dmenu -p "bluetooth")" in
	"off")
		msg="Music down :("
		mpc stop
		killall mpd-notification
		killall mpd
		;;
	"on")
		mpd
		mpd-notification -m /home/sylveryte/music -s 200 &
		mpc load all
		msg="Music Up :)"
		mpc random on
		mpc play
		;;
	"playlist")
		pl=$(mpc lsplaylists | dmenu -p "select playlist")
		msg="Playing $pl playlist"
		mpc clear
		mpc load $pl
		;;
esac

dunstify -t 5000 -i $file -a "Music MPD" "$msg" </dev/null &>/dev/null &

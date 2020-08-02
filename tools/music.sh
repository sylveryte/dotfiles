file=$(ls -d -1 /home/sylveryte/sylveryte/dotfiles/.remindme/* | sort -R | tail -1)
case "$(printf "playlist\non\noff\nloop1on\nloop1off" | dmenu -p "bluetooth")" in
	"off")
		msg="Music down :("
		mpc stop
		killall mpd-notification
		killall mpd
		;;
	"on")
		mpd
		mpd-notification -m /home/sylveryte/music -s 200 &
		mpc load pop
		msg="Music Up :)"
		mpc shuffle
		mpc play
		;;
	"playlist")
		pl=$(mpc lsplaylists | dmenu -p "select playlist")
		msg="Playing $pl playlist"
		mpc clear
		mpc load $pl
		mpc shuffle
		mpc play
		;;
	"loop1on")
		mpc single on
		mpc repeat on
		msg="Looping current song"
		;;
	"loop1off")
		mpc single off
		msg="Looping one song off"
		;;
esac

dunstify -t 5000 -i $file -a "Music MPD" "$msg" </dev/null &>/dev/null &

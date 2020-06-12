file=$(ls -d -1 /home/sylveryte/sylveryte/dotfiles/.remindme/* | sort -R | tail -1)
case "$1" in
	"off")
		msg="Music down :("
		mpc stop
		killall mpd
		killall mpd-notification
		;;
	*)
		mpd
		mpd-notification -m /home/sylveryte/music -s 200 &
		mpc load all
		msg="Music Up :)"
		mpc random on
		mpc play
		;;
esac

dunstify -t 5000 -i $file -a "Music MPD" "$msg" </dev/null &>/dev/null &

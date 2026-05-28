SYLWAL=/tmp/sylwal.jpg

copy_wallpaper(){
	# mkdir -p -- "$SYLWAL"
	echo "copying $1 to $SYLWAL"
	cp $1 $SYLWAL
}

apply_wallpaper(){
	feh --bg-fill $1
	# dunstify -t 5000 -i $1 -a 'Wal ' "Wall applied is -> "
}

if [ -n "$1" ]
then
	c=$1
else
	c=$(printf "manual generic\nmanual story\nall\ngeneric\nstory" | dmenu)
fi
case "$c" in
	"generic")
		apply_wallpaper $(find /home/sylveryte/Pictures/Wallpapers/generic/* -type f | sort -R  | head -n 1)
		;;
	"story")
		WAL=$(find /home/sylveryte/Pictures/Wallpapers/story/* -type f | sort -R  | head -n 1)
		apply_wallpaper $WAL
		copy_wallpaper $WAL
		;;
	"all")
		sxiv -ftr ~/Pictures/Wallpapers
		;;
	"manual story")
		sxiv -ftr ~/Pictures/Wallpapers/story
		;;
	"manual generic")
		sxiv -ftr ~/Pictures/Wallpapers/generic
		;;
	"open")
		sxiv -fb $SYLWAL
		;;
esac

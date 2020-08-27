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
		apply_wallpaper $(ls /home/sylveryte/Pictures/Wallpapers/generic/* | sort -R  | head -n 1)
		;;
	"story")
		apply_wallpaper $(ls /home/sylveryte/Pictures/Wallpapers/story/* | sort -R  | head -n 1)
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
esac

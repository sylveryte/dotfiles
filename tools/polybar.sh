isOn=$(cat ~/sylveryte/dotfiles/tools/.polybar.data)
case "$isOn" in
	"0")
		polybar shortie -q&
		echo '1' > ~/sylveryte/dotfiles/tools/.polybar.data
		;;
	"1")
		echo '0' > ~/sylveryte/dotfiles/tools/.polybar.data
		killall polybar
		;;
esac

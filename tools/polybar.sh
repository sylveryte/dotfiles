isOn=$(cat /tmp/.polybar.data)
case "$isOn" in
	"0")
		polybar shortie -q&
		echo '1' > /tmp/.polybar.data
		;;
	"1")
		echo '0' > /tmp/.polybar.data
		killall polybar
		;;
esac

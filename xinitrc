#/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

#merge in defaults and keymaps

if [ -f $sysresources ]; then

	xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then 
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

	xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then

	xrdb -merge "$usermodmap"

fi


status () {
	echo -n "$(acpi | awk '{print $4}' | sed s/,//) | $(date '+%Y-%m-%d %H:%M')"
}
while :; do 
	xsetroot -name "$(status)"
	sleep 3
done &

#xrandr --output LVDS1 --mode 1366x768 &

exec dwm

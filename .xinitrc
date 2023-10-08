resolution="$(xrandr | grep \* | awk 'NR==1{print $1}')"
width="$(echo $resolution | cut -dx -f1)"
height="$(echo $resolution | cut -dx -f2)"

echo "i3.gaps: $(expr $height / 50)" | xrdb -merge
echo "alacritty.fontSize: $(expr $width \* $height / 225000)" | xrdb -merge
echo "polybar.fontSize: $(expr $width / 125);$(expr $width / 500)" | xrdb -merge
echo "rofi.fontSize: $(expr $width / 150)" | xrdb -merge

if [[ -f ~/.cache/wal/wal ]]; then
	~/.config/wal/set-background.sh $(cat ~/.cache/wal/wal)
else
	~/.config/wal/set-background.sh ~/Pictures/backgrounds
fi

exec i3

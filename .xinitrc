resolution="$(xrandr | grep \* | awk 'NR==1{print $1}')"
width="$(echo $resolution | cut -dx -f1)"
height="$(echo $resolution | cut -dx -f2)"

echo "i3.border: $(expr $height / 500)" | xrdb -merge
echo "i3.fontsize: $(expr $width \* $height / 225000)" | xrdb -merge
echo "i3.gaps: $(expr $height / 50)" | xrdb -merge
echo "polybar.font: JetBrains Mono Nerd Font:size=$(expr $width / 125);$(expr $width / 500)" | xrdb -merge
echo "rofi.fontsize: $(expr $width / 160)" | xrdb -merge

wal -nqtR
feh --no-fehbg --bg-fill ~/.cache/background.png

exec i3

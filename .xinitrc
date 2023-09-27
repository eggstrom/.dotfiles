wal -Rn
feh --no-fehbg --bg-fill ~/.cache/background.png

resolution="$(xrandr | grep \* | awk 'NR==1{print $1}')"
width="$(echo $resolution | cut -dx -f1)"
height="$(echo $resolution | cut -dx -f2)"

echo "i3.border: $(expr $height / 500)" | xrdb -merge
echo "i3.fontsize: $(expr $width / 160)" | xrdb -merge
echo "i3.gaps: $(expr $height / 50)" | xrdb -merge

exec i3

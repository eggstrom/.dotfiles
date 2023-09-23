wal -Rn
feh --no-fehbg --bg-fill ~/.cache/background.png

echo "i3.gaps: $(expr $(xrandr | grep \* | awk 'NR==1{print $1}' | cut -dx -f2) / 50)" | xrdb -merge
echo "i3.border: $(expr $(xrandr | grep \* | awk 'NR==1{print $1}' | cut -dx -f2) / 500)" | xrdb -merge

exec i3

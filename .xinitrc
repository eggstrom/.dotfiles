resolution="$(xrandr | grep \* | awk 'NR==1{print $1}')"
width="$(echo $resolution | cut -dx -f1)"
height="$(echo $resolution | cut -dx -f2)"

# Load values into Xresources
echo "gaps:               $(expr $height / 50)"                                                    | xrdb -merge
echo "border:             $(expr $(expr $height / 480) \| 1)"                                      | xrdb -merge
echo "alacritty.fontSize: $(expr $width \* $height / 225000)"                                      | xrdb -merge
echo "rofi.fontSize:      $(expr $width / 150)"                                                    | xrdb -merge
echo "polybar.font:       JetBrains Mono Nerd Font:size=$(expr $width / 125);$(expr $width / 500)" | xrdb -merge

# If background was set, reset it
[[ -f ~/.cache/wal/wal ]] && ~/.config/wal/set-background.sh $(cat ~/.cache/wal/wal)

# Start i3
exec i3

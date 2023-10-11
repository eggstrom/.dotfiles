resolution="$(xrandr | grep \* | awk 'NR==1{print $1}')"
width="$(echo $resolution | cut -dx -f1)"
height="$(echo $resolution | cut -dx -f2)"

# Load values into Xresources
echo "gaps:               $(expr $height / 50)"                                                    | xrdb -merge
echo "border:             $(expr $(expr $height / 480) \| 1)"                                      | xrdb -merge
echo "alacritty.fontSize: $(expr $width \* $height / 225000)"                                      | xrdb -merge
echo "rofi.fontSize:      $(expr $width / 150)"                                                    | xrdb -merge
echo "polybar.font:       JetBrains Mono Nerd Font:size=$(expr $width / 125);$(expr $width / 500)" | xrdb -merge

# Generate config files that determine font size
printf "font:\n  size: $(xrdb -query | grep -F 'alacritty.fontSize' | cut -f2)" > ~/.config/alacritty/font-size.yml
printf "* {\n	font: \"JetBrains Mono Nerd Font $(xrdb -query | grep -F 'rofi.fontSize' | cut -f2)\";\n	border: $(xrdb -query | grep -F 'border' | cut -f2);\n}" > ~/.config/rofi/font.rasi

# If background was set, reset it
[[ -f ~/.cache/wal/wal ]] && ~/.config/wal/set-background.sh $(cat ~/.cache/wal/wal)

# Set theme if it's not already set and load colors into Xresources
[[ ! -a ~/.config/themes/current ]] && \
	themes=($(ls -d ~/.config/themes/*/)) && \
	ln -s "${themes[0]}" ~/.config/themes/current
~/.config/themes/reload-colors.sh

# Start i3
exec i3

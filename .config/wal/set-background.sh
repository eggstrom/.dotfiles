size=$(xrandr | grep \* | awk 'NR==1{print $1'})

if [[ "$(identify -format '%wx%h' $1)" = "$size" ]]; then
	cp "$1" ~/.cache/background.png
else
	convert "$1[0]" \
		-interpolate Nearest -filter point \
		-resize "$size"^ -gravity Center -extent "$size" \
		~/.cache/background.png
fi

wal -nqti "$1"
feh --no-fehbg --bg-fill ~/.cache/background.png

mv ~/.cache/wal/alacritty.yml ~/.config/alacritty/alacritty.yml
sed -i "s/\$fontsize/$(xrdb -query | grep -F 'i3.fontsize' | cut -f2)/" ~/.config/alacritty/alacritty.yml

mv ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/theme.rasi
sed -i "s/\$fontsize/$(xrdb -query | grep -F 'rofi.fontsize' | cut -f2)/" ~/.config/rofi/theme.rasi

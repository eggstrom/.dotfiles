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

mv ~/.cache/wal/colors-alacritty.yml ~/.config/alacritty/colors.yml
printf "font:\n  size: $(xrdb -query | grep -F 'alacritty.fontSize' | cut -f2)" > ~/.config/alacritty/font-size.yml

mv ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/colors.rasi
printf "* {\n	font: \"JetBrains Mono Nerd Font $(xrdb -query | grep -F 'rofi.fontSize' | cut -f2)\";\n}" > ~/.config/rofi/font.rasi

wal -nqti "$1"
feh --no-fehbg --bg-fill --force-aliasing "$1"

mv ~/.cache/wal/colors-alacritty.yml ~/.config/alacritty/colors.yml
printf "font:\n  size: $(xrdb -query | grep -F 'alacritty.fontSize' | cut -f2)" > ~/.config/alacritty/font-size.yml

mv ~/.cache/wal/colors-rofi.rasi ~/.config/rofi/colors.rasi
printf "* {\n	font: \"JetBrains Mono Nerd Font $(xrdb -query | grep -F 'rofi.fontSize' | cut -f2)\";\n	border: $(xrdb -query | grep -F 'border' | cut -f2);\n}" > ~/.config/rofi/font.rasi

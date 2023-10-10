wal -nqti "$1"
feh --no-fehbg --bg-fill --force-aliasing "$1"

mv ~/.cache/wal/colors-alacritty.yml ~/.cache/wal/colors-rofi.rasi ~/.config/themes/Wal
cp ~/.cache/wal/colors.Xresources ~/.config/themes/Wal

printf "font:\n  size: $(xrdb -query | grep -F 'alacritty.fontSize' | cut -f2)" > ~/.config/alacritty/font-size.yml

printf "* {\n	font: \"JetBrains Mono Nerd Font $(xrdb -query | grep -F 'rofi.fontSize' | cut -f2)\";\n	border: $(xrdb -query | grep -F 'border' | cut -f2);\n}" > ~/.config/rofi/font.rasi

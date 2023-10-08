wal -nqti "$1"
feh --no-fehbg --bg-fill --force-aliasing "$1"

mv ~/.cache/wal/colors-alacritty.yml ~/.config/alacritty/colors.yml
printf "font:\n  size: $(xrdb -query | grep -F 'alacritty.fontSize' | cut -f2)" > ~/.config/alacritty/font-size.yml

mv ~/.cache/wal/colors-polybar.ini ~/.config/polybar/colors.ini
printf "[bar/bar]\nfont-0 = JetBrains Mono Nerd Font:size=$(xrdb -query | grep -F 'polybar.fontSize' | cut -f2)" > ~/.config/polybar/font.ini
touch ~/.config/polybar/config.ini

mv ~/.cache/wal/colors-rofi.rasi ~/.config/rofi/colors.rasi
printf "* {\n	font: \"JetBrains Mono Nerd Font $(xrdb -query | grep -F 'rofi.fontSize' | cut -f2)\";\n}" > ~/.config/rofi/font.rasi

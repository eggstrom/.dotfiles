resolution="$(xrandr | grep \* | awk 'NR==1{print $1}')"
width="$(echo $resolution | cut -dx -f1)"
height="$(echo $resolution | cut -dx -f2)"

# Load values into Xresources
cat << END | xrdb -merge
gaps:               $(expr $height / 50)
border:             $(expr $(expr $height / 480) \| 1)
alacritty.fontSize: $(expr $width \* $height / 225000)
rofi.fontSize:      $(expr $width / 150)
polybar.font:       JetBrains Mono Nerd Font:size=$(expr $width / 125);$(expr $width / 500)
END

# Generate config files that determine font size
cat > ~/.config/alacritty/font-size.yml << END
font:
  size: $(xrdb -query | grep -F 'alacritty.fontSize' | cut -f2)
END

cat > ~/.config/rofi/font.rasi << END
* {
	font: "JetBrains Mono Nerd Font $(xrdb -query | grep '^rofi\.fontSize' | cut -f2)";
	border: $(xrdb -query | grep '^border:' | cut -f2);
}
END

# If background was set, reset it
[[ -f ~/.cache/wal/wal ]] && ~/.config/wal/set-background.sh $(cat ~/.cache/wal/wal)

# Set theme if it's not already set and reload colors
[[ ! -a ~/.config/themes/current ]] && \
	themes=($(ls -d ~/.config/themes/*/)) && \
	ln -s "${themes[0]}" ~/.config/themes/current
~/.config/themes/reload-colors.sh

# Start i3
exec i3

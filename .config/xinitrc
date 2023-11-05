resolution="$(xrandr | grep \* | awk 'NR==1{print $1}')"
width="$(echo $resolution | cut -dx -f1)"
height="$(echo $resolution | cut -dx -f2)"

gaps="$(expr $height / 50)"
border="$(expr $(expr $height / 480) \| 1)"
alacrittyFontSize="$(expr $width \* $height / 225000)"
rofiFontSize="$(expr $width / 150)"
polybarFont="JetBrains Mono Nerd Font:size=$(expr $width / 125);$(expr $width / 500)"

# Load values into Xresources
cat << END | xrdb -merge
gaps:        $gaps
border:      $border
polybarFont: $polybarFont
END

# Create Alacritty config that determines font size
cat > ~/.config/alacritty/font-size.yml << END
font:
  size: $alacrittyFontSize
END

# Create Rofi config that determines font and border width
cat > ~/.config/rofi/font-and-border.rasi << END
* {
	font:   "JetBrains Mono Nerd Font $rofiFontSize";
	border: $border;
}
END

# Reload background
~/.fehbg

# Start i3
exec i3

#!/usr/bin/env bash

# Set theme if it's not already set
[[ ! -a ~/.config/theme/themes/current ]] && \
	themes=($(ls ~/.config/theme/themes)) && \
	ln -s "${themes[0]}" ~/.config/theme/themes/current

# Get colors
colors=$(cat ~/.config/theme/themes/current)
background=$(printf "$colors" | grep -Po '(?<=^background:).*' | sed 's/^\s*//')
foreground=$(printf "$colors" | grep -Po '(?<=^foreground:).*' | sed 's/^\s*//')
cursor=$(    printf "$colors" | grep -Po '(?<=^cursor:).*'     | sed 's/^\s*//')
color0=$(    printf "$colors" | grep -Po '(?<=^color0:).*'     | sed 's/^\s*//')
color1=$(    printf "$colors" | grep -Po '(?<=^color1:).*'     | sed 's/^\s*//')
color2=$(    printf "$colors" | grep -Po '(?<=^color2:).*'     | sed 's/^\s*//')
color3=$(    printf "$colors" | grep -Po '(?<=^color3:).*'     | sed 's/^\s*//')
color4=$(    printf "$colors" | grep -Po '(?<=^color4:).*'     | sed 's/^\s*//')
color5=$(    printf "$colors" | grep -Po '(?<=^color5:).*'     | sed 's/^\s*//')
color6=$(    printf "$colors" | grep -Po '(?<=^color6:).*'     | sed 's/^\s*//')
color7=$(    printf "$colors" | grep -Po '(?<=^color7:).*'     | sed 's/^\s*//')
color8=$(    printf "$colors" | grep -Po '(?<=^color8:).*'     | sed 's/^\s*//')
color9=$(    printf "$colors" | grep -Po '(?<=^color9:).*'     | sed 's/^\s*//')
color10=$(   printf "$colors" | grep -Po '(?<=^color10:).*'    | sed 's/^\s*//')
color11=$(   printf "$colors" | grep -Po '(?<=^color11:).*'    | sed 's/^\s*//')
color12=$(   printf "$colors" | grep -Po '(?<=^color12:).*'    | sed 's/^\s*//')
color13=$(   printf "$colors" | grep -Po '(?<=^color13:).*'    | sed 's/^\s*//')
color14=$(   printf "$colors" | grep -Po '(?<=^color14:).*'    | sed 's/^\s*//')
color15=$(   printf "$colors" | grep -Po '(?<=^color15:).*'    | sed 's/^\s*//')

# Load colors into Xresources
cat << END | xrdb -merge
background:        #$background
foreground:        #$foreground
i3lockGreen:       $color10
i3lockRed:         $color9
i3lockYellow:      $color11
polybarBackground: E6$background
END

# Create Alacritty colors file
cat > ~/.config/alacritty/colors.yml << END
colors:
  primary:
    background: '#$background'
    foreground: '#$foreground'
  cursor:
    text:   'CellBackground'
    cursor: '#$cursor'
  normal:
    black:   '#$color0'
    red:     '#$color1'
    green:   '#$color2'
    yellow:  '#$color3'
    blue:    '#$color4'
    magenta: '#$color5'
    cyan:    '#$color6'
    white:   '#$color7'
  bright:
    black:   '#$color8'
    red:     '#$color9'
    green:   '#$color10'
    yellow:  '#$color11'
    blue:    '#$color12'
    magenta: '#$color13'
    cyan:    '#$color14'
    white:   '#$color15'
END

# Create Rofi colors file
cat > ~/.config/rofi/colors.rasi << END
* {
	background: #${background}E6;
	foreground: #$foreground;
}
END

# Reload programs
i3-msg reload
touch ~/.config/polybar/config.ini
touch ~/.config/alacritty/alacritty.yml

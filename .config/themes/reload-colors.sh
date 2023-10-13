#!/usr/bin/env bash

# Get colors
colors=$(cat ~/.config/themes/current/colors)
background=$(printf "$colors" | grep '^background:' | cut -d' ' -f2)
foreground=$(printf "$colors" | grep '^foreground:' | cut -d' ' -f2)
cursor=$(    printf "$colors" | grep '^cursor:'     | cut -d' ' -f2)
color0=$(    printf "$colors" | grep '^color0:'     | cut -d' ' -f2)
color1=$(    printf "$colors" | grep '^color1:'     | cut -d' ' -f2)
color2=$(    printf "$colors" | grep '^color2:'     | cut -d' ' -f2)
color3=$(    printf "$colors" | grep '^color3:'     | cut -d' ' -f2)
color4=$(    printf "$colors" | grep '^color4:'     | cut -d' ' -f2)
color5=$(    printf "$colors" | grep '^color5:'     | cut -d' ' -f2)
color6=$(    printf "$colors" | grep '^color6:'     | cut -d' ' -f2)
color7=$(    printf "$colors" | grep '^color7:'     | cut -d' ' -f2)
color8=$(    printf "$colors" | grep '^color8:'     | cut -d' ' -f2)
color9=$(    printf "$colors" | grep '^color9:'     | cut -d' ' -f2)
color10=$(   printf "$colors" | grep '^color10:'    | cut -d' ' -f2)
color11=$(   printf "$colors" | grep '^color11:'    | cut -d' ' -f2)
color12=$(   printf "$colors" | grep '^color12:'    | cut -d' ' -f2)
color13=$(   printf "$colors" | grep '^color13:'    | cut -d' ' -f2)
color14=$(   printf "$colors" | grep '^color14:'    | cut -d' ' -f2)
color15=$(   printf "$colors" | grep '^color15:'    | cut -d' ' -f2)

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

[[ ! $(pgrep udiskie) ]] && udiskie &

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    startx
fi

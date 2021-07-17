VAL=$(rg --files -L --no-ignore | rg \\.pdf$ | rofi -i -dmenu)
if [ ! -z "$VAL" ]; then
    zathura $VAL
fi

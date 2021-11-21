cd ~/sync/notes
VAL=$(rg --files -L -t md -t txt --no-ignore --no-messages \
    | rofi -p "Edit" -i -dmenu)

echo $VAL

if [ ! -z $VAL ]; then
    alacritty -e nvim "/mnt/barracuda/notes/$VAL"
fi

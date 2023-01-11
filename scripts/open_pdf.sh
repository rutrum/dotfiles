VAL=$(rg --files -L --no-ignore --no-messages --glob '!steamapps/*' --glob '!sync/*'\
    | rg "\.pdf$" --no-messages \
    | rofi -p "open" -i -dmenu)

#VAL=$(rg --files -L --no-ignore --no-messages --glob '!steamapps/*' --glob '!sync/*'\
#    | rg "\.pdf$|\.md$" --no-messages \
#    | rofi -p "open" -i -dmenu)

if [ ! -z "$VAL" ]; then
    case $VAL in
        (*.md) 
            PDF=$(/home/rutrum/scripts/pml $VAL /tmp)
            ;;
        (*.pdf)
            echo "pdf"
            PDF=$VAL
            ;;
    esac
    zathura "$PDF"
fi

#!/usr/bin/env bash

Mod=Mod1    # Alt

hc keybind $Mod-Shift-e spawn /home/rutrum/scripts/power.sh
hc keybind $Mod-Shift-r reload
hc keybind $Mod-Shift-q close
hc keybind $Mod-Return spawn alacritty

# basic movement
# focusing clients
hc keybind $Mod-Left  focus left
hc keybind $Mod-Down  focus down
hc keybind $Mod-Up    focus up
hc keybind $Mod-Right focus right
hc keybind $Mod-h     focus left
hc keybind $Mod-j     focus down
hc keybind $Mod-k     focus up
hc keybind $Mod-l     focus right

# moving clients
hc keybind $Mod-Shift-Left  shift left
hc keybind $Mod-Shift-Down  shift down
hc keybind $Mod-Shift-Up    shift up
hc keybind $Mod-Shift-Right shift right
hc keybind $Mod-Shift-h     shift left
hc keybind $Mod-Shift-j     shift down
hc keybind $Mod-Shift-k     shift up
hc keybind $Mod-Shift-l     shift right

hc keybind $Mod-Shift-i spawn xcowsay asdddf

hc keybind $Mod-semicolon rotate
hc keybind $Mod-Shift-semicolon chain . lock . rotate . rotate . rotate . unlock

hc keybind $Mod-y cycle_value frame_gap 0 10

hc keybind $Mod-Shift-f attr clients.focus.floating toggle

# splitting frames
# create an empty frame at the specified direction
hc keybind $Mod-b       split   bottom  0.6
hc keybind $Mod-g       split   right   0.6
# let the current frame explode into subframes
hc keybind $Mod-Control-space split explode

# resizing frames
resizestep=0.05
hc keybind $Mod-Control-h       resize left +$resizestep
hc keybind $Mod-Control-j       resize down +$resizestep
hc keybind $Mod-Control-k       resize up +$resizestep
hc keybind $Mod-Control-l       resize right +$resizestep
hc keybind $Mod-Control-Left    resize left +$resizestep
hc keybind $Mod-Control-Down    resize down +$resizestep
hc keybind $Mod-Control-Up      resize up +$resizestep
hc keybind $Mod-Control-Right   resize right +$resizestep



# tags
tag_names=( {1..9} 0 )
tag_keys=( {1..9} 0 )

hc rename default "${tag_names[0]}" || true
for i in ${!tag_names[@]} ; do
    hc add "${tag_names[$i]}"
    key="${tag_keys[$i]}"
    if ! [ -z "$key" ] ; then
        hc keybind "$Mod-$key" use_index "$i"
        hc keybind "$Mod-Shift-$key" move_index "$i"
    fi
done

# cycle through tags
# hc keybind $Mod-period use_index +1 --skip-visible
# hc keybind $Mod-comma  use_index -1 --skip-visible

# dmenu
hc keybind $Mod-d spawn rofi -show drun -theme theme
hc keybind $Mod-a spawn rofi -show window -theme theme
hc keybind $Mod-o spawn /home/rutrum/scripts/open_pdf.sh
hc keybind $Mod-i spawn /home/rutrum/scripts/edit_note.sh
hc keybind $Mod-u spawn /home/rutrum/scripts/open_project.sh

hc keybind $Mod-m spawn flameshot gui
hc keybind $Mod-Shift-p spawn 'notify-send "Starting 5 min timer" && /home/rutrum/scripts/countdown 300'

# layouting
hc keybind $Mod-r remove
hc keybind $Mod-s floating toggle
hc keybind $Mod-f fullscreen toggle
hc keybind $Mod-p pseudotile toggle
# The following cycles through the available layouts within a frame, but skips
# layouts, if the layout change wouldn't affect the actual window positions.
# I.e. if there are two windows within a frame, the grid layout is skipped.
hc keybind $Mod-period \
    or , and . \
    compare tags.focus.curframe_wcount = 2 \
    . cycle_layout +1 grid horizontal vertical \
    , cycle_layout +1

# mouse
hc mouseunbind --all
hc mousebind $Mod-Button1 move
hc mousebind $Mod-Button2 zoom
hc mousebind $Mod-Button3 resize

# focus
hc keybind $Mod-BackSpace   cycle_monitor
hc keybind $Mod-Tab         cycle_all +1
hc keybind $Mod-Shift-Tab   cycle_all -1
hc keybind $Mod-c cycle
# hc keybind $Mod-i jumpto urgent

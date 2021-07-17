# Create symbolic links for files

# bashrc
rm ~/.bashrc
ln -s ~/dotfiles/.bashrc ~/.bashrc

# i3 config
if [ ! -e "~/.config/i3" ]; then
	mkdir ~/.config/i3
fi
rm ~/.config/i3/config
ln -s ~/dotfiles/.config/i3/config ~/.config/i3/config

# polybar config
if [ ! -e "~/.config/polybar" ]; then
	mkdir ~/.config/polybar
fi
rm ~/.config/polybar/config
ln -s ~/dotfiles/.config/polybar/config ~/.config/polybar/config

# rofi config
if [ ! -e "~/.config/rofi" ]; then
	mkdir ~/.config/rofi
fi
rm ~/.config/rofi/theme.rasi
ln -s ~/dotfiles/.config/rofi/theme.rasi ~/.config/rofi/theme.rasi
ln -s ~/dotfiles/.config/rofi/config.rasi ~/.config/rofi/config.rasi

# bspwm config
if [ ! -e "~/.config/bspwm" ]; then
	mkdir ~/.config/bspwm
fi
rm ~/.config/bspwm/bspwmrc
ln -s ~/dotfiles/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc

# sxhkd config
if [ ! -e "~/.config/sxhkd" ]; then
	mkdir ~/.config/sxhkd
fi
rm ~/.config/sxhkd/sxhkdrc
ln -s ~/dotfiles/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

# alacritty config
if [ ! -e "~/.config/alacritty" ]; then
	mkdir ~/.config/alacritty
fi
rm ~/.config/alacritty/alacritty.yml
ln -s ~/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# dunst config
if [ ! -e "~/.config/dunst" ]; then
	mkdir ~/.config/dunst
fi
rm ~/.config/dunst/dunstrc
ln -s ~/dotfiles/.config/dunst/dunstrc ~/.config/dunst/dunstrc

# nvim config
if [ ! -e "~/.config/nvim" ]; then
	mkdir ~/.config/nvim
fi
rm ~/.config/nvim/init.vim
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

# urxvt config (Xresources)
rm ~/.Xresources
ln -s ~/dotfiles/.Xresources ~/.Xresources

# vimrc
rm ~/.vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc

# cmus colors
if [ ! -e "~/.config/cmus" ]; then
	mkdir ~/.config/cmus
fi
rm ~/.config/cmus/autosave
ln -s ~/dotfiles/.config/cmus/autosave ~/.config/cmus/autosave

# compton config
rm ~/.config/compton.conf
ln -s ~/dotfiles/.config/compton.conf ~/.config/compton.conf

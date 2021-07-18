# dotfiles

To install on foreign device:
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/rutrum/dotfiles.git ~
```
```
git clone --separate-git-dir=$HOME/.dotfiles git@github.com:rutrum/dotfiles.git ~
```

If that fails:
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/rutrum/dotfiles.git /tmp/tmpdf
rsync --recursive --verbose --exclude '.git' /tmp/tmpdf $HOME/
rm -r /tmp/tmpdf
```
```
git clone --separate-git-dir=$HOME/.dotfiles git@github.com:rutrum/dotfiles.git /tmp/tmpdf
rsync --recursive --verbose --exclude '.git' /tmp/tmpdf $HOME/
rm -r /tmp/tmpdf
```

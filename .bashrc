# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# The following are commands related to history consistent
# with the default .bashrc file
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Creates PS1...shortens long file paths
short_dir () {
    FILEPATH=$(dirs)
    MAXLENGTH=25
    PATHLEN=${#FILEPATH}
    OVER=$(( $PATHLEN-$MAXLENGTH ))
    if [ $OVER -gt 0 ]; then
        START=$(( $OVER+3 ))
        FILEPATH=...$(echo $FILEPATH | cut -c $START-)
    fi
    echo -n $FILEPATH
}

next_line () {
    if [ $(tput cols) -ge 50 ]; then
        printf " "
    else 
        echo -n " "
    fi
}

PS1='\[\033[01;38;5;160m\]\u\[\033[00m\] \[\033[01;38;5;172m\]$(short_dir)$([ \j -gt 0 ] && echo " [\j]")\[\033[00m\]\001$( next_line )\002\$ '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Add ~/dotfiles/scripts to $PATH
PATH=$PATH:$HOME/dotfiles/scripts

# Add Cargo bin to $PATH for Rust
PATH=$PATH:$HOME/.cargo/env
source /home/rutrum/.cargo/env

# NPM stuff
PATH=$PATH:$HOME/.npm/bin

# Add ~/scripts 
PATH=$PATH:$HOME/scripts

# Add ~/bin 
PATH=$PATH:$HOME/bin

# ^S no longer pauses terminal
stty -ixon

# Load aliases file
if [ -f ~/.config/bash/aliases ]; then
    . ~/.config/bash/aliases
fi

# Opens a file in the default program
open () {
    xdg-open "$1" & &> /dev/null
}

sshdocker () {
    docker exec -it "$1" /bin/bash
}

rmdc () {
    if [ $# -lt 1 ]; then
        echo "Enter rmd file to compile"
    else 
        echo "require(rmarkdown); render('$(pwd)/$1')" | R --vanilla
    fi
}

latexify () {
    # Run latex command continuously
    watchexec -e tex -- pdflatex -halt-on-error --interaction=batchmode "$1" 2>&1 > /dev/null &

    # Open a zathura with file
    file=$(basename -s tex $(ls $1))
    zathura "$file"pdf &

    nvim $1
}

# Search transcripts (for HPC class)
strans () {
    keyword=$1
    context=2
    if [ $# -gt 1 ]; then
        context=$2
    fi

    rg -i "$keyword" | sed -e 's/\. \([A-Z]\)/\n\1/g' | rg -i "$keyword" -C $context
}

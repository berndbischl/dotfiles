#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="/home/janek/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Unomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1


# shopt builtins
shopt -s autocd # Automatically prepend `cd` to directory names.
shopt -s cdspell # Autocorrect typos in path names when using the `cd` command.
shopt -s checkwinsize # Check the window size after each command and, if necessary, update the values of `LINES` and `COLUMNS`.
shopt -s dotglob # Include filenames beginning with a "." in the filename expansion.
shopt -s nocaseglob # Match filenames in a case-insensitive fashion when performing filename expansion.


# Load Bash It
source $BASH_IT/bash_it.sh

# ctrl + backspace deletes word
#stty werase '^H'

# R
alias R='clear && R --no-save --no-restore-data --quiet'
export rdevel=0 #flag for Rprofile development mode
alias Rdev='rdevel=1 bash -c "R --no-save --no-restore-data --quiet"'

# Python
alias P="clear && ipython3"
alias pinstall="pip3 install --user --upgrade"

# git
alias gc='git clone'
alias gs='git status'
alias ga='git add'
alias gco='git checkout'
alias gpush='git push'
alias gpull='git pull'
alias gl="git log --pretty=format:'%ad | %s%d [%an]' --graph --date=short"
alias gcm='git commit -m "$(curl http://whatthecommit.com/ | grep -A1 content | tail -n 1 | cut -c 4-)"'
alias ginfo='git remote show origin'
gclone() {
  remote=${2:-github.com}
  git clone git@$remote:$1.git
}
alias gfuck='ga . && gcm && gpush'

cheat() {
  curl https://cheat.sh/$1
}

# misc
#alias ack='ack-grep'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias o='xdg-open'
alias imp="~/Impressive-0.12.0/impressive.py"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

export rti=~/.rt/packages
export VISUAL=vim
export EDITOR="$VISUAL"
export R_LIBS_USER=~/.R/library
export IRACE_HOME=${R_LIBS_USER}/irace
export PATH=${IRACE_HOME}/bin/:$PATH
#add line to rt packages file if it is not already there
rappend(){ grep -qF "$1" "$rti" || echo "$1" >> "$rti"; sort "$rti" -o "$rti" ;}

export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:$LD_LIBRARY_PATH
export PATH=$PATH:/usr/local/cuda-9.0/bin
export SPARK_HOME=/opt/spark
export PATH=$SPARK_HOME/bin:$PATH
export PATH=~/.R/library/rt/bin:$PATH
export PATH=$PATH:~/jd2:~/Telegram:~/Enpass
export PATH=$PATH:~/bin

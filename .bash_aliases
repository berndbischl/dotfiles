alias R='R --no-save --no-restore-data --quiet'

alias ll='ls -lh'
alias la='ls -lha'
alias du='du -h'
alias df='df -h'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias sshfs='sshfs -oreconnect'
alias mysshfs='sshfs shell:/home/bischl /home/bischl/shell; sshfs lido:/home/bischl /home/bischl/lido; sshfs lido:/data/bischl /home/bischl/lido_nobackup'
alias myumount='sudo umount /home/bischl/shell; sudo umount /home/bischl/lido; sudo umount /home/bischl/lido_nobackup'
alias myumount_kill='ps -ef  | grep -ve "grep" | grep sshfs | awk "{print $2}" | xargs -n1 kill -9'
alias count-files='find . -maxdepth 1 -type d -exec sh -c "echo {}; find {} | wc -l" \;'
alias remove-svn-files='find . -depth -type d -name ".svn" -exec rm -rf {} \;'
alias remove-latex-temp-files='rm -f *.log; rm -f *.fls; rm -f *.fdb_latexmk; rm -f *.aux; rm -f *.nav; rm -f *.out; rm -f *.snm; rm -f *.tox; rm -rf *.toc; rm -f *.vrb; rm -f *.bbl; rm -f *.blg; rm -f *.dvi; rm -f *-concordance.tex; rm -f *.synctex.gz'
# always use 256 colors in tmux
alias tmux='tmux -2'
# always use nvim
alias vim='nvim'
# always pdf and force complete compile
alias latexmk='latexmk -pdf -g'
# otherwise i get bad sound errors in ubuntu
alias skype-fixed='env PULSE_LATENCY_MSEC=30 skype &'

# git
alias gc='git clone'
alias gs='git status'
alias ga='git add'
alias gco='git checkout'
alias gl="git log --pretty=format:'%ad | %s%d [%an]' --graph --date=short"
alias gci='git commit'
alias grm='git rm'
alias gpush='git push'
alias gpush-tags='git push origin --tags'
alias gpull='git pull'
alias gsi='git submodule init; git submodule update'
alias glo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias mki='make install'
alias mkt='make test'
alias mkc='make check'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xvjf $1      ;;
            *.tgz)       tar xvzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function lowercase()
{
    for file ; do
        filename=${file##*/}
        case "$filename" in
        */*) dirname==${file%/*} ;;
        *) dirname=.;;
        esac
        nf=$(echo $filename | tr A-Z a-z)
        newname="${dirname}/${nf}"
        if [ "$nf" != "$filename" ]; then
            mv "$file" "$newname"
            echo "lowercase: $file --> $newname"
        else
            echo "lowercase: $file not changed."
        fi
    done
}

function swap()
{
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}


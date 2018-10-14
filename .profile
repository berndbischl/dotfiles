# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

test -z "$PROFILEREAD" && . /etc/profile

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi


# we include sbin so we have ldconfig available, needed for configuring the linker when making stuff
#export PATH=/sbin:$PATH
#export LD_LIBRARY_PATH=/home/bischl/glpk/lib:/home/bischl/shogun/lib
# at least RWeka needs this, otherwise it goes to german locale (wtf?)
export LC_NUMERIC=C
eval 'dircolors .dircolors' 


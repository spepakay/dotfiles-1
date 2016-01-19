#
# Global environment
#
DEV="$HOME/dev"
WORK="$HOME/work"
GIT_DEV="$DEV/git"
KERNEL_DEV="$DEV/linux"
PATCH_DIR="$HOME/patches"
DOTFILES="$DEV/my-dotfiles"
OLD_HDD="$HOME/olddisk$HOME"
MUTT_PATH="$DEV/muttx"
BASHRC="$HOME/.bashrc"
BASHRC_DIR="$HOME/.bash"
GNUPGHOME="$HOME/.gnupg"

#
# OS dependend
#
OS=$(uname)
if [ "$OS" == "FreeBSD" ] || [ "$OS" == "DragonFly" ]; then
    export SHELL="/usr/local/bin/bash"
    export MAKE="/usr/local/bin/gmake"
    source /usr/local/share/bash-completion/bash_completion
else
    export SHELL="/bin/bash"
    export MAKE="/usr/bin/make"
    source /usr/share/bash-completion/bash_completion

    alias ls='ls --color'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    alias lsd="ls -lF"
fi

# use vim for git interactive commands
export GIT_SEQUENCE_EDITOR="vim"

#
# let's export some global env
#
export EDITOR="emacs"
export BROWSER="firefox"
export CC=gcc
export AS=as
export AR=ar
export CXX=g++
export LD=ld
export TAR=tar

#
# terminal for i3
#
export TERMINAL="terminator"

#
# bash options
#
# check error and if it is a minor error
# cd to a given dir
shopt -s cdspell
# check a given command in hash at first
shopt -s checkhash
# check LINES and COLUMNS after every command
shopt -s checkwinsize
# an argument to the cd builtin command that is not
# a directory is assumed to be the name of a variable
shopt -s cdable_vars
# command name that is the name of a directory is executed
# as if it were the argument
shopt -s autocd
# save multiline output to the history
shopt -s cmdhist
# spell check for directories
shopt -s dirspell
# enable pattern matching
shopt -s extglob
# autocomple hostname
shopt -s hostcomplete
# case-sensetive pattern matching
shopt -s nocaseglob
# the same for case [[ ]]
shopt -s nocasematch

# inhibit trancation of histor
export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTTIMEFORMAT="[%F %T] "
# disable line editing in emacs terminal
export EMACS=1
export FCEDIT=emacs
export TMPDIR=/tmp

#
# locale
#
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#
# includes
#
source $BASHRC_DIR/term-colors
source $BASHRC_DIR/archives
source $BASHRC_DIR/network
source $BASHRC_DIR/completition
source $BASHRC_DIR/prompt
source $BASHRC_DIR/devel
source $BASHRC_DIR/network
source $BASHRC_DIR/system
source $BASHRC_DIR/standard
source $BASHRC_DIR/export

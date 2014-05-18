if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

export TERM=screen-256color
alias -p tmux=tmux -u

export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

export PKG_PATH=ftp://ftp.openbsd.org/pub/OpenBSD/snapshots/packages/amd64/
export CVSROOT=anoncvs@mirror.planetunix.net:/cvs


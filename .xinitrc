#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

urxvtd -q -o -f

sh ~/.fehbg &

xset +fp /usr/local/lib/X11/fonts/terminus
xset fp rehash
#xbindkeys &
xcalib .colorprofiles/macbookpro83.icc &
xsetroot -cursor_name left_ptr &
xrdb ~/.Xresources &

export WM="xmonad" &
export TERM="rxvt-unicode" &

# this goes in .bash_profile
#export EDITOR="vim" &
#export PATH=$(cope_path):$PATH &
#export PATH=~/golang/bin:$PATH &
#export PATH=$PATH:$HOME/bin &
#export GOPATH=~/golang &
#export CVSROOT=anoncvs@mirror.planetunix.net:/cvs &
#export PKG_PATH=ftp://mirror.planetunix.net/pub/OpenBSD/snapshots/packages/amd64/ &

exec /home/kremlin/.cabal/bin/xmonad


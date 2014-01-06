#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

sh ~/.fehbg &

xset +fp /usr/share/fonts/local
xset fp rehash
xbindkeys &
xcalib colorprofiles/Color\ LCD-00000610-0000-9CCF-0000-0000042733C0.icc &
xsetroot -cursor_name left_ptr &
xrdb ~/.Xresources &

export WM="xmonad"
export TERM="urxvtc" &
export EDITOR="nano" &
export PATH=$(cope_path):$PATH &
export PATH=~/golang/bin:$PATH &
export PATH=$PATH:$HOME/bin &
export GOPATH=~/golang

exec xmonad

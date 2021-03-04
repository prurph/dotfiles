# *** .xinitrc

# Run URxvt's daemon each time X server launched
# -q quiet       no welcome message
# -o opendisplay keep daemon running at all times
# -f fork        bind URxvt to its control socket
# urxvtd -o -q -f
xrdb -merge ~/.config/X11/.Xresources

# Key repeat: <delay> <repeats/sec>
xset r rate 185 40

xkbcomp -w0 -I$XDG_CONFIG_HOME/xkb $XDG_CONFIG_HOME/xkb/keymap/mykbd $DISPLAY

exec i3

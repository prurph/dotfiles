# dotfiles

## Keychron Keyboard Linux Fixes

[Getting the Function Keys of a Keychron Working on Linux](https://venthur.de/2021-04-30-keychron-c1-on-linux.html)

My bindings are based on a Keychron set in Mac mode. Out of the box the
function keys act as multimedia keys, and require the "fn" modifer to be
pressed to act as the former. In order to default to function keys:

```shell
# run as root:
$ echo "options hid_apple fnmode=2" > /etc/modprobe.d/hid_apple.conf
$ mkinitcpio -p linux
```

Then, if F5 and F6 are still behaving as multimedia keys, press and hold fn+k+c
for four seconds until the keyboard crashes.

## Color Emojis in Terminal

This was as simple as installing a color emoji font:

```shell
$ yay -S noto-fonts-emoji
```

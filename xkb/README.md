# xkb

Custom keyboard bindings

## Resources

[Remapping symbols syntax](https://gist.github.com/toroidal-code/ec075dd05a23a8fb8af0#gistcomment-2910549)
[Custom xkb keymaps](https://unix.stackexchange.com/a/65600)

## How this was generated

1. Copy the base keyboard definition: `setxkbmap -print > $DOTFILES/xkb/keymap/mykbd`
2. Create symbols file(s) in `$DOTFILES/xkb/symbols/...`
3. Include things from the symbols file in the keyboard definition
4. Invoke `xkbcomp` on the edited definition, including this directory with `-I` so the symbols files are found

Invoke `xkbcomp` including (`-I`) this top-level directory. It contains both the keymap file and custom symbols.

```shell
# Options:
#   - w0 squelch warnings
#   - I  search this top-level directory for definitions/includes
$ xkbcomp -w0 -I$DOTFILES/xkb $DOTFILES/xkb/keymap/mykbd $DISPLAY
```

Put this in $XDG_CONFIG_HOME/X11/.xinitrc to invoke on startup

# caps2esc

Here's a solution for mapping capslock to:

- escape if pressed alone
- control if pressed with another key

## Setup

1. Install `caps2esc`

```shell
$ yay -S interception-caps2esc
```

2. Add the contents of [udevmon.yaml](./udevmon.yaml) to `/etc/udevmon.yaml`
3. Add the contents of [udevmon.service](./udevmon.service) to `/etc/systemd/system/udevmon.service`
4. `sudo systemctl enable --now udevmon`


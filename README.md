# wayfire-gnome

[![License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://choosealicense.com/licenses/mit/)

--------------------------------------------------------------------------------

Allows you to use [Wayfire](https://github.com/WayfireWM/wayfire) with some GNOME components. Tested on Ubuntu 22.04 and 24.04.

## What this enables

 * Keyring integration
 * Basic session components

Note: it does not actually run `gnome-session`

## Usage

You may install the system files via Meson:
```
meson --prefix=/usr build
ninja -C build
sudo ninja -C build install
```

This will create a session `Wayfire (systemd)` that can be selected from your login manager.

## Additional setup

### Setting correct environment variables

You need to add the following commands to Wayfire's autostart plugin:
```
/bin/sh -c "systemctl --user import-environment DISPLAY WAYLAND_DISPLAY WAYFIRE_SOCKET && systemd-notify --ready"
dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY WAYFIRE_SOCKET
```

### SSH agent on Ubuntu 24.04

On Ubuntu 24.04, unlocking SSH keys might not work properly. I've found two related problems:
 - Two ssh agents get started: `gpg-agent.service` with `gpg-agent-ssh.socket` and `gcr-ssh-agent.service`; only the latter works, but the former seems "preferred"
 - The GCR ssh agent does not set the `SSH_AUTH_SOCK` environment variable properly

The first issue is solved by running (some) of these commands to disable gpg-agent:
```
systemctl --user disable gpg-agent.service
systemctl --user disable gpg-agent-ssh.socket
sudo systemctl --global disable gpg-agent-ssh.socket
```

The second issue is solved by editing the GCR service file by running the following command:
```
systemctl --user edit gcr-ssh-agent.service
```
and adding the following two lines:
```
ExecStartPost=systemctl --user set-environment SSH_AUTH_SOCK=%t/gcr/ssh
ExecStopPost=systemctl --user unset-environment SSH_AUTH_SOCK
```


### Additional desktop components

I find that these are easier to start from Wayfire and can be added to the autostart plugin:
```
/usr/libexec/gsd-rfkill
/usr/libexec/gsd-xsettings
/usr/libexec/gsd-power
/usr/lib/x86_64-linux-gnu/indicator-bluetooth/indicator-bluetooth-service
```

For privilege management, I recommend the Polkit agent of the Mate desktop, available as the `mate-polkit` package on Ubuntu. Add it to the autostart as well:
```
/usr/libexec/polkit-mate-authentication-agent-1
```
Note: the GNOME Polkit agent does not seem to work, at least on Ubuntu 24.04.

Of course, further components, such as a notification daemon, desktop background and a panel or dock can be added here. Components that provide Systemd unit file can also be enabled with `systemctl` and thus will work for other compositors as well. E.g. using the [unit file for mako](https://github.com/emersion/mako/blob/master/contrib/systemd/mako.service):
```
systemctl --user enable mako.service
```




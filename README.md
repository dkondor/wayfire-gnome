# wayfire-gnome

[![License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://choosealicense.com/licenses/mit/)

--------------------------------------------------------------------------------

Allows you to use [Wayfire](https://github.com/WayfireWM/wayfire) with some GNOME components. Tested on Ubuntu 22.04.

## What this enables

 * Privilege management
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

### Additional desktop components

I find that these are easier to start from Wayfire and can be added to the autostart plugin:
```
/usr/libexec/gsd-rfkill
/usr/libexec/gsd-xsettings
/usr/libexec/gsd-power
/usr/lib/x86_64-linux-gnu/indicator-bluetooth/indicator-bluetooth-service
```

Of course, further components, such as a notification daemon, desktop background and a panel or dock can be added here. Components that provide Systemd unit file can also be enabled with `systemctl` and thus will work for other compositors as well.




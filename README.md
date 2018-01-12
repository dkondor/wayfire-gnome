# sway-gnome

[![License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://choosealicense.com/licenses/mit/)

--------------------------------------------------------------------------------

Allows you to use [Sway], a tiling window manager, with GNOME 3 Session 
infrastructure on Arch Linux.

## Work in progress

This repository is currently work-in-progress. Right now, the Sway session is 
started by GDM, but crashes due to some ‘display not found’ errors from the 
GNOME settings daemons, for example:

```
Jan 12 15:37:33 <host> org.gnome.SettingsDaemon.Power.desktop[850]: Cannot open display:
Jan 12 15:37:33 <host> gnome-session[818]: gnome-session-binary[818]: WARNING: App 'org.gnome.SettingsDaemon.Power.desktop' exited with code 1
Jan 12 15:37:33 <host> gnome-session-binary[818]: WARNING: App 'org.gnome.SettingsDaemon.Power.desktop' exited with code 1
Jan 12 15:37:33 <host> org.gnome.SettingsDaemon.Power.desktop[891]: Cannot open display:
Jan 12 15:37:33 <host> gnome-session[818]: gnome-session-binary[818]: WARNING: App 'org.gnome.SettingsDaemon.Power.desktop' exited with code 1
Jan 12 15:37:33 <host> gnome-session[818]: gnome-session-binary[818]: WARNING: App 'org.gnome.SettingsDaemon.Power.desktop' respawning too quickly
Jan 12 15:37:33 <host> gnome-session-binary[818]: WARNING: App 'org.gnome.SettingsDaemon.Power.desktop' exited with code 1
Jan 12 15:37:33 <host> gnome-session-binary[818]: Unrecoverable failure in required component org.gnome.SettingsDaemon.Power.desktop
Jan 12 15:37:33 <host> gnome-session-binary[818]: WARNING: App 'org.gnome.SettingsDaemon.Power.desktop' respawning too quickly
```

I don’t know why this is yet. Help wanted!

[Sway]: https://github.com/swaywm/sway

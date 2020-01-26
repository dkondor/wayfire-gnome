# sway-gnome

[![License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://choosealicense.com/licenses/mit/)

--------------------------------------------------------------------------------

Allows you to use [Sway](https://github.com/swaywm/sway), a tiling window manager, with GNOME 3 Session 
infrastructure on Arch Linux.

## Work in progress

This repository is currently work-in-progress. Right now, the Sway session is 
started by GDM, modelled after sway's [systemd integration wiki page](https://github.com/swaywm/sway/wiki/Systemd-integration).

Some further unit files are included to launch as many gnome deamon in the background as possible in a non-gnome-shell wayland session.
Not all daemons are enabled and further work is necessary for full-compatibility!

## Usage

You may install the system files via `sudo make install` and then copy the contents of `systemd/user` to `$HOME/.config/systemd/user` and adjust them for your personal needs.

In your login manager `Sway (systemd)` should be startable as a new session.

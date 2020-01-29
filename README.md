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


## Dependencies

You need to manually install these dependencies first:

 * swayidle - for idle management
 * swaylock - for screen lock
 * redshift - for automatic screen dimming
 * policykit-1-gnome - privilege management
 * mako - lightweight Wayland
 * [kanshi](https://github.com/emersion/kanshi) - Dynamic display configuration for Wayland
 * gnome-keyring - manage SSH keys, PKCS11 and other secrets
 * gnome-session-bin - the gnome session binary itself
 * gnome-settings-daemon-common - provides GNOME settings services. Services enabled here include:
   * Accessibility Settings
   * Color Management
   * Date & Time handling
   * Keyboard handling
   * Media keys handling
   * Power Management handling
   * Printer Notifications
   * Enabling and Disabling Wireless Devidces (rfkill)
   * Screensaver handling
   * Handle Sharing music, pictures and videos on the local network
   * Enable Remote Login
   * Smartcard handling
   * Sound settings
   * Wacom tablet handling
   * WWAN handling for modems / SIM Cards
   * X Server settings

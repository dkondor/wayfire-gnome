#
# Global Settings
#

INSTALL = install
DESTDIR ?= /
PREFIX  ?= $(DESTDIR)/usr

PATH_SWAY_GNOME = $(PREFIX)/bin/sway-gnome
PATH_SWAY_GNOME_DESKTOP = $(PREFIX)/share/applications/sway-gnome.desktop
PATH_SWAY_GNOME_SESSION = $(PREFIX)/share/gnome-session/sessions/sway-gnome.session
PATH_SWAY_GNOME_WAYLAND = $(PREFIX)/share/wayland-sessions/sway-gnome.desktop

#
# Targets
#

all:
	@echo "Nothing to do"


install:
	$(INSTALL) -m0644 -D session/sway-gnome-wayland.desktop $(PATH_SWAY_GNOME_WAYLAND)
	$(INSTALL) -m0644 -D session/sway-gnome.desktop $(PATH_SWAY_GNOME_DESKTOP)
	$(INSTALL) -m0644 -D session/sway-gnome.session $(PATH_SWAY_GNOME_SESSION)
	$(INSTALL) -m0755 -D session/sway-gnome $(PATH_SWAY_GNOME)


uninstall:
	rm -f $(PATH_SWAY_GNOME)
	rm -f $(PATH_SWAY_GNOME_DESKTOP)
	rm -f $(PATH_SWAY_GNOME_SESSION)
	rm -f $(PATH_SWAY_GNOME_XSESSION)


.PHONY: all install uninstall

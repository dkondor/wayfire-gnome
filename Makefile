#
# Global Settings
#

INSTALL = install
DESTDIR ?= /
USER_DESTDIR ?= /home/$(USER)/.config
PREFIX  ?= $(DESTDIR)/usr

PATH_SWAY_SERVICE = $(PREFIX)/bin/sway-service
PATH_SWAY_SESSION = $(PREFIX)/share/wayland-sessions/sway-systemd.desktop

#
# Targets
#

all:
	@echo "Nothing to do"


install:
	$(INSTALL) -m0644 -D wayland-sessions/sway-systemd.desktop $(PATH_SWAY_SESSION)
	$(INSTALL) -m0755 -D sway-service $(PATH_SWAY_SERVICE)

uninstall:
	rm -f $(PATH_SWAY_SERVICE)
	rm -f $(PATH_SWAY_SESSION)


.PHONY: all install uninstall

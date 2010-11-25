# Makefile for Daum Search Screensaver
#
# Seungwon Jeong <seungwon0@gmail.com>
#
# Copyright (C) 2010 by Seungwon Jeong

SHELL := /bin/sh

INSTALL := install
INSTALL_PROGRAM := $(INSTALL)
INSTALL_DATA := $(INSTALL) -m 644

archive := Daum_Screensaver_High_Mac_patch1.zip
dl := http://search-down.daumcdn.net/girls/$(archive)

videos := *.mp4

datadir := /usr/share/daum-search-screensaver

.SUFFIXES :

.PHONY : all
all : playlist

playlist : $(videos)
	ls $^ | sed -e 's:^:$(datadir)/:' > $@

$(videos) : $(archive)
	unzip -j $(archive) '$@'

$(archive) :
	wget $(dl)

.PHONY : clean
clean :
	-rm -f playlist
	-rm -f $(videos)
	-rm -f $(archive)

.PHONY : install
install : playlist $(videos) daum-search.desktop daum-search-screensaver
	mkdir $(datadir)
	$(INSTALL_DATA) playlist $(datadir)/playlist
	$(INSTALL_DATA) $(videos) $(datadir)/
	$(INSTALL_DATA) daum-search.desktop \
	    /usr/share/applications/screensavers/daum-search.desktop
	$(INSTALL_PROGRAM) daum-search-screensaver \
	    /usr/lib/gnome-screensaver/gnome-screensaver/daum-search-screensaver

.PHONY : uninstall
uninstall :
	-rm -rf $(datadir)
	-rm -f /usr/share/applications/screensavers/daum-search.desktop
	-rm -f /usr/lib/gnome-screensaver/gnome-screensaver/daum-search-screensaver

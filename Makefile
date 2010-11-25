# Makefile for Daum search screensaver
#
# Seungwon Jeong <seungwon0@gmail.com>
#
# Copyright (C) 2010 by Seungwon Jeong

SHELL := /bin/sh

INSTALL := install
INSTALL_PROGRAM := $(INSTALL)
INSTALL_DATA := $(INSTALL) -m 644

screensaver := Daum_Screensaver_High_Mac_patch1.zip
dl := http://search-down.daumcdn.net/girls/$(screensaver)

videos := *.mp4

datadir := /usr/share/daum-search-screensaver

.SUFFIXES :

.PHONY : all
all : $(videos)

$(videos) : $(screensaver)
	unzip -j $(screensaver) '$@'

$(screensaver) :
	wget $(dl)

.PHONY : clean
clean :
	-rm -f $(screensaver)
	-rm -f $(videos)

.PHONY : install
install : $(videos) daum-search.desktop daum-search-screensaver
	install -d $(datadir)
	$(INSTALL_DATA) $(videos) $(datadir)
	$(INSTALL_DATA) daum-search.desktop \
	    /usr/share/applications/screensavers/daum-search.desktop
	$(INSTALL_PROGRAM) daum-search-screensaver \
	    /usr/lib/gnome-screensaver/gnome-screensaver/daum-search-screensaver

.PHONY : uninstall
uninstall :
	-rm -rf $(datadir)
	-rm -f /usr/share/applications/screensavers/daum-search.desktop
	-rm -f /usr/lib/gnome-screensaver/gnome-screensaver/daum-search-screensaver

# Makefile for Daum Search Screensaver
#
# Seungwon Jeong <seungwon0@gmail.com>
#
# Copyright (C) 2010, 2011 by Seungwon Jeong

SHELL := /bin/sh

INSTALL := install
INSTALL_PROGRAM := $(INSTALL)
INSTALL_DATA := $(INSTALL) -m 644

archive := Daum_Screensaver_High_Mac_patch1.zip
dl := http://imgsrc.search.daum-img.net/download/girls/$(archive)

videos := *.mp4

datadir := $(DESTDIR)/usr/share/daum-search-screensaver
screensaver_dir := $(DESTDIR)/usr/share/applications/screensavers
gnome_screensaver_dir := $(DESTDIR)/usr/lib/gnome-screensaver/gnome-screensaver

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

.PHONY : install
install : playlist $(videos) daum-search.desktop daum-search-screensaver
	mkdir -p $(datadir)
	$(INSTALL_DATA) playlist $(datadir)/playlist
	$(INSTALL_DATA) $(videos) $(datadir)/
	$(INSTALL_DATA) daum-search.desktop \
	    $(screensaver_dir)/daum-search.desktop
	$(INSTALL_PROGRAM) daum-search-screensaver \
	    $(gnome_screensaver_dir)/daum-search-screensaver

.PHONY : uninstall
uninstall :
	-rm -rf $(datadir)
	-rm -f $(screensaver_dir)/daum-search.desktop
	-rm -f $(gnome_screensaver_dir)/daum-search-screensaver

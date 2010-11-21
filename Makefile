# Makefile for Girl's Generation screensaver
#
# Seungwon Jeong <seungwon0@gmail.com>
#
# Copyright (C) 2010 by Seungwon Jeong

SHELL := /bin/sh

screensaver=Daum_Screensaver_High_Mac_patch1.zip
dl=http://search-down.daumcdn.net/girls/$(screensaver)
data_dir=/usr/share/daum-search-screensaver

.SUFFIXES :

.PHONY : all
all : *.mp4

*.mp4 : $(screensaver)
	unzip -j $(screensaver) '*.mp4'

$(screensaver) :
	wget $(dl)

.PHONY : clean
clean :
	-rm -f *.mp4 $(screensaver)

.PHONY : install
install : *.mp4 daum-search.desktop daum-search-screensaver
	install -d $(data_dir)
	install -m 644 *.mp4 $(data_dir)
	install -m 644 daum-search.desktop \
	    /usr/share/applications/screensavers/daum-search.desktop
	install -m 755 daum-search-screensaver \
	    /usr/lib/gnome-screensaver/gnome-screensaver/daum-search-screensaver

.PHONY : uninstall
uninstall :
	-rm -rf $(data_dir)
	-rm -f /usr/share/applications/screensavers/daum-search.desktop
	-rm -f /usr/lib/gnome-screensaver/gnome-screensaver/daum-search-screensaver

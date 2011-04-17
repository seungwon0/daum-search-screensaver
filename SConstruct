# SConstruct for Daum Search Screensaver
#
# Seungwon Jeong <seungwon0@gmail.com>
#
# Copyright (C) 2011 by Seungwon Jeong

archive_name = 'Daum_Screensaver_High_Mac_patch1.zip'
dl = 'http://imgsrc.search.daum-img.net/download/girls/' + archive_name

archive = Command(archive_name, None, 'wget %s' % (dl))
Precious(archive)
NoClean(archive)

videos  = '*.mp4'
datadir = '/usr/share/daum-search-screensaver'

playlist = Command('playlist', archive,
                   ["unzip -o -j $SOURCE '%s'" % (videos),
                    "ls %s | sed -e 's:^:%s/:' > $TARGET" % (videos, datadir)])
Clean(playlist, Glob(videos))
Default(playlist)

screensaver_dir       = '/usr/share/applications/screensavers'
gnome_screensaver_dir = '/usr/lib/gnome-screensaver/gnome-screensaver'

Install(datadir, playlist)
Install(datadir, Glob(videos))
Install(screensaver_dir, 'daum-search.desktop')
Install(gnome_screensaver_dir, 'daum-search-screensaver')
Alias('install', [datadir, screensaver_dir, gnome_screensaver_dir])
Clean('install', datadir)

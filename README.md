dwm - dynamic window manager
============================
dwm is the window manager I've chosen to use and this repository contains my configuration.

Requirements
------------
In order to build dwm you need the Xlib header files.


Installation
------------
Edit config.mk to match your local setup (dwm is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install dwm (if
necessary as root):

    make clean install


Running dwm
-----------
Add the following line to your .xinitrc to start dwm using startx:

    exec dwm

In order to connect dwm to a specific display, make sure that
the DISPLAY environment variable is set correctly, e.g.:

    DISPLAY=foo.bar:1 exec dwm

(This will start dwm on display :1 of the host foo.bar.)

In order to display status info in the bar, you can do something
like this in your .xinitrc:

    while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
    do
    	sleep 1
    done &
    exec dwm


Configuration
-------------
The configuration of dwm is done by creating a custom config.h
and (re)compiling the source code.

Notes
-----
When setting up the backlight controls in dwm I ran into issues
with backlight as it wasn't correctly identifying the backlight
directory to resolve this issue I read the [arch wiki](https://wiki.archlinux.org/title/backlight), which is
very helpful. To resolve the issue need to add:
```
Section "Device"
    Identifier  "Intel Graphics"
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
EndSection
```
to the file `/etc/X11/xorg.conf.d/20-intel.conf`. This fixed the
problem I was having with xbacklight.

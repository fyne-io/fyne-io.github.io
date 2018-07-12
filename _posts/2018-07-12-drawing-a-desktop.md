---
layout: post
title:  "Drawing a Desktop"
date:   2018-07-12 22:03:15 +0100
categories: blog
---

As part of our vision to create a beautiful desktop experience we have spent
a lot of time setting up the new Fyne graphical toolkit. That project has
got to a point now where we can start to use it's capability to start work on
the desktop we've been dreaming of! Not only is it part of our goals it is
also a great way to test the graphical toolkit as it builds out.

#### Point and Click

At this stage it's not much more than an interactive rendering - there is no
ability to open windows and move them around, but we think it looks like a start.
Check out the screenshot below - what you should be able to identify is a
background pattern, mouse cursor and a toolbar that contains a handy clock,
launchers and a quit button. Hopefully you like the screenshot below and can
see the potential - if you'd like to join in please get in touch!

![Fractal window](/blog/img/desk-early.png)

#### Desktop and testing

To launch in desktop mode this project uses the Linux DRM (Direct Rendering
Manager) subsystem to draw directly to the screen when launched from a console.
Once support for wayland window management is added this will be the basis for
a true desktop environment.

Until then we wanted a way to test development more easily. If the program
detects that it is running within X11 or a running wayland desktop then it
loads in embedded mode. That means you can see the desktop in a smaller window
in the current desktop. Pretty neat for quick feedback on your work :)
(it also happens to be how the screenshot above was taken).

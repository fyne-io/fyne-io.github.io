---
layout: post
title:  "Build an App in Just Hours (not Days or Weeks)"
date:   2020-02-10 18:43:21 +0000
categories: blog
---

We have posted many times about how [Fyne](/) is designed to be easy to learn 
and fast to develop with. Presentations, meetups and our own [conference](https://conf.fyne.io)
have discussed the topic and it remains very important to the design of the toolkit.

That said there has not been much time put in to showing how to build more than
simple demo applications, so it seemed wise to rectify the imbalance.

## PixelEdit

And so in preparation for the Go developer room at [FOSDEM](fosdem.org) we spent
4 hours creating a simple application. This application, PixelEdit, was designed
to show how to use built in functionality, with a single custom widget to expand
on the builtin components. As well as this it should have good test coverage and
a well organised project showing how to keep separation of concerns in a graphical
application context. And here is what 4 hours work created:

![](/blog/img/pixeledit.png)

This basic user interface allows loading and saving pixel (PNG) images (using
the Go "image" library), pick colours off the canvas and draw them back on
with the pencil tool. Panning is provided by a ScrollContainer and the zooming
is implemented by wrapping the `canvas.Raster` type in a custom widget.

Alongside this work a 67% code coverage was made possible by designing the code
in small components and using the `fyne.io/fyne/test` utility package for
automated testing Fyne apps. And let's not forget that this will build and run
across all the desktop and mobile platforms that Fyne supports.

You can find the full project at [GitHub](https://github.com/fyne-io/pixeledit) and
you can install it using `go get github.com/fyne-io/pixeledit`.
This is launched from the command line with a file parameter to open -
once file open and save dialogs are implemented in Fyne we can improve that.

Check it out and feel free to share with us what apps you have built in surprisingly
little time.

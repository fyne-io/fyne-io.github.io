---
layout: post
title:  "Fyne Goes Mobile"
date:   2019-08-02 15:07:27 +0100
categories: blog
---

We don't normally post about work in progress but on this
"Fyne Friday" it was just too good to share.
To date we have been building an easy to use (as a developer
and an end user) toolkit for desktop apps. Of course we have
already had ambitions to help make apps across all popular
operating systems... but that was some time away right?

# Mobile

Well today the exciting news is that we have the Fyne toolkit
working on iOS and Android devices. That means that any Fyne
based application can be run on these mobile devices by simply
compiling additional binaries from the same source code.

It really is that simple - you just compile your Fyne app
for iOS or Android and then deploy it to the device. Here is
our demo app working on both!

<div width="50%" style="float:left; margin-left: 15%">
 <img src="../blog/img/fyne_demo_iOS.png" style="max-height: 500px" />
</div>
<div width="50%" style="float:left; margin-left: 25pt">
 <img src="../blog/img/fyne_demo_android.png" style="max-height: 500px" />
</div>
<div style="height: 0; clear: both"></div>

We hope that you are as excited about this as we are!

# And... Web

And not to call it qiuts at adding mobile support to the
upcoming 1.2 release but we will be adding support for web
delivery as well. 

You heard it right, Fyne apps will be deliverable through a
standard web browser, if that is what you want to do! We are
working on a web driver alongside our mobile work and are
excited to be able to unveil that here today as well!

<div style="text-align: center">
<img src="../blog/img/fyne_demo_web.png" />
</div>

This means that the [1.2](https://github.com/fyne-io/fyne/milestone/3) release of Fyne will fully support
all of the following platforms:

* macOS
* Windows
* Linux
* Raspberry Pi
* iOS
* Android
* Web

And all of this will be possible from a single codebase.
Welcome to the future!

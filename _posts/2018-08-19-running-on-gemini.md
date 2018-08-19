---
layout: post
title:  "Running on Gemini"
date:   2018-08-19 22:52:25 +0100
categories: blog
---

Sorry there have not been many updated here recently - we are looking at lots
of other GUI toolkits in Go to get inspiration for the best Fyne possible.
Part of this project is looking at bundling, distribution and embedded platforms. And luckily my Gemini [indigogo purchase](https://www.indiegogo.com/projects/gemini-pda-android-linux-keyboard-mobile-device--2#/) just arrived!

And so I wanted to share with you the Fyne example application running on this
fantastic piece of hardware. The base OS is Debian so there was not a log of
adaptation necessary. With the next updated to the platform this should work
out of the box, but for now it did require a little tweaking for old Go and
EFL packages. We're not sure if this backport is valuble to anyone or if the
proof of concept is all we need to push forward toward the release date of
the next [Gemini Debian Linux](https://github.com/gemian) release. 

![Fyne on Gemini](/blog/img/gemini-alpha.jpg)

Please get in touch if you'd like to try it yourself and we can publish a
branch and some instructions for getting it up and running :)

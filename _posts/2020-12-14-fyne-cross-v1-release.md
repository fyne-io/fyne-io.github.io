---
layout: post
title:  "fyne-cross v1 Released"
date:   2020-12-14 11:17:21 +0000
categories: blog
---

An early holiday present from the Fyne team - the v1 release of fyne-cross.
This excellent app has had a long history of development, but today marks the
official 1.0.0 release following it's recent promotion to an official Fyne project.


## Packaging for all platforms

The fyne-cross tool provides an easier way to compile your Fyne app for all 
possible target operating systems. Instead of manaing the toolchains manually
on your development computer it uses the Docker environment to load the required
development tools automatically.

Once you are happy with your app (or you can use our
[hello world](https://developer.fyne.io/started/firstapp#) code), you can now
prepare the packages for release using the following simple commands.
Firstly we install the tool using `go get` and then execute the `fyne-cross` command, 
this time building a windows executable.

```
$ go get github.com/fyne-io/fyne-cross
$ fyne-cross windows
```

After this completes you will see a `dist` folder inside `fyne-cross` that 
contains a `windows` folder and in this will be `myapp.exe` which can be installed
on windows computers.

Similarly the tool can be used to specify a different architecture.
To package a Linux release for `arm64` devices you can just execute:

```
$ fyne-cross linux -arch arm64
```

And you will then find `myapp.tar.gz` inside the `fyne-cross/dist/linux-arm64`
folder.

## Releasing to app stores

After your app has been tested it's time to release.
The fantastic news is that fyne-cross can prepare your release packages too - 
including the store package formats and code signing.
For example, once you have downloaded a provisioning profile from Apple you can
execute `fyne-cross` with the `-release` parameter to prepare your app for upload.

```
$ fyne-cross ios -release -profile "Provisioning Name"
```

Will create a `myapp.pkg` file that can be uploaded to the iOS App Store using
Apple's new *Transporter* app.

Never has it been easier to deploy an app to all platforms, the above command will work for Apple Mac App Store, Google Play and Microsoft Store as well.
Congratulations to [lucor](https://github.com/lucor) and the team behind
fyne-cross for such a great addition to the Fyne project.

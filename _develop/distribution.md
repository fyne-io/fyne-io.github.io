---
layout: develop
title: Packaging

summary: In this document we saw how the fyne tools help to create packages for distribution. Each operating system has different requirements for a GUI based application and these tools can be used to create them as required.

order: 60
---

## Packaging

---

Packaging a graphical app for distribution can be complex - Windows executables
need embedded icons, macOS apps are bundles and with Linux there are various
metadata files that should get installed. What a hassle!

In addition to that mobile apps need extra information to install correctly
(we look at mobile at the end of this page).

### Desktop

Thankfully the "fyne" app has a "package" command that can handle this automatically. Just specifying the target OS and any required metadata (such as icon) will generate the appropriate package. The icon conversion will be done automatically for .icns or .ico so just provide a .png file :). All you need is to have the application already built for the target platform...

```
go get fyne.io/fyne/cmd/fyne
fyne package -os darwin -icon myapp.png
```

Will create myapp.app, a complete bundle structure for distribution to macOS users. You could then build the linux and Windows versions too...

```
fyne package -os linux -icon myapp.png
fyne package -os windows -icon myapp.png
```

These commands will create:

  * myapp.tar.gz that contains a folder structure starting at usr/local/ that a Linux user could expand to the root of their system.
  * myapp.exe (after the second build, which is required for a windows package) will have the icon and app metadata embedded.

If you just want to install the desktop app on your computer then you can make
use of the helpful install subcommand. For example to install your current
application system wide you could simply execute the following:

```
fyne install -icon myapp.png
```

All of these commands also support a default icon file of `Icon.png` so that you
can avoid typing the parameter for each execution.

### Mobile

Packaging on mobile is very similar with Fyne but it will require additional
tools installed. For Android builds you must have the Android SDK and NDK
installed with appropriate environment set up so that the tools (such as `adb`)
can be found on the command line. To build iOS apps you will need Xcode installed
on your macOS computer as well as the command line tools optional package.

Once you have a working development environment the packaging is simple.
To build an application for Android and iOS the following commands will do
everything for you. Be sure to have a unique application identifier as it is
unwise to change these after your first release.

```
fyne package -os android -appID com.example.myapp -icon mobileIcon.png
fyne package -os ios - appID com.example.myapp -icon mobileIcon.png
```

After these commands have completed (which may take some time on first
compilation) you will see two new files in your directory, `myapp.apk` and
`myapp.app`. You will see that the latter has the same name as a darwin
application bundle - don't get them confused as they will not work on the
other platform.

To install the android app on your phone or a simulator simply call:

```
adb install myapp.apk
```

For iOS to install on device open Xcode and choose the "Devices and
Simulators" menu item within the "Window" menu. Then find your phone and drag
the `myapp.app` icon onto your app list. To install on a simulator you can 
use the command line tools as follows:

```
xcrun simctl install booted myapp.app
```


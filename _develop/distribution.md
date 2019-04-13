---
layout: develop
title: Packaging

summary: In this document we saw how the fyne tools help to create packages for distribution. Each operating system has different requirements for a GUI based application and these tools can be used to create them as required.

order: 60
---

## Packaging

---

Packaging a graphical app for distribution can be complex - Windows executables need embedded icons, macOS apps are bundles and with Linux there are various metadata files that should get installed. What a hassle!

Thankfully the "fyne" app has a "package" command that can handle this automatically. Just specifying the target OS and any required metadata (such as icon) will generate the appropriate package. The icon conversion will be done automatically for .icns or .ico so just provide a .png file :). All you need is to have the application already built for the target platform...

```
go get fyne.io/fyne/cmd/fyne
fyne package -os darwin -icon myapp.png
```

Will create myapp.app, a complete bundle structure for distribution to macOS users. You could then build the linux and Windows versions too...

```
fyne package -os linux -icon myapp.png
fyne package -os windows -icon myapp.png
go build # a windows .exe must be re-built after the package command
```

These commands will create:

  * myapp.tar.gz that contains a folder structure starting at usr/local/ that a Linux user could expand to the root of their system.
  * myapp.exe (after the second build, which is required for a windows package) will have the icon and app metadata embedded.


---
layout: post
title:  "Building a Cross Platform GUI with Go"
date:   2019-03-19 11:53:12 +0000
categories: blog
---

There are many tutorials available online for how to use web technologies and [Go](https://golang.org) - but what if you want to create something in pure Go? Whether it's for performance reasons, to keep all of your application in just one programming language or simply because you like Go over Javascript and HTML there are solutions available. Go bindings exist for [GTK+](http://mattn.github.io/go-gtk/), [Qt](https://github.com/therecipe/qt), [Windows](https://github.com/lxn/walk), [Nuklear](https://github.com/golang-ui/nuklear) and also platform abstraction bindings like [andlabs UI](https://github.com/andlabs/ui).

In this tutorial we look at a newer approach - building a graphical application using a toolkit built specifically for go using a modern interpretation of the desktop user interface. The [Fyne](https://fyne.io) toolkit is a simple to learn graphical toolkit that we can use to build cross platform applications that will compile for macOS, Windows and Linux from the same code. We will explore how to get set up, write a basic application and then package it for distribution. Let's get started!

## Setup

The fyne toolkit communicates with operating system graphics using OpenGL, which is supported on almost all desktop and laptop systems. To do this it relies on the builtin functionality of Cgo, the C language bridge for Go. If you have not used this before you may need to install a C compiler as well as the usual Go tools.

The following sections provide an overview - more information is available in the Fyne [Compiling](https://github.com/fyne-io/fyne/wiki/Compiling) documentation.

### macOS

On macOS the XCode package provides this, but you will need to install the command line tools as well. If you have not already installed XCode you can do so from the Mac App Store. Once installed open a Terminal window and execute the command `xcode-select --install` to install the command line tools.

### Windows

Various compiler packages are available on Windows. Any of [Cygwin](https://www.cygwin.com/), [MSYS2](https://www.msys2.org/) and [TDM-GCC](http://tdm-gcc.tdragon.net/download) should work. MSYS2 is usually the easiest to install - download the package and run it. Remember that to compile Fyne applications you will need to use the MSYS2 command prompt rather than the standard windows `cmd` or PowerShell.

### Linux

On a linux system these tools may already be installed - if in doubt use your package manager to install the `gcc` and `go` (or `golang`) packages. Depending on your distribution it may be necessary to install the development headers for X11 and OpenGL which can usually be found in `libgl1-mesa-dev` and `xorg-dev`.

## Installing Fyne

Setting up the Fyne API for use is as simple as downloading it using the `go get` command. The project is accessed from its base import name, `fyne.io/fyne`:

```sh
$ go get -u fyne.io/fyne
```

## Writing our first GUI

The basic *Hello World* application with Fyne is quite succinct. The entry point, `app.New()`, provided by the `app` sub-package, sets up a new application that we use to create a window. The `widget` sub-package defines the various widgets available that we can add to our new window:

```go
package main

import (
    "fyne.io/fyne/app"
    "fyne.io/fyne/widget"
)

func main() {
    a := app.New()
    win := a.NewWindow("Hello World")
    win.SetContent(widget.NewVBox(
        widget.NewLabel("Hello World!"),
        widget.NewButton("Quit", func() {
            a.Quit()
        }),
    ))
    win.ShowAndRun()
}
```

As you can see in the preceding code block, the newly created `fyne.Window` has its content set to a new `widget.VBox` that provides the basic layout. Into this we add a *Hello World!* label using `widget.NewLabel()` and a **Quit** button using `widget.NewButton()`. The second parameter to the button is a `func()` that will be called when the button is tapped.

Lastly, we call `ShowAndRun()` on the window we created. This function will show the window and start the application event loop. It is shorthand for `win.Show(); app.Run()`.

## Compiling and Running

In the usual manner you can either run the Go file directly or build it into a binary file that can be executed.

```sh
$ go run hello.go
```

or

```sh
$ go build hello.go
$ ./hello
```

Running the code should produce a simple app that looks like the following. Clicking the **Quit** button or closing the window will exit the application:

![](/blog/img/hello-light.png)

(running with the light theme - the default is dark, to change this set the `FYNE_THEME` environment variable)


## Packaging

In preparation for packaging an application it's a good idea to have icons and other metadata (name, description, marketing content) to get an impact online. For this section we will skip these and show how to package a basic graphical application for local use, rather than distribution online or through an app store or market place.

Packaging a graphical application is usually more difficult than a command line or web-based application. End users expect to to see a familiar icon, to be able to have it in their application list and to install it simply by downloading or copying the executable file. This leads to many challenges including the management of metadata files and additional tools.

Thankfully Fyne has a tool that can help with application packaging (even if you've not used Fyne in your code). The `fyne package` command is designed to generate and package all the required metadata for an application to distribute on macOS, Linux, or Windows. By default it will build an application bundle for the current platform - but it could be used in part of a cross compilation workflow (more information in a future post).

Before executing this command the application should already be compiled for release (see `go build` above).
There are many parameters that can change the contents of the resulting application, and the most useful will be the -icon <filename> parameter (which is required). The `fyne` command can be installed using:

```sh
$ go get fyne.io/fyne/cmd/fyne
```

Once installed you can execute the `fyne package` command and check the output. On a macOS computer we will see it create a `.app` folder (known as an app bundle). To bundle this example we will use a temporary icon as a placeholder.

```sh
$ fyne package -icon blank_icon.png
$ ls
blank_icon.png	hello		hello.app	hello.go
$ find hello.app
hello.app
hello.app/Contents
hello.app/Contents/MacOS
hello.app/Contents/MacOS/hello
hello.app/Contents/Resources
hello.app/Contents/Resources/icon.icns
hello.app/Contents/Info.plist
$ 
```

Looking at the result in Finder, we see the new directory as an application, its `.app` extension is hidden, and the icon is the same we set up before. You can launch, install, or remove this app like any other:

![](/blog/img/hello-app-mac.png)

Executing the commands above on Windows or Linux would have created the appropriate application formats for each platform. These files could now be shared with anyone who has the same type of computer (that is, the operating system and CPU architecture match, as these are GOOS and GOARCH specific binary files).

## Summary

In this article we saw how to get up and running with our first cross-platform native application written in Go. Whilst some tools had to be installed the code itself was simple and writing using pure Go means that the development environment can offer a lot of help in exploring the widgets available through autocompletion and inline documentation.

Stay tuned for future articles about the Fyne APIs, creation of custom widgets and cross-platform distribution.

I hoped you enjoyed reading this article. If you want to learn more about Go programming you should check out [Hands-On GUI Application Development in Go](https://www.packtpub.com/application-development/hands-gui-application-development-go). Packed with numerous real world examples it explores GUI libraries for Go including Go-GTK, Go-Qt, andlabs UI and Shiny to help you build beautiful, performant and responsive graphical applications.

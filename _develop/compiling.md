---
layout: develop
title: Compiling

summary: In this page we explored how to compile a Fyne application. Although compiling using the Go tools is usually very simple the Fyne toolkit uses Cgo which can add complications. By installing a C compiler as described above you will be able to build your Fyne application just like a normal Go program.

order: 40
---

## Compiling a Fyne application

---

Although Fyne has no native dependencies and is a pure Go API it does require CGo for calling system graphics libraries. Because of this you will need a C compiler (typically gcc, clang or compatible).

### Installing a C compiler

Most developer systems will already have one installed, but if you are getting started or have not used a C compiler before this section should get you set up.

#### Linux and BSD

On Unix systems the "gcc" package may already be installed - if not then install this from your package manager.
One of the following commands is likely to work for your system:

* `sudo apt-get install gcc`
* `sudo pacman -S gcc`
* `yum -y install gcc`

If this works then you will be able to run `gcc --version` to see that it's installed and on your PATH.

#### macOS

On macOS you should install XCode from the Mac App Store - first check you are on a fast internet connection as it is a large download. Once downloaded you will need to run `xcode-select --install` to set up the command line tools (if you have not used them before). It is not unusual to find that your command line tools stop working after an Operating System upgrade - if this occurs simply execute that command again.

#### Windows

Windows does not have a standard way to install a C compiler, but there are many options available. Some that have worked for contributors of this project are:

* TDM-GCC - http://tdm-gcc.tdragon.net/download
* MSYS2 with MingW-w64 - https://www.msys2.org/
* Cygwin - https://www.cygwin.com/

## Dependencies

By default Fyne uses the [gl](https://github.com/go-gl/gl) and [GLFW](https://github.com/go-gl/glfw) bindings for Go which means that OpenGL must be installed on the development, and runtime, systems. Most modern desktop platforms have this running out of the box so this should not be a problem. On some Linux and BSD systems, however, the files needed to compile with OpenGL are not included. Here is a list of the packages you may need to install for various distributions:

<div class="text-align: center; margin: auto" markdown="1">

| Distribution  | Packages required                |
|---------------|----------------------------------|
| Debian/Ubuntu | `libgl1-mesa-dev` and `xorg-dev` |
| Fedora        |  ``libXcursor-devel``  ``libXrandr-devel``  ``mesa-libGL-devel``  ``libXi-devel``|

</div>

## Compile and run

Once the installation and setup is complete you can compile a fyne application
like any other Go code:

    go run main.go

or

    go build
    ./main


## Build tags

Fyne will typically configure your application appropriately for the target platform by selecting the driver and configuration. The following build tags are supported and can help in your development. For example if you wish to simulate a mobile application whilst running on a desktop computer you could use the following command:

	go run -tags mobile main.go


| Tag      | Description               |
|----------|---------------------------|
| `gles`   | Force use of embedded OpenGL (GLES) instead of full OpenGL. This is normally controlled by the target device and not normally needed. |
| `hints`  | Display developer hints for improvements or optimisations. Running with `hints` will log when your application does not follow material design or other recommendations. |
| `mobile` | This tag runs an application in a simulated mobile window. Useful when you want to preview your app on a mobile platform without compiling and installing to the device. |
| `no_native_menus` | This flag is specifically for macOS and indicates that the application should not use the macOS native menus. Instead menus will be displayed inside the application window. Most useful for testing an application on macOS to simulate the behavior on Windows or Linux. |

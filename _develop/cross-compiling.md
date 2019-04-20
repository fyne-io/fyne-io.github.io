---
layout: develop
title: Cross Compiling

summary: Compiling for different platforms can be complicated with a Fyne application. It is necessary to install the C compiler and sometimes target SDK for each plaform you wish to build for. In this document we saw which tools are recommended for setting up this process for various development platforms.

order: 70
---

## Compiling for different platforms

---

Cross compiling with Go is designed to be simple - we just set the environment variable `GOOS` for the target Operating System (and `GOARCH` if targetting a different architecture). Unfortunately when using native graphics calls the use of CGo in Fyne makes this a little harder.

### Compiling from a development computer

To cross-compile a Fyne application you will also have to set `CGO_ENABLED=1` which tells go to enable the C compiler (this is normally turned off when the target platform is different to the current system). Doing so unfortunately means that you must have a C compiler for the target platform that you are going to compile for.
After installing the appropriate compilers you will also need to set the `CC` environment variable to tell Go which compiler to use.

There are many ways to install the required tools - and different tools that can be used. The configuration recommended by the Fyne developers is:

| GOOS (target) | CC | provider | download | notes |
|------|----|----------|----------|-------|
| `darwin`  | `o32-clang` | osxcross | [from github.com](https://github.com/tpoechtrager/osxcross) | You will also need to install the macOS SDK (instructions at the download link) |
| `windows` | `x86_64-w64-mingw32-gcc` | mingw64 | package manager | For macOS use [homebrew](https://brew.sh) |
| `linux`   | `gcc` or `x86_64-linux-musl-gcc` | gcc or musl-cross | [cygwin](http://www.cygwin.com/) or package manager | musl-cross is available from [homebrew](https://brew.sh) to provide the linux gcc. You will also need to install X11 and mesa headers for compilation. |

With the environment variables above set you should be able to compile in the usual manner.
If further errors occur it is likely to be due to missing packages. Some target platforms require additional libraries or headers to be installed for the compilation to succeed.

### Using a virtual environment

As a Linux system is able to cross compile to macOS and Windows easily it can be simpler to use a virtualised environment when you are not developing from Linux. Docker images are a useful tool for a complex build configuration and this works for Fyne as well. There are different tools that can be used. The tool recommended by the Fyne developers is [fyne-cross](https://github.com/lucor/fyne-cross). It has been inspired by [xgo](https://github.com/karalabe/xgo) and uses a [docker image](https://hub.docker.com/r/lucor/fyne-cross) built on top of the [golang-cross](https://github.com/docker/golang-cross) image,
that includes the MinGW compiler for windows, and a macOS SDK, along with the Fyne requirements.

Supported targets are:

| GOOS | GOARCH |
|------|----|
| darwin | amd64 |
| darwin | 386 |
| linux | amd64 |
| linux | 386 |
| windows | amd64 |
| windows | 386 |


#### Installation

        go get github.com/lucor/fyne-cross

#### Usage

        fyne-cross --targets=linux/amd64,windows/amd64,darwin/amd64 package

> Use `fyne-cross help` for more informations

#### Example

The example below cross build the [fyne examples application](https://github.com/fyne-io/examples)

        git clone https://github.com/fyne-io/examples.git
        cd examples
        fyne-cross --targets=linux/amd64,windows/amd64,darwin/amd64 github.com/fyne-io/examples

Builds for the specified targets will be available under the `build` folder



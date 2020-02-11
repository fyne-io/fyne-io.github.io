---
layout: develop
title: Getting Started

summary: In getting started we showed how to get up and running with the Fyne toolkit. We saw that with just a few lines of code we can create a graphical application that will run across mac OS, Windows, Linux and BSD.

order: 10
redirect_from: /develop.html

install:
    tab1:
        name: windows
        title: Windows
        source: windows
        active: 1
    tab2:
        name: macos
        title: macOS X
        source: macos
    tab3:
        name: linux
        title: Linux and BSD
        source: linux
    tab4:
        name: rpi
        title: Raspberry Pi
        source: rpi
    tab5:
        name: android
        title: Android
        source: android
    tab6:
        name: ios
        title: iOS
        source: ios

---

## Getting Started
---

Using the Fyne toolkit to build cross platform applications is very simple but does require some tools to be installed before you can begin. If your computer is set up for development with Go then the following steps may not be required, but we advise reading the tips for your operating system just in case. If later steps in this tutorial fail then you should re-visit the prerequisites below.

## Prerequisites

Fyne requires 3 basic elements to be present, the Go tools (at least version 1.12), a C compiler (to connect with system graphics drivers) and an system graphics driver. The instructions vary depending on your operating system, choose the appropriate tab below for installation instructions.

Note that these steps are just required for development - your Fyne applications will not require any setup or dependency installation for end users!

{% include tabs.html bodyclass="fullborder" tabs=page.install id="install" %}

<div id="install__windows" class="hidden">
<div style="text-align: left" markdown="1">

1. Download Go from the [download page](https://golang.org/dl/) and follow instructions
2. Install one of the available C compilers for windows, the following are tested with Go and Fyne:
    * MSYS2 with MingW-w64 - [msys2.org](https://www.msys2.org/)
    * TDM-GCC - [tdm-gcc.tdragon.net](http://tdm-gcc.tdragon.net/download)
    * Cygwin - [cygwin.com](https://www.cygwin.com/)
3. In Windows your graphics driver will already be installed, but it is recommended to ensure they are up to date.

</div>
</div>

<div id="install__macos" class="hidden">
<div style="text-align: left" markdown="1">

1. Download Go from the [download page](https://golang.org/dl/) and follow instructions
2. Install Xcode from the [Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
3. Set up the Xcode command line tools by opening a Terminal window and typing the following:
    `xcode-select --install`
4. In macOS the graphics drivers will already be installed.

</div>
</div>

<div id="install__linux" class="hidden">
<div style="text-align: left" markdown="1">

* You will need to install Go, gcc and the graphics library header files using your package manager, one of the following commands will probably work.
* **Ubuntu / Debian**
`sudo apt-get install golang gcc libgl1-mesa-dev xorg-dev`
* **Fedora**
`sudo dnf install golang gcc libXcursor-devel libXrandr-devel mesa-libGL-devel libXi-devel libXinerama-devel`
* **Arch Linux**
`sudo pacman -S go xorg-server-devel`

</div>
</div>

<div id="install__rpi" class="hidden">
<div style="text-align: left" markdown="1">

* You will need to install Go, gcc and the graphics library header files using the package manager.
* `sudo apt-get install golang gcc libegl1-mesa-dev xorg-dev`

</div>
</div>

<div id="install__android" class="hidden">
<div style="text-align: left" markdown="1">

* To develop apps for Android you will first need to install the tools for your current computer (Windows, macOS or Linux)
* Once complete you will need to install the Android SDK and Android NDK - the recommended approach is to install [Android Studio](https://developer.android.com/studio/index.html) and then go to **Tools > SDK Manager** and from **SDK Tools** install the **NDK (Side by side)** package.

</div>
</div>

<div id="install__ios" class="hidden">
<div style="text-align: left" markdown="1">

* To develop apps for iOS you will need access to an Apple Mac computer, configured according to the **macOS** tab above.
* You will also need to create an [Apple Developer account](https://developer.apple.com) and sign up to the developer program (costs apply) to obtain the necessary certificate to run your app on any devices.

</div>
</div>

<script type="text/javascript">

    function clickTab(tab) {
        document.querySelector('li.tabcontrol[data-name="'+tab+'"]').click();
    }

    $(document).ready(function(){
        var ua = navigator.userAgent || navigator.vendor || window.opera;
        if (/android/i.test(ua)) {
            clickTab("android");
            return;
        } else if (/iPad|iPhone|iPod/.test(ua) && !window.MSStream) {
            clickTab("ios");
            return;
        }

        var os = window.navigator.platform;
        if (os == "win32") {
            clickTab("windows");
        } else if (os == "MacIntel") {
            clickTab("macos");
        } else if (os == "Linux i686" || os == "Linux x86_64" ||
                   os == "FreeBSD i386" || os == "FreeBSD amd64") {
            clickTab("linux");
        } else if (os == "Linux armv7l") {
            clickTab("rpi");
        }
    });
</script> 

## Downloading

After installing any prerequisites the following command will do everything to get Fyne installed:

    $ go get fyne.io/fyne

Once that command completes you will have the full Fyne development package installed
in your GOPATH.

## Run demo

If you want to see the Fyne toolkit in action before you start to code your own application
then you can see our demo app running on your computer by executing:

    $ go get fyne.io/fyne/cmd/fyne_demo
    $ fyne_demo

And that's all there is to it! Now you can write your own Fyne application in your IDE of choice. If you want to see some Fyne code in action then you can read [your first application](/develop/firstapp.html). Alternatively you could check out our tour of the Fyne toolkit using the button below.

<a href="https://tour.fyne.io" class="btn btn-primary btn-xl" style="visibility: visible;">Take the Tour</a>

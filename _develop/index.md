---
layout: develop
title: Welcome
redirect_from: /develop.html

hello: 
    tab1:
        name: function
        title: Using Functions
        source: function
        active: 1
    tab2:
        name: struct
        title: Using Structs
        source: struct
---

<section class="bg-primary" style="margin: auto -15px; padding: 75pt 20pt" id="about" markdown="1">

## Downloading
<hr class="light">

If you are using Windows, macOS or Linux and already have [Go](https://golang.org) installed then the following command will do everything to get Fyne installed:

    $ go get fyne.io/fyne

Once that command completes you will have the full Fyne development package installed
in your GOPATH. If you want to see the Fyne toolkit in action before you start to code
then you can see our demo app running on your computer by executing:

    $ go get fyne.io/fyne/cmd/fyne_demo
    $ fyne_demo

And that's all there is to it. Let's look more at how to use the Fyne APIs to create your own cross-platform graphical application.

</section>


## Create your first Fyne app
---

A simple app starts by creating an app instance with app.New() and then opening a window with app.NewWindow(). Then a widget tree is defined that is set as the main content with SetContent() on a window. The app UI is then shown by calling ShowAndRun() on the window.

{% include tabs.html bodyclass="fullborder" tabs=page.hello id="hello" %}

<div id="hello__function" class="hidden">
<div style="text-align: left" markdown="1">
```
package main

import (
	"fyne.io/fyne/app"
	"fyne.io/fyne/widget"
)

func main() {
	a := app.New()

	w := a.NewWindow("Hello")
	w.SetContent(widget.NewVBox(
		widget.NewLabel("Hello Fyne!"),
		widget.NewButton("Quit", func() {
			a.Quit()
		}),
	))

	w.ShowAndRun()
}
```
</div>
</div>

<div id="hello__struct" class="hidden">
<div style="text-align: left" markdown="1">
```
package main

import (
	"fyne.io/fyne"
	"fyne.io/fyne/app"
	"fyne.io/fyne/widget"
)

func main() {
	a := app.New()

	w := a.NewWindow("Hello")
	w.SetContent(&widget.Box{Children: []fyne.CanvasObject{
		&widget.Label{Text: "Hello Fyne!"},
		&widget.Button{Text: "Quit", OnTapped: func() {
			a.Quit()
		}},
	}})

	w.ShowAndRun()
}
```
</div>
</div>

Executing the code above (a simple `go run hello.go` should do it) will create a window that looks just like this:

![](https://github.com/fyne-io/fyne/raw/develop/img/hello-normal.png)

If you prefer a light theme then just set the environment variable `FYNE_THEME=light` and you'll get:

![](https://github.com/fyne-io/fyne/raw/develop/img/hello-light.png)

That's all there is to getting started. You can find the full API documentation on [GoDoc.org](https://godoc.org/fyne.io/fyne).

<section class="bg-dark" style="margin: auto -15px; padding: 75pt 20pt" markdown="1">

## Fyne apps and the future of desktops
<hr class="light">

The complete Fyne desktop experience is not yet ready for every day use.
We are working to build the basic features that make it easier to build on.
However all apps built using the Fyne toolkit will work on Windows,
Mac OS X and most Linux distributions as well as integrating perfecty into the 
future Fyne desktop.

Our current state of development looks something like the following:

![](https://github.com/fyne-io/desktop/raw/develop/desktop-dark-current.png)

If you're interested in helping to shape the desktop experience then you can follow our
[desktop repository](https://github.com/fyne-io/desktop) and get involved.

</section>

---
layout: page
header-img: develop
headline: Developing with Fyne
tagline: Start developing your own apps with the Fyne toolkit

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

<section class="bg-primary" id="about">
<div class="container">
<div class="row">
<div class="col-lg-12 text-center" markdown="1">

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

</div>
</div>
</div>
</section>

<div class="container">
<div class="row">
<div class="col-lg-12 text-center" markdown="1">

## Create your first Fyne app
---

A simple app starts by creating an app instance with app.New() and then opening a window with app.NewWindow(). Then a widget tree is defined that is set as the main content with SetContent() on a window. The app UI is then shown by calling ShowAndRun() on the window.

{% include tabs.html bodyclass="fullborder" tabs=page.hello id="hello" %}

<div id="hello__function" class="hidden">
<div style="text-align: left" markdown="1">
```
package main

import (
	"fyne.io/fyne/widget"
	"fyne.io/fyne/app"
)

func main() {
	app := app.New()

	w := app.NewWindow("Hello")
	w.SetContent(widget.NewVBox(
		widget.NewLabel("Hello Fyne!"),
		widget.NewButton("Quit", func() {
			app.Quit()
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
	app := app.New()

	w := app.NewWindow("Hello")
	w.SetContent(&widget.Box{Children: []fyne.CanvasObject{
		&widget.Label{Text: "Hello Fyne!"},
		&widget.Button{Text: "Quit", OnTapped: func() {
			app.Quit()
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

![](https://github.com/fyne-io/fyne/raw/develop/cmd/hello/hello-light.png)

That's all there is to getting started. You can find the full API documentation on [GoDoc.org](https://godoc.org/fyne.io/fyne).

</div>
</div>
</div>

<section class="bg-dark">
<div class="container">
<div class="row">
<div class="col-lg-12 text-center" markdown="1">

## Fyne apps and the future of desktops
<hr class="light">

The complete Fyne desktop experience is not yet available - however all apps built
using the Fyne toolkit will work on Windows, Mac OS X and most Linux distributions.
If you're interested in building out the desktop experience then you can follow our
[desktop repository](https://github.com/fyne-io/desktop) and get involved.

</div>
</div>
</div>
</section>

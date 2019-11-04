---
layout: develop
title: Welcome

summary: In this welcome document we showed how to get up and running with the Fyne toolkit. We saw that with just a few lines of code we can create a graphical application that will run across mac OS, Windows, Linux and BSD.

order: 10
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

<div class="alert alert-info" role="alert" markdown="1">
This documentation is about building apps with the Fyne toolkit.
If you want to learn about how Fyne is built and get involved in development
please head to our [GitHub](https://github.com/fyne-io/fyne/wiki) page.
</div>

## Downloading
---

If you are using Windows, macOS, Linux or BSD and already have [Go](https://golang.org) installed then the following command will do everything to get Fyne installed:

    $ go get fyne.io/fyne

Once that command completes you will have the full Fyne development package installed
in your GOPATH. If you want to see the Fyne toolkit in action before you start to code
then you can see our demo app running on your computer by executing:

    $ go get fyne.io/fyne/cmd/fyne_demo
    $ fyne_demo

And that's all there is to it. Let's look more at how to use the Fyne APIs to create your own cross-platform graphical application.


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

![](/develop/img/hello-normal.png)

If you prefer a light theme then just set the environment variable `FYNE_THEME=light` and you'll get:

![](/develop/img/hello-light.png)

That's all there is to getting started. You can find the full API documentation on [GoDoc.org](https://godoc.org/fyne.io/fyne).


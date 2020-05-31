---
layout: develop
title: Your First App

summary: Building on the "Getting Started" document we have now seen how to build and run a Fyne application. This code can be build for your desktop computer, any other desktop operating system and also iOS and Android devices.

order: 20

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


## Create your first Fyne app
---

Having completed the steps in the [getting started](/develop/) document you're ready to build your first app. To illustrate the process we will build a simple hello world application.

A simple app starts by creating an app instance with app.New() and then opening a window with app.NewWindow(). Then a widget tree is defined that is set as the main content with SetContent() on a window. The app UI is then shown by calling ShowAndRun() on the window.

{% include tabs.html bodyclass="fullborder" tabs=page.hello id="hello" %}

<div id="hello__function" class="hidden">
<div style="text-align: left" markdown="1">
```go
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
```go
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

The code above can be built using the command `go build hello.go` and then executed either by running the `hello` command or by double clicking the icon. You could also bypass the compiling step and just run the code directly using `go run hello.go`.

Either approach will show a window that looks just like this:

<img src="/develop/img/hello-normal.png" width="207" alt="Hello Window" />

If you prefer a light theme then just set the environment variable `FYNE_THEME=light` and you'll get:

<img src="/develop/img/hello-light.png" width="207" alt="Hello Light Theme" />

That's all there is to getting started. You can find the full API documentation on [pkg.go.dev](https://pkg.go.dev/fyne.io/fyne?tab=doc). If you prefer a curated process we have prepared a tour of the toolkit that you can launch using the button below.

<a href="https://tour.fyne.io" class="btn btn-primary btn-xl" style="visibility: visible;">Take the Tour</a>



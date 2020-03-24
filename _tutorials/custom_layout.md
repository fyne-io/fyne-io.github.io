---
layout: develop
title: Building a Layout

summary: The fyne package includes many different layouts that you can use to organise widgets in your application. In this page we learned how to define a custom layout to arrange the contents of a container in a bespoke manner.

order: 20
---

## Build a Custom Layout
---

In a Fyne application each `Container` arranges it's child elements using a simple layout algorithm.
Fyne defines many layouts available in the `fyne.io/fyne/layout` package.
If you look at the code you will see that they all implement the `Layout` interface.

```go
type Layout interface {
	Layout([]CanvasObject, Size)
	MinSize(objects []CanvasObject) Size
}
```

Any application can provide a custom layout to arrange widgets in a non-standard manner. To do this you need to implement the interface above in your own code.
To illustrate this we will create a new layout that arranges elements in a diagonal line and is arranged to the bottom left of it's container

First we will define a new type, `diagonal`, and define what it's minimum size will be. To calculate this we just add the width and height of all child elements (specified as the `[]fyne.CanvasObject` parameter to `MinSize`.

```go
import "fyne.io/fyne"

type diagonal struct {
}

func (d *diagonal) MinSize(objects []fyne.CanvasObject) fyne.Size {
	w, h := 0, 0
	for _, o := range objects {
		childSize := o.MinSize()

		w += childSize.Width
		h += childSize.Height
	}
	return fyne.NewSize(w, h)
}
```

To this type we add a `Layout()` function that should move all of the specified objects into the `fyne.Size` specified in the second parameter.

In our implementation we calculate the top-left of the widgets (this is `0` x parameter and has a y position that is the height of the container less the total of all child item heights).
From the top position we simply advance each item position by the size of the previous child.

```go
func (d *diagonal) Layout(objects []fyne.CanvasObject, containerSize fyne.Size) {
	pos := fyne.NewPos(0, containerSize.Height - d.MinSize(objects).Height)
	for _, o := range objects {
		size := o.MinSize()
		o.Resize(size)
		o.Move(pos)

		pos = pos.Add(fyne.NewPos(size.Width, size.Height))
	}
}
```

That's all there is to creating a custom layout.
Now that the code is all written we can use it as the `layout` parameter to `NewContainerWithLayout`.
The code below sets up 3 `Label` widgets and place them in a container with our new layout.
If you run this application you will see the diagonal widget arrangement and, upon resizing the window, they will align to the bottom left of the available space.

```go
package main

import (
	"fyne.io/fyne"
	"fyne.io/fyne/app"
	"fyne.io/fyne/widget"
)

func main() {
	a := app.New()
	w := a.NewWindow("Diagonal")

	text1 := widget.NewLabel("topleft")
	text2 := widget.NewLabel("Middle Label")
	text3 := widget.NewLabel("bottomright")

	w.SetContent(fyne.NewContainerWithLayout(&diagonal{}, text1, text2, text3))
	w.ShowAndRun()
}
```

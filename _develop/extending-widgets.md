---
layout: develop
title: Extending Widgets

summary: TODO

order: 110
group: Tutorials
---

## Extending existing widgets
---

The standard Fyne widgets provide the minimum functionality and customisation
to support most use-cases. It may be required at certain times to have more
advanced functionality. Rather than have developers build their own widgets
it is possible to extend the existing ones.

For example we will extend the icon widget to support being tapped. To do this
we declare a new struct that embeds the `widget.Icon` type. We create a
constructor function that calls the important `ExtendBaseWidget` function.

```go
import (
	"fyne.io/fyne"
	"fyne.io/fyne/widget"
)

type tappableIcon struct {
	widget.Icon
}

func newTappableIcon(res fyne.Resource) *tappableIcon {
	icon := &tappableIcon{}
	icon.ExtendBaseWidget(icon)
	icon.SetResource(res)

	return icon
}
```

We then add new functions to implement the `fyne.Tappable` interface, with
those functions added the new `Tapped` function will be called every time the
user taps our new icon.  The interface required has two functions,
`Tapped(*PointEvent)` and `TappedSecondary(*PointEvent)`, so we will add both.

```go
import "log"

func (t *tappableIcon) Tapped(_ *fyne.PointEvent) {
	log.Println("I have been tapped")
}

func (t *tappableIcon) TappedSecondary(_ *fyne.PointEvent) {
}
```

We can test this new widget using a simple application as follows.

```go
import (
    "fyne.io/fyne/app"
    "fyne.io/fyne/theme"
)

func main() {
	a := app.New()
	w := a.NewWindow("Tappable")
	w.SetContent(newTappableIcon(theme.FyneLogo()))
	w.ShowAndRun()
}
```

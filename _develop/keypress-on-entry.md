---
layout: develop
title: Respond To Specific Keypress

summary: As a follow up to the writing widgets tutorial, this page will go through how to extend an Entry widget and respond to a specific keypress in it. At the end of the tutorial, you will have created an Entry that responds to pressing the Enter/Return button on the keyboard.

order: 120
---

## Respond To Specific Keypress In Entry
---

In the traditional sense, GUI programs have used callbacks to customize actions for widgets. Fyne does not expose inserting closure callbacks inside widgets, but it does not need to. The Go language is plenty extensible to make this work.

Simply use Type Embedding and extend the widget, along with adding a method to run when the enter/return key is pressed.

First create a new type struct, we will call it `enterEntry`.

```go
type enterEntry struct {
    widget.Entry
}
```

Next up we need to create our `OnEnter` method for the `enterEntry` struct. This will later be used to run when the enter key is pressed to print out the written text and then clear the text.

```go
func (e *enterEntry) OnEnter() {
    fmt.Println(e.Entry.Text)
    e.Entry.SetText("")
}
```

As mentioned in [Extending existing widgets](https://fyne.io/develop/extending-widgets.html), we follow good practice and create a constructor function and extend the `BaseWidget`.

```go
func newEnterEntry() *enterEntry {
    entry := &enterEntry{}
    entry.ExtendBaseWidget(entry)
    return entry
}
```

Then override the `KeyDown()` meathod that's part of `widget.Entry`, this will replace the built in key handling with our own. Inside this meathod, we will use a conditional to check if the `key.Name` value matches the `Return` key using the `fyne.KeyReturn` variable (we could just as well have checked that key.Name == `"Return"` if we had wanted) and if that is the case, we run our `OnEnter` method. We need to have a default check with `entry.Entry.KeyDown(key)` to not risk breaking the original behavior of the entry.
This implementation can easily be extended to check for other keys in the future if necessary.

```go
func (e *enterEntry) KeyDown(key *fyne.KeyEvent) {
    switch key.Name {
    case fyne.KeyReturn:
        e.OnEnter()
    default:
        e.Entry.KeyDown(key)
    }

}
```

With this, the entry now performs a custom action that will be executed when the `KeyDown()` event occurs in our GUI program.

In the end, the resulting code could look something like this:

```go
package main

import (
    "fmt"

    "fyne.io/fyne"
    "fyne.io/fyne/app"
    "fyne.io/fyne/widget"
)

type enterEntry struct {
    widget.Entry
}

func (e *enterEntry) OnEnter() {
    fmt.Println(e.Entry.Text)
    e.Entry.SetText("")
}

func newEnterEntry() *enterEntry {
    entry := &enterEntry{}
    entry.ExtendBaseWidget(entry)
    return entry
}

func (e *enterEntry) KeyDown(key *fyne.KeyEvent) {
    switch key.Name {
    case fyne.KeyReturn:
        e.OnEnter()
    default:
        e.Entry.KeyDown(key)
    }

}

func main() {
    a := app.New()
    w := a.NewWindow("Messenger")

    entry := newEnterEntry()

    w.SetContent(entry)
    w.ShowAndRun()
}

```

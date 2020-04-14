---
layout: develop
title: Using the Preferences API

summary: The Fyne toolkit includes a Preferences API that makes it easy for developers to store values locally on the computer and then grab them again when necessary.

order: 60
redirect_from: /develop/preferences-api.html
---

## Using the Preferences API

---

Storing user configurations and values is a common task for application developers, but implementing it across multiple platforms can be tedious and time-consuming. To make it easier, Fyne has an API for storing values on the filesystem in a clean and understandable way while the complex parts are handled for you.

Lets start with the setup of the API. It is part of the [Preferences](https://pkg.go.dev/fyne.io/fyne?tab=doc#Preferences) interface where storage and loading functions exist for values of Bool, Float, Int and String. They each consist of three different functions, one for loading, one loading with a fallback value and lastly, one for storing values. An example of the three functions and their behaviour can be seen below for the String type:
```go
// String looks up a string value for the key
String(key string) string
// StringWithFallback looks up a string value and returns the given fallback if not found
StringWithFallback(key, fallback string) string
// SetString saves a string value for the given key
SetString(key string, value string)
```

These functions can be accessed through the created application variable and calling the `Preferences()` method on. Please note that it is necessary to create the apps with a unique ID (usually like a reversed url). This means that the application will need to be created using `app.NewWithID()` to have its own place to store values. It can roughly be used like the example below:
```go
a := app.NewWithID("com.example.tutorial.preferences")
[...]
a.Preferences().SetBool("Boolean", true)
number := a.Preferences().IntWithFallback("ApplicationLuckyNumber", 21)
expression := a.Preferences().String("RegularExpression")
[...]
```

To show this, we are going to build a simple little app that always closes after a set amount of time. This timeout should be user changeable and applied on the next start of the application.

Let us start by creating a variable called `timeout` that will be used to store time in the form of `time.Duration`.
```go
var timeout time.Duration
```

Then we could create a select widget to let the user select the timeout from a couple pre-defined strings and then multiplying the timeout by the number of seconds that the string relates to. Lastly, the `"AppTimeout"` key is used to set the string value to the selected one.
```go
timeoutSelector := widget.NewSelect([]string{"10 seconds", "30 seconds", "1 minute"}, func(selected string) {
    switch selected {
    case "10 seconds":
        timeout = 10 * time.Second
    case "30 seconds":
        timeout = 30 * time.Second
    case "1 minute":
        timeout = time.Minute
    }

    a.Preferences().SetString("AppTimeout", selected)
})
```

Now we want to grab the set value and if none exists, we want to have a fallback that sets the timeout to the shortest one possible to save the user time when waiting. This can be done by setting the selected value of `timeoutSelector` to the loaded value or the fallback if that happens to be the case. By doing it this way, the code inside the select widget will run for that specific value.
```go
timeoutSelector.SetSelected(a.Preferences().StringWithFallback("AppTimeout", "10 seconds"))
```

The last part will just be to have a function that starts in a separate goroutine and tells the application to quit after the selected timeout.
```go
go func() {
    time.Sleep(timeout)
    a.Quit()
}()
```

In the end, the resulting code should look something like this:

```go
package main

import (
    "time"

    "fyne.io/fyne/app"
    "fyne.io/fyne/widget"
)

func main() {
    a := app.NewWithID("com.example.tutorial.preferences")
    w := a.NewWindow("Timeout")

    var timeout time.Duration

    timeoutSelector := widget.NewSelect([]string{"10 seconds", "30 seconds", "1 minute"}, func(selected string) {
        switch selected {
        case "10 seconds":
            timeout = 10 * time.Second
        case "30 seconds":
            timeout = 30 * time.Second
        case "1 minute":
            timeout = time.Minute
        }

        a.Preferences().SetString("AppTimeout", selected)
    })

    timeoutSelector.SetSelected(a.Preferences().StringWithFallback("AppTimeout", "10 seconds"))

    go func() {
        time.Sleep(timeout)
        a.Quit()
    }()

    w.SetContent(timeoutSelector)
    w.ShowAndRun()
}
```

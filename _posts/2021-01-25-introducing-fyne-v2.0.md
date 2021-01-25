---
layout: post
title:  "Introducing Fyne v2.0.0"
date:   2021-01-25 12:43:00 +0000
categories: blog
---

The v2.0.0 release of Fyne marks a big advance in the development of our project. This was a chance to step back, see what was working well and what could be improved - and then make the changes in a way that had not been possible whilst maintaining 1.0 API compatibility.
As a result there are some breaking changes that help to point the toolkit in a better direction for the future. Additionally this means that the import path has now changed to `fyne.io/fyne/v2` following the go module convention.

There are so many new features to talk about, let's dive right in!

## Data Binding

Data binding is a powerful new API that helps applications with lots of data avoid the complex code required to keep widgets and data storage up to date.
By using a data binding the widget displaying your data will always have the same value as the sorce of that data. Additionally any widgets that can edit data will ensure that changes are immediately applied to the original data.

The data binding package defines many types (primitive data types as well as `List`, `Map` and `Struct`) that will cover most use-cases.
It also defines various conversion tools so that you can present formatted strings derived from other data types whilst keeping everything up to date automatically.
Additionally you can work directly with bound data by hooking a change listener in, sending data updates to the binding, or by implementing your own data sources and converters.

```go
data := binding.NewFloat()
slide := widget.NewSliderWithData(0, 10, data)
formatted := binding.FloatToStringWithFormat(data, "Float value: %0.2f")
label := widget.NewLabelWithData(formatted)
```

To see more of what is possible with data binding you can check out the latest version of `fyne_demo`. The data binding tab shows how you can use `Float`, `Bool`, `List` and `Struct` types to bind various widgets.

```
$ go get fyne.io/fyne/v2/cmd/fyne_demo
$ fyne_demo
```

<p style="text-align: center">
<img src="/blog/img/databinding.png" style="max-width: 617px; margin: auto" />
</p>

It is also possible to bind your data directly into user preferences so that your values are automatically stored across application restarts. For example to save the contents of an `Entry` widget to a `String` stored at `mykey` you could do the following:

```
str := binding.BindPreferenceString("mykey", fyne.CurrentApp().Preferences())
entry := widget.NewEntryWithData(str)
```

This widget will display the current value of the preference field, and each time it is changed the new value will be saved.

## Storage repositories

The addition of storage repositories bring much more capability to our file abstraction layer.
Now a `URI` can reference any storage source, not just files (and data from other apps on mobile).
The content of a storage repository can be referenced anywhere that a `URI` is used,
such as the file dialog widget.
Interacting with this new API is just like using the `storage` package added in the v1.4 API.

```go
ref := storage.NewFileURI("/path/to/file.txt")
// or
ref, err := storage.ParseURI("content://appID/document?id=5")

read, err := storage.Reader(ref) // remember to call read.Close()
```

Developers can add new repositories alongside the built-in `file` handler.
A repository is identified by it's scheme, which appears at the beginning of every URI.
To connect to a secure FTP server you would first define a new type (here named `myFTPRepository`) that implements `repository.Repository` (from the `fyne.io/fyne/v2/storage/repository` package) it can then be registered and used as follows:

```go
repository.Register("sftp", &myFTPRepository{})
remoteURI, err := storage.ParseURI("sftp://server.name/path/to/mydata.txt")
```

If your `Repository` type also implements `ListableRepository` then you could browse its contents using the file dialog as follows:

```go
u, err := storage.ParseURI("sftp://server.name/directory/")
dir, err := storage.ListerForURI(u)
browse := dialog.NewFileOpen(callback, win)
browse.SetLocation(dir)
browse.Show()
```

You can also replace existing repositories by registering a new one with the same scheme.

## Animation

The new animation APIs deliver an efficient way to provide smooth transition of a `CanvasObject` from one state to another over a specified time period.
All the intermediate values are calculated and timed to match the renderer frame rate.
These animations provide a way to provide hints or visual flair to user interface elements and can be seen on standard components such as tab container, button and entry.
You can see additional animations demonstrated in the `fyne_demo` application.

<p style="text-align: center">
<img src="/blog/img/animation.png" style="max-width: 594px; margin: auto" />
</p>

You can add animations to your application with just a few lines of code. 
An animation can operate on any property of a graphical object by passing a callback and duration to `fyne.NewAnimation`.
For many standard cases the `canvas` package built-in animations will be beneficial, such as the following:

```go
anim = canvas.NewPositionAnimation(
	fyne.NewPos(0, 10), fyne.NewPos(380, 10), canvas.DurationStandard, func(p fyne.Position) {
		obj.Move(p)
		obj.Refresh()
	})
anim.Start()
```

This animation will move `obj` to an appropriate position based on how long the animation has been running for.

## Theme updates

The new Theme API allows for more flexible theming of standard widgets.
It introduces new colours, sizes and also allows themes to override the standard Icons.
Over time new features will be added to this API without the downside of breaking old themes.

Along with the new API come many advances to the look of our standard widgets including Entry, Select, ProgressBar and more. You can see below some of the changes in action
including a redesigned Form widget in a desktop app and the progress bars displayed on a mobile form-factor.

<table style="border-collapse: collapse;"><tr style="border: none;"><td width="70%" style="border: none;">
<img src="/blog/img/form2.png" />
</td><td width="26%" style="border: none;">
<img src="/blog/img/mobile2.png" />
</td></tr></table>

If you wish to use a custom theme that was defined before `v2.0` API updates you can use the convenience function `theme.FromLegacy` which converts an old theme API object so that it can be used in `App.Settings().SetTheme()`.

You can download and run the latest `fyne_demo` app to see all of the enhancements to the toolkit.

```
$ go get fyne.io/fyne/v2/cmd/fyne_demo
$ fyne_demo
```

---

### Read Before Upgrading

This release is our first that is not fully backward compatible.
Before upgrading an existing project please be sure to read the
[upgrading doc](https://developer.fyne.io/api/v2.0/upgrading) for information about relevant changes.

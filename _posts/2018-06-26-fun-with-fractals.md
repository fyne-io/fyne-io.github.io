---
layout: post
title:  "Fun with Fractals: Multithreading for Free!"
date:   2018-06-26 12:06:46 +0000
categories: blog
---

One of the challenges of using (or writing) a GUI toolkit is concurrency and
thread safety. It may not be immediately obvious but threads and concurrent
execution are everywhere: you need a renderer to keep the interface looking
correct, some event handling to manage user input, a main thread to control the
lifecycle of the application and probably more... Even the simplest of apps -
a hello world window with a quit button - would potentially spawn a thread to
handle the click event.

Toolkits also have various restrictions that ensure things work correctly.
For Example, iOS requires that code which updates the user interface is run on
the application main thread. Similarly EFL asserts that graphical objects are
owned by the main thread which can limit portability. In Fyne we aim to remove
these restrictions for developers - it should be possible to influence the
GUI from anywhere within an application and have the toolkit work out the rest!

#### Concurrency

To show off how easy threading is we've made a couple of examples - and the
most interesting is a fractal renderer. As each pixel of a fractal image can
be calculated independently it's a perfect candidate for multi-threading.
Thankfully Fyne has a helpful image type to set up a dynamic rendering - see
the [NewRaster](https://godoc.org/github.com/fyne-io/fyne/canvas#NewRaster)
documentation for the method signature. The renderer for this automatically
splits the image into multiple regions that are handled by different threads.

```go
    window.SetContent(canvas.NewRaster(mandelbrot))
```

If you want to see the content of the mandelbrot method then check the
[fractal source code](https://github.com/fyne-io/fyne/blob/develop/examples/apps/fractal.go).
Running it locally should look something like this:

![Fractal window](/blog/img/fractal-small.png)

#### Async Interface Updates

To demonstrate how easy working with multiple application threads can be there
is another little demo of a simple RSS reader. If you're unfamiliar with why
updating the user interface can be problematic take a look at this
[stack overflow thread](https://stackoverflow.com/questions/661561/how-do-i-update-the-gui-from-another-thread)
or many others on the topic - we don't want developers to worry about which
thread their code is running on or how to communicate with the "UI thread".

Now take a look at the [blog example code](https://github.com/fyne-io/fyne/blob/develop/examples/apps/blog.go)
which spawns a new go routine (this may run on a different thread, depending on 
many factors) that then updates the user interface. The relevant code is:

```go
    func parse(url string, titleList *widget.List) {
    	feed := gofeed.NewParser().parseURL(url)

    	for i := range feed.Items {
    		buttonList.Append(widget.NewLabel(item.Title))
    	}
    }

    func main() {
    	url := "http://fyne.io/feed.xml"

    	// ...	

    	list := widget.NewList()
    	window.SetContent(list)

    	go parse(url, list)

    	window.Show()
    }
```

If you run the (full) example you will notice that the list of article titles
gets populated after the user interface shows. The downloading and parsing of
the feed takes a little time and that should not slow down the user interface.
The bonus here is that they async code had no additional complications!

---
layout: develop
title: Bundling resources 

summary: Graphical applications that require additional resources can make it more difficult to compile to a single binary file. In this document we saw how the "fyne bundle" command can package images, fonts and other resources for an application to load without needing files to be shipped alongside.

order: 40
---

## Bundling resources
---

Go based applications are usually built as a single binary executable, and this is the same for Fyne applications.
A single file makes it easier to distribute install our software. Unfortunately GUI
applications typically require additional resources to render the user interface.
To manage this challenge a Go application can bundle assets into the binary itself. The Fyne toolkit prefers the use of "fyne bundle" as it has various benefits that we will explore below.

The basic approach to bundle an asset is to execute the "fyne bundle" command.
This tool has various parameters to customise the output, but in it's basic form the
file to bundle will be converted into Go source code that can be built into your application.

```bash
$ ls
image.png	main.go
$ fyne bundle image.png >> bundled.go
$ ls
bundled.go	image.png	main.go
$ 
```

The contents of `bundled.go` will be a list of resource variables that we can then access in our code. For example the code above will result in a file that includes the following:

```go
var resourceImagePng = &fyne.StaticResource{
	StaticName: "image.png",
	StaticContent: []byte{
...
	}}
```

As you see the default naming is "resource\<Name\>\<Ext\>". The name and package used in this file can be customised in command parameters. We can then use this name to,
for example, load an image on our canvas:

```go
img := canvas.NewImageFromResource(resourceImagePng)
```

A fyne resource is just a collection of bytes with a unique name, so this could be
a font, a sound file or any other data you wish to load. Also you can bundle many resources into a single file using the `-append` parameter. If you will be bundling many files it is recommended to save the commands in a shell script, for example this file `gen.sh`:

```bash
#!/bin/bash
fyne bundle image1.png > bundled.go
fyne bundle -append image2.png >> bundled.go
```

If you then change any assets or add new ones then you can update this file and run it once to update your `bundled.go` file.
You should then add `bundled.go` to version control so others can build your app
without needing to run "fyne bundle". It is also a good idea to add `gen.sh` as well
so that others can re-generate the bundled resources if required.

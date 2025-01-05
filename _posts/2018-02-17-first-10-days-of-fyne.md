---
layout: post
title:  "The First 10 Days of Fyne"
date:   2018-02-17 20:18:05 +0000
categories: blog
---

It's been just 10 days since the Fyne project was announced and in that time we've had a lot of support! The IRC channel, which we added only a week ago, now has a core group of developers helping to discuss and guide the design of the toolkit.
The [website](https://fyne.io) is up and running to help visitors understand what the project is about and see our progress. For the more developer oriented there is now a [walking skeleton](https://github.com/fyne-io/fyne/projects/1) project which is tracking progress towards our first milestone.

In terms of a quick summary we have picked [Go](https://golang.org) as the main language for development and API. The rendering pipeline we are using is [EFL](https://www.enlightenment.org/), though the details will be hidden completely from the Fyne APIs. Lastly we [decided](https://github.com/fyne-io/fyne/wiki/Layout-Algorithm) on the use of the [Cassowary](https://en.wikipedia.org/wiki/Cassowary_(software)) algorithm for layout - giving an experience similar to the iOS AutoLayout.

The Enlightenment IDE (Edi) has been updated for Go syntax and build lifecycle so anyone already working on EFL apps can continue using the same tooling for now :).

Happy coding and come back soon!

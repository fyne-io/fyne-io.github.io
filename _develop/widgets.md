---
layout: develop
title: Widget List

summary: In this page we learned about the widgets currently provided by the Fyne toolkit. As these are all built on the same canvas objects they will work identically on all the supported platforms. If you don't find the widget you are looking for it would be possible to create a <a href="/develop/customwidget.html">custom widget</a>

order: 30
---

## Standard Widgets

---

### Box

Box widget is a simple list where the child elements are arranged in a single column for vertical or a single row for horizontal arrangement.

### Button

Button widget has a text label and icon, both are optional.

![Button](/develop/widget/button.png)
 ![Button with Icon](/develop/widget/button-icon.png)

### Check

Check widget has a text label and a checked (or unchecked) icon.

![Check](/develop/widget/check.png) ![Check On](/develop/widget/check-on.png)

### Entry

Entry widget allows simple text to be input when focused.

![Entry](/develop/widget/entry.png)

### Form

Form widget is two column grid where each row has a label and a widget (usually an input). The last row of the grid will contain the appropriate form control buttons if any should be shown.

### Group

Group widget is list of widgets that contains a visual divider to indicate the group with a title at the top.

![Group](/develop/widget/group.png)

### Hyperlink

Hyperlink widget is a text component with appropriate padding and layout. When clicked, the URL opens in your default web browser.

![Hyperlink](/develop/widget/hyperlink.png)

### Icon

Icon widget is a basic image component that load's its resource to match the theme.

![Icon](/develop/widget/icon.png)

### Label

Label widget is a label component with appropriate padding and layout.

![Label](/develop/widget/label.png)

### Progress bar

ProgressBar widget creates a horizontal panel that indicates progress.

![Progress](/develop/widget/progress.png)

ProgressBarInfinite widget creates a horizontal panel that indicates waiting indefinitely An infinite progress bar loops 0% -> 100% repeatedly until Stop() is called.

![Progress Infinite](/develop/widget/progress-infinite.png)

### Radio

Radio widget has a list of text labels and radio check icons next to each.

![Radio](/develop/widget/radio.png) ![Radio On](/develop/widget/radio-on.png)

### ScrollContainer

ScrollContainer defines a container that is smaller than the Content.

### TabContainer

TabContainer widget allows switching visible content from a list of TabItems. Each item is represented by a button at the top of the widget.

![Tab Container](/develop/widget/tabcontainer.png)

### Toolbar

Toolbar widget creates a horizontal list of tool buttons.

![Toolbar](/develop/widget/toolbar.png)


---
layout: page
header-img: download
headline: Download Fyne!
tagline: Get up and running with Fyne apps on your system
---

<section class="bg-primary" id="about">
<div class="container">
<div class="row">
<div class="col-lg-12 text-center" markdown="1">

## Fyne apps and the future of desktops
<hr class="light">

The complete Fyne desktop experience is not yet available - however all our
apps work on Windows, Mac OS X and most Linux distributions.
The next section outlines how you can get the Fyne toolkit installed and start
using the apps that are available. If your operating system is not listed you
may not be out of luck - if you can install Git, Go and EFL then you may still
be able to get up and running.

</div>
</div>
</div>
</section>

<div class="container">
<div class="row">
<div id="dl-linux" class="col-lg-12 text-center" markdown="1">

## Downloading on Linux
---

If you are using Debian, Ubuntu or Arch linux the following command will
do everything to get Fyne installed:

    bash -c "$(curl -fsSL https://raw.githubusercontent.com/fyne-io/bootstrap/master/bootstrap.sh)"

If you are on a different system then just installing git, go and efl from
your package manager is the first pass - then run the command above to complete
the process.

</div>
<div id="dl-mac" class="col-lg-12 text-center" markdown="1">

## Downloading on Mac OS X
---

If you already have [homebrew](https://brew.sh) installed then the bootstrap
script can be used - open a Terminal (in Applications/Utilities) and paste the
following command: 

    bash -c "$(curl -fsSL https://raw.githubusercontent.com/fyne-io/bootstrap/master/bootstrap.sh)"

Then just hit return and you'll see Fyne running in a short while.

</div>
<div id="dl-win" class="col-lg-12 text-center" markdown="1">

## Downloading on Windows
---

</div>
</div>
</div>

<script>
if (navigator.appVersion.indexOf("Win")==-1)
  document.getElementById('dl-win').style.display = "none";
if (navigator.appVersion.indexOf("Mac")==-1)
  document.getElementById('dl-mac').style.display = "none";
if (navigator.appVersion.indexOf("Linux")==-1&&navigator.userAgent.indexOf("Linux")==-1)
  document.getElementById('dl-linux').style.display = "none";
</script>

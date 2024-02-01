---
layout: page
header-img: toolkit
headline: Easily build native apps<br />that work everywhere

gallery:
  - id: 1
    title: Fyne demo - dark theme
    img: https://raw.githubusercontent.com/fyne-io/fyne/master/img/widgets-dark.png
  - id: 2
    title: Fyne demo - mobile light theme
    img: https://raw.githubusercontent.com/fyne-io/fyne/develop/img/widgets-mobile-light.png
  - id: 3
    title: Nomad timezone converter - custom theme
    img: https://github.com/fynelabs/nomad/blob/main/img/screenshot.png?raw=true
  - id: 4
    title: Notes app - custom theme
    img: https://github.com/fynelabs/notes/blob/main/img/screenshot.png?raw=true
  - id: 5
    title: FyneSweeper - Minesweeper with Fyne
    img: https://raw.githubusercontent.com/AnkushJadhav/fynesweeper/main/assets/png/demo.png
  - id: 6
    title: Gordle - Go clone of famous Wordle game
    img: https://github.com/scastiel/gordle/blob/main/assets/screenshot.png?raw=true
  - id: 7
    title: Rymdport - cross-platform secure file sharing
    img: https://raw.githubusercontent.com/Jacalz/rymdport/main/internal/assets/screenshot1.png
  - id: 8
    title: Slydes - A presentation app with Fyne and Markdown
    img: https://github.com/andydotxyz/slydes/blob/main/img/screenshot.png?raw=true
  - id: 9
    title: Solitaire - Classic card game with Fyne
    img: https://github.com/fyne-io/solitaire/blob/main/img/solitaire.png?raw=true
  - id: 10
    title: SSHTerm - A cross platform SSH client in Go
    img: https://github.com/andydotxyz/sshterm/blob/main/img/screenshot1.png?raw=true
  - id: 11
    title: FyneDesk - Full Unix desktop environment in Go and Fyne
    img: https://github.com/fyne-io/fynedesk/raw/master/desktop-light-current.png
  - id: 12
    title: DICOM Viewer - Medical imgages on any platform
    img: https://github.com/fynelabs/dicomgraphics/blob/main/screenshot.png?raw=true

---

<section class="devices">
    <div class="container">
        <div class="row">
            <div class="text-center">
		<img src="/img/devices/panel.png" height="210" />
		<img src="/img/devices/iphone.png" height="367" />
		<img src="/img/devices/desktop.png" height="220" />
		<img src="/img/devices/android.png" height="176" />
            </div>
        </div>
    </div>
</section>

<section class="bg-primary about">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <p class="lead" style="font-size: 20px; font-style: italic;">An easy to learn toolkit for creating graphical
                  apps for desktop, mobile and web.
                  <br /><br />
                  Code once and build native apps for all platforms and stores.
                </p>
            </div>
        </div>
    </div>
</section>

<section class="areas">
    <div class="container">
        <div class="row">
            <div class="text-center">
                <h2 class="section-heading">Gallery</h2>
                <hr class="primary" />

                {% for item in page.gallery %}
                {% assign col = forloop.index | modulo: 4 %}
                <div class="col-md-2 col-sm-4 col-xs-6{% if col == 1 %} col-md-offset-2{% endif %}">
                  <a href="#" class="galleryPic" data-target="#galleryModal" data-img="{{ item.img }}" data-caption="{{ item.title }}">
                    <img src="/img/gallery/{{ item.id }}.png" alt="{{ item.title }}">
                  </a>
                </div>
                {% endfor %}
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <p>&nbsp;</p>
                <a href="/vision/" class="btn btn-primary btn-xl">Our Vision</a>
            </div>
        </div>
    </div>
</section>

<section class="bg-dark started">
    <div class="container">

        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="section-heading">Are you ready to build the future with us?</h2>
                <hr class="primary">
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 text-center">
                <p>If you can't wait to start building your first Fyne app, you should follow our getting started guide.</p>

                <a href="https://developer.fyne.io/started/" class="btn btn-primary btn-xl">Get Started</a>
            </div>
            <div class="col-lg-4 text-center">
                <p>If you are new to the Go language, we recommend running through the Go tour before returning to the Fyne documentation.</p>

                <a href="https://go.dev/tour/" class="btn btn-primary btn-xl">Go Tour</a>
            </div>
            <div class="col-lg-4 text-center">
                <p>For developers who prefer to learn from videos we have a collection of getting started tutorials on YouTube.</p>

                <a href="https://www.youtube.com/watch?v=-v1vz_NcWng&list=PLjpijTpXl1_po-ld8jORR9k5NornDNKQk" class="btn btn-primary btn-xl">Tutorial Playlist</a>
            </div>
        </div>
    </div>
</section>

{% include features.html %}

<section class="bg-primary about">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 quote-block">
Really Fyne is one of the rare technology that make me say “woooow” after a try,
that happens rarely.
<span class="quote-name">- Patrice Ferlet</span>
            </div>
            <div class="col-lg-6 quote-block">
Fyne is the brightest star on the UI sky at the moment.
<span class="quote-name">- Andreas Schneider</span>
<p>&nbsp;</p>
            </div>
            <div class="col-lg-6 quote-block">
It's been pretty easy to start feeling productive in Fyne,
you all did a very nice job!
<span class="quote-name">- Peter Stratton</span>
            </div>
            <div class="col-lg-6 quote-block">
I'm over the moon excited about fyne.
This is the greatest project since sliced bread.
<span class="quote-name">- Joel Jensen</span>
            </div>
            <div class="col-lg-6 quote-block">
Blown away with Fyne's ease and beauty. Will definitely use it with Go [...]
Great job you guys!
<span class="quote-name">- Alejantro Martinis</span>
            </div>
            <div class="col-lg-6 quote-block">
Wouldn't have used anything else than fyne. It is simple and just makes me
understand what I'm actually trying to do.
<span class="quote-name">- Jacob Alzén</span>
            </div>
        </div>
    </div>
</section>

<section class="">
    <!-- Modal -->
    <div
      class="modal fade"
      id="galleryModal"
      tabindex="-1"
      aria-hidden="false">
      <div class="modal-dialog modal-lg">
        <div class="modal-content" style="text-align: center;">
          <div>
            <img id="modalImage" style="max-width: 100%; margin: 5pt" src="https://github.com/fynelabs/notes/blob/main/img/screenshot.png?raw=true" />
            <p id="modalCaption" style="font-size: small;">Caption text</p>
          </div>

          <div class="modal-footer text-center py-3" style="margin: 5pt">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">
              Close
            </button>
          </div>
        </div>
      </div>
    </div>
</section>

<script language="javascript">
$('a.galleryPic').on('click', function() {
    var img = $(this).data('img');
    var caption = $(this).data('caption');

    $('#modalImage').attr("src", img);
    $('#modalCaption').text(caption);

    $('#galleryModal').modal('show');

    return false;
});

</script>

{% include portfolio.html %}


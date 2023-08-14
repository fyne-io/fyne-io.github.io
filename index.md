---
layout: page
header-img: toolkit
headline: Easily build native apps that work everywhere
---

<section class="bg-primary" id="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <p class="lead" style="font-size: 18px; font-style: italic;">An easy to learn toolkit for creating graphical
                  apps for desktop, mobile and web.
                  <br>
                  Our free and open source libraries combine the simplicity of the Go
                  programming language with a carefully crafted library of widgets to simplify coding any app.
                  <br>
                  But also, Fyne apps can be built for all platforms and stores!
                </p>
            </div>
        </div>
    </div>
</section>

<section id="areas">
    <div class="container">
        <div class="row">
            <div class="text-center">
                <h2 class="section-heading">Gallery</h2>
                <hr class="primary" />

                <div class="col-md-2 col-sm-4 col-xs-6 col-md-offset-2">
                  <a href="#" class="galleryPic" data-target="#galleryModal" data-img="https://raw.githubusercontent.com/fyne-io/fyne/master/img/widgets-dark.png" data-caption="Fyne demo - dark theme">
                    <img src="/img/gallery/1.png" alt="Fyne demo - dark theme">
                  </a>
                </div>
                <div class="col-md-2 col-sm-4 col-4 col-xs-6">
                  <a href="#" class="galleryPic" data-target="#galleryModal" data-img="https://raw.githubusercontent.com/fyne-io/fyne/develop/img/widgets-mobile-light.png" data-caption="Fyne demo - mobile light theme">
                    <img src="/img/gallery/2.png" alt="Fyne demo - mobile light theme">
                  </a>
                </div>
                <div class="col-md-2 col-sm-4 col-4 col-xs-6">
                  <a href="#" class="galleryPic" data-target="#galleryModal" data-img="https://github.com/fynelabs/nomad/blob/main/img/screenshot.png?raw=true" data-caption="Nomad timezone converter - custom theme">
                    <img src="/img/gallery/3.png" alt="Nomad timezone converter - custom theme">
                  </a>
                </div>
                <div class="col-md-2 col-sm-4 col-4 col-xs-6">
                  <a href="#" class="galleryPic" data-target="#galleryModal" data-img="https://github.com/fynelabs/notes/blob/main/img/screenshot.png?raw=true" data-caption="Notes app - custom theme">
                    <img src="/img/gallery/4.png" alt="Notes app - custom theme">
                  </a>
                </div>
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

<section class="bg-dark" id="started">
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
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1 text-center">
                <p>&nbsp;</p><p>&nbsp;</p>
                <p markdown="1">Our team of engineers, UX experts and other contributors are all working
                  on an entirely volunteer basis. We rely on the kind support of our sponsors
                  to pay our bills and provide hosting and software that keeps the project alive.
                </p>
                <p markdown="1">
                  We are seeking further sponsorship and funding to provide a more
                  stable future for the team, and to allow us to provide full time support
                  to the community of developers and companies that depend on us.
                  Many thanks to anyone who can help us reach this goal,
                  more information is available on our [contributing](/contribute) page.
                </p>
            </div>
        </div>
    </div>
</section>

{% include features.html %}

<section class="bg-primary" id="about">
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


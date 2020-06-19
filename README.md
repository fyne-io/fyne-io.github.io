# Fyne.io Website

This repository contains the source of the main https://fyne.io website.

## Running the website locally

The website uses [jekyll](https://jekyllrb.com/) to generate the website from markdown files.
With ruby installed it is as easy as running the following commands in a terminal (the first only needs to run once):

```bash
gem install bundler jekyll
bundle exec jekyll serve
```

Alternatively, you can use the Dockerized build via either of:

* `sh ./build.sh build` -- non-interactively build `./_site`
* `sh ./build.sh serve` -- run `jekyll serve` inside of the docker container

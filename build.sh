#!/bin/sh

set -e
set -u

# Either run Jekyll interactively, or build the site statically, using a Docker
# container.
#
# This is based on the official Jekyll Docker images:
#
# https://github.com/envygeeks/jekyll-docker/blob/master/README.md

USAGE="sh ./build.sh [serve|build]" 

if [ $# -ne 1 ] ; then
	echo "$USAGE" 1>&2
	exit 1
fi

cd "$(dirname "$0")"
export JEKYLL_VERSION=3.8

if [ "$1" = "serve" ] ; then
	docker run --rm \
		-p 4000:4000 \
		--volume="$PWD:/srv/jekyll" \
		-it jekyll/jekyll:$JEKYLL_VERSION \
		jekyll serve
elif [ "$1" = "build" ] ; then
	docker run --rm \
		--volume="$PWD:/srv/jekyll" \
		-it jekyll/jekyll:$JEKYLL_VERSION \
		jekyll build
else
	echo "$USAGE" 1>&2
	exit 1
fi


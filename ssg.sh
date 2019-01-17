#!/bin/sh
# vim: ft=sh ts=4 sw=4 sts=4 noet
set -eu

# Build images
docker-compose build --force-rm

# Cleanup first
[ -d ./docs ] && rm -rf ./docs
docker-compose down --volumes

# Run teardown at the end
trap 'docker-compose down --volumes --remove-orphans' EXIT

mkdir -p docs
# Run pickles to generate a static site from tests
docker-compose run --user "$(id -u):$(id -g)" pickles "$@"

[ ! -f docs/\.\\/index.html ] || mv docs/\.\\/index.html docs/index.html  

echo "
now available at file:///$PWD/docs/index.html"

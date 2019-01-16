#!/bin/sh
# vim: ft=sh ts=4 sw=4 sts=4 noet
set -eux

UGID="$(id -u):$(id -g)"
export UGID

teardown() {
	status=$?
	set +e
	docker-compose stop
	[ "$status" -eq 0 ] && docker-compose down --volumes --remove-orphans
}

setup() {
	# Build images
	docker-compose build --force-rm

	# Cleanup first
	[ -d ./docs ] && rm -rf ./docs
	docker-compose down --volumes

	# Run teardown at the end
	trap 'teardown' EXIT
}

setup

mkdir -p docs
# Run pickles to generate a static site from tests
docker-compose run pickles "$@"

(cd docs && ln -s README.html index.html)

echo
echo "now available at file:///$PWD/docs/index.html"
echo

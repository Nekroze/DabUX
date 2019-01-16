#!/bin/sh
# vim: ft=sh ts=4 sw=4 sts=4 noet
set -eux

teardown() {
	status=$?
	set +e
	docker-compose stop
	[ "$status" -eq 0 ] && docker-compose down --volumes --remove-orphans
	[ -d /tmp/dabux ] && sudo rm -rf /tmp/dabux
	mkdir -p /tmp/dabux
}

setup() {
	if [ -z "${DAB_WRAPPER_PATH:-}" ]; then
		if [ -r '../dab/dab' ]; then
			DAB_WRAPPER_PATH="$(readlink -f '../dab/dab')"
		else
			DAB_WRAPPER_PATH="$(mktemp)"
			echo Downloading latest Dab wrapper
			curl -o "$DAB_WRAPPER_PATH" https://github.com/Nekroze/dab/raw/master/dab
			chmod 755 "$DAB_WRAPPER_PATH"
		fi
		echo "sha1sum of wrapper $(sha1sum "$DAB_WRAPPER_PATH")"
		export DAB_WRAPPER_PATH
	fi

	# Pull/build the latest test images.
	docker-compose pull || true

	# Cleanup first
	docker-compose down --volumes

	# Run teardown at the end
	trap 'teardown' EXIT
}

setup

# run tests container and pass any params to this script to cucumber.
docker-compose run tests --tags="${TEST_TAGS:-not @none}" --order=random "$@"

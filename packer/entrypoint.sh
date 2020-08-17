#!/bin/sh

USERNAME=packer
# allow the container to be started with `--user`
if [ "$(id -u)" = '0' ]; then
	# find . \! -user $USERNAME -exec chown $USERNAME '{}' +
	exec su-exec $USERNAME "$0" "$@"
fi

exec "$@"

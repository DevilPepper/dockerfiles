#!/bin/sh
USERNAME=docker
set -e

cp -R /tmp/.ssh /home/$USERNAME/.ssh
chmod 700 /home/$USERNAME/.ssh
chmod 600 /home/$USERNAME/.ssh/*
chmod 644 /home/$USERNAME/.ssh/*.pub

exec "$@"

#!/bin/sh

INSTALL_LOCATION=/opt/Unity
DOWNLOAD_LOCATION=/app/unity_download
UNITY_COMPONENTS="Unity,Mac-Mono,Windows-Mono,Linux"

echo "Start Unity3D installer."
mkdir -p ${INSTALL_LOCATION}
mkdir -p ${DOWNLOAD_LOCATION}
printf 'y\n' | /app/unity_setup --unattended --components=${UNITY_COMPONENTS} --install-location ${INSTALL_LOCATION} --download-location ${DOWNLOAD_LOCATION}
rm -rf ${DOWNLOAD_LOCATION}

FROM ubuntu:bionic

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r unity \
 && useradd -r -g unity -u 1001 -ms /bin/bash unity

# install curl to allow downloading Unity before all the dependencies
RUN set -ex; \
    apt-get update; \
    apt-get install -y curl; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

# Download Unity
RUN set -ex; \
    mkdir /app; \
    curl -o /app/unity_setup -s https://beta.unity3d.com/download/48afb4a72b1a/UnitySetup-2018.2.1f1 \
 && chmod +x /app/unity_setup \
 && chown -R unity:unity /app

# install dependencies
RUN set -ex; \
    apt-get -qq update; \
    apt-get -qq install -y debconf \
                           gconf-service \
                           git \
                           imagemagick \
                           lib32gcc1 \
                           lib32stdc++6 \
                           libarchive13 \
                           libasound2 \
                           libc6 \
                           libc6-i386 \
                           libcairo2 \
                           libcap2 \
                           libcups2 \
                           libdbus-1-3 \
                           libexpat1 \
                           libfontconfig1 \
                           libfreetype6 \
                           libgcc1 \
                           libgconf-2-4 \
                           libgdk-pixbuf2.0-0 \
                           libgl1-mesa-glx \
                           libglib2.0-0 \
                           libglu1-mesa \
                           libgtk2.0-0 \
                           libgtk-3-0 \
                           libnspr4 \
                           libnss3 \
                           libpango1.0-0 \
                           libpng-dev \
                           libpq5 \
                           libsoup2.4-1 \
                           libstdc++6 \
                           libx11-6 \
                           libxcomposite1 \
                           libxcursor1 \
                           libxdamage1 \
                           libxext6 \
                           libxfixes3 \
                           libxi6 \
                           libxrandr2 \
                           libxrender1 \
                           libxtst6 \
                           lsb-release \
                           npm \
                           python-pip \
                           python3-pip \
                           python3-venv \
                           stow \
                           xdg-utils \
                           xvfb \
                           zlib1g \
                           ; \
    rm -rf /var/lib/apt/lists/*

# create this directory for user before changing user
RUN mkdir -p /opt/Unity \
 && chown -R unity:unity /opt/Unity

# add user to audio group
RUN usermod -a -G audio unity

# Change to user
USER unity
WORKDIR /home/unity

# install Unity
COPY --chown=unity get-unity.sh /app/get-unity.sh
RUN set -ex; \
    chmod +x /app/get-unity.sh \
 && /app/get-unity.sh

# add Unity to PATH
ENV PATH="~/bin/:${PATH}"
RUN mkdir /home/unity/bin \
 && ln -s /opt/Unity/Editor/Unity /home/unity/bin/unity

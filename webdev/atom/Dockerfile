FROM supastuff/webdev:base

RUN curl -L https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add - \
 && echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" >> /etc/apt/sources.list.d/atom.list \
 && apt-get update && apt-get install -y --no-install-recommends atom \
 && rm -rf /var/lib/apt/lists/* /tmp/*.deb \
 && echo "apm install --packages-file ~/.atom/.packages" >> /usr/local/bin/docker-finish

CMD ["bash"]

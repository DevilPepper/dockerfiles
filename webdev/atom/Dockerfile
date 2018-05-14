FROM supastuff/webdev:base

RUN apt-get update && apt-get install -y --no-install-recommends apt-transport-https \
 && curl -L https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add - \
 && echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" >> /etc/apt/sources.list.d/atom.list \
 && apt-get update && apt-get install -y --no-install-recommends atom \
 && rm -rf /var/lib/apt/lists/* /tmp/*.deb

CMD ["bash"]

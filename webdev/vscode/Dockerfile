FROM supastuff/webdev:base

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
 && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
 && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
 && apt-get update && apt-get install -y --no-install-recommends \
								code \
                libasound2 \
								libgtk2.0-0 \
								libX11-xcb1 \
                libxss1 \
                libxtst6 \
 && rm -rf /var/lib/apt/lists/* /tmp/*.deb

CMD ["bash"]

# Using Dockerfile because mounting vscode volumes gives permission denied...
FROM alpine:3.12

ARG USERNAME=docker

RUN addgroup -g 1000 $USERNAME \
 && adduser -D $USERNAME -s /bin/bash -G $USERNAME \
 && mkdir -p /home/$USERNAME/workspace \
        /home/$USERNAME/.vscode-server/extensions \
        /home/$USERNAME/.vscode-server-insiders/extensions \
 && chown -R $USERNAME \
        /home/$USERNAME/workspace \
        /home/$USERNAME/.vscode-server \
        /home/$USERNAME/.vscode-server-insiders

# might be better to publish my own image
# so that everytime the container is rebuilt
# I wouldn't have to sit through these installations... It's fast, though
RUN apk update \
 && apk add -u --no-cache \
            bash \
            git \
            jq \
            less \
            openssh-client \
            vim

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT ["/bin/entrypoint.sh"]

FROM node:16.13.2-bullseye-slim as build-base
LABEL org.opencontainers.image.source https://github.com/SupaStuff/dockerfiles/images/node

ARG USERNAME=vscode

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
                    ca-certificates \
                    curl \
                    git \
                    gnupg \
                    jq \
                    less \
                    ssh-client \
                    vim \
 && rm -rf /var/lib/apt/lists/*


FROM build-base as test-base

RUN set -ex
RUN node --version
RUN git --version
RUN jq --version


FROM build-base as build-vscode

RUN usermod --login $USERNAME --move-home --home /home/$USERNAME $(id -nu 1000) \
 && mkdir -p /home/$USERNAME/workspace/node_modules \
        /home/$USERNAME/.vscode-server/extensions \
        /home/$USERNAME/.vscode-server-insiders/extensions \
 && chown -R $USERNAME \
        /home/$USERNAME/workspace \
        /home/$USERNAME/.vscode-server \
        /home/$USERNAME/.vscode-server-insiders

WORKDIR /home/$USERNAME


FROM build-vscode as test-vscode

RUN set -ex
RUN [ $(id -u vscode) = 1000 ]

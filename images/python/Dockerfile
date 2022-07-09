from python:3.10.5-slim as build-base

ARG USERNAME=python

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
                    ca-certificates \
                    curl \
                    git \
                    gnupg \
                    less \
                    ssh-client \
                    vim \
 && rm -rf /var/lib/apt/lists/*

RUN useradd $USERNAME -ms /bin/bash


FROM build-base as test-base

RUN set -ex
RUN python --version
RUN git --version


FROM build-base as build-poetry

USER $USERNAME
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="~/.local/bin:${PATH}"
USER root


FROM build-poetry as test-poetry

USER $USERNAME
RUN set -ex
RUN ~/.local/bin/poetry --version

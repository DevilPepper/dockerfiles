# https://lab.github.com/githubtraining/github-actions:-publish-to-github-packages
FROM mcr.microsoft.com/dotnet/core/sdk:3.1

ARG USERNAME=mono

RUN useradd $USERNAME -s /bin/bash \
 && mkdir -p /home/$USERNAME/.vscode-server/extensions \
        /home/$USERNAME/.vscode-server-insiders/extensions \
 && chown -R $USERNAME \
        /home/$USERNAME/workspace \
        /home/$USERNAME/.vscode-server \
        /home/$USERNAME/.vscode-server-insiders

ENV DEBIAN_FRONTEND=noninteractive

# [Optional] Set up Wine for effect compilation

# Effect compilation requires access to some DirectX compiler stuff so it can't natively work on Linux systems, however we can use it through Wine.

# Install wine64:

# sudo apt install wine64 p7zip-full

# Create wine prefix:

# wget -qO- https://raw.githubusercontent.com/MonoGame/MonoGame/develop/Tools/MonoGame.Effect.Compiler/mgfxc_wine_setup.sh | bash

# If you ever need to undo the script, simply delete the .winemonogame folder in your home directory.

RUN apt-key adv \
        --keyserver hkp://keyserver.ubuntu.com:80 \
        --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
 && echo "deb https://download.mono-project.com/repo/debian stable-buster main" \
  | tee /etc/apt/sources.list.d/mono-official-stable.list \
 && apt-get update \
 && apt-get -y install --no-install-recommends \
      vim \
      less \
      mono-devel \
   # Clean up
 && apt-get autoremove -y \
 && apt-get clean -y \
 && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

COPY dependencies.sh /bin/dependencies.sh
COPY entrypoint.sh /bin/entrypoint.sh
COPY mono_init /bin/mono_init
RUN chmod +x /bin/dependencies.sh
RUN chmod +x /bin/entrypoint.sh
RUN chmod +x /bin/mono_init
ENTRYPOINT ["/bin/entrypoint.sh"]

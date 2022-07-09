# NodeJS

`node:alpine` with a few missing basics installed:

- bash
- curl
- git
- jq
- less
- openssh-client
- vim

Probably better off using `node:latest`, tbh...

## Use with VSCode

I typically have something like this in my _.devcontainer/_

`Dockerfile`

```dockerfile
FROM supastuff/node:14-alpine3.12

ARG USERNAME=node

RUN mkdir -p /home/$USERNAME/workspace/node_modules \
        /home/$USERNAME/.vscode-server/extensions \
        /home/$USERNAME/.vscode-server-insiders/extensions \
 && chown -R $USERNAME \
        /home/$USERNAME/workspace \
        /home/$USERNAME/.vscode-server \
        /home/$USERNAME/.vscode-server-insiders

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT ["/bin/entrypoint.sh"]
```

`entrypoint.sh`

```bash
#!/bin/sh
USERNAME=node
set -e

cp -R /tmp/.ssh /home/$USERNAME/.ssh
chmod 700 /home/$USERNAME/.ssh
chmod 600 /home/$USERNAME/.ssh/*
chmod 644 /home/$USERNAME/.ssh/*.pub

exec "$@"
```

`docker-compose.yml`

```yaml
version: "3"
services:
  web:
    user: node

    build:
      context: .
      dockerfile: Dockerfile

    volumes:
      - ..:/home/node/workspace:cached
      - node_modules:/home/node/workspace/node_modules
      - vscode_server:/home/node/.vscode-server/extensions
      - vscode_server_insiders:/home/node/.vscode-server-insiders/extensions
      # Use your ssh keys from within the container... entrypoint.sh will fix the permissions
      - ~/.ssh:/tmp/.ssh:cached,ro
      # In case you load bash with default settings, changing the history file location
      # prevents the history from being truncated. Add this to your .bashrc:
      # HISTFILE=~/.my_bash_history
      # If you end up with a folder on the host, delete it and create a new file, and rebuild the container
      - ~/.my_bash_history:/home/node/.my_bash_history:cached

    # Overrides default command so things don't shut down after the process ends.
    command: sleep infinity

    ports:
      - "3000:3000"
    networks:
      - default

volumes:
  node_modules:
  vscode_server:
  vscode_server_insiders:
```

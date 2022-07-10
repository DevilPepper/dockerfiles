# Python

Basically `python:slim` with a few missing basics installed for a minimal dev environment:

- ca-certificates
- curl
- git
- gnupg
- less
- ssh-client
- vim

## Tags

I tag the base image with `latest`, `${TAG_FROM_BASE_IMAGE}`, and `${SHA}`.

Similarly images with extras are tagged with `${EXTRA}`, `${EXTRA}-${TAG_FROM_BASE_IMAGE}`, and `${EXTRA}-${SHA}`.

See what I mean here: <https://hub.docker.com/r/supastuff/python/tags>

If you want to pin down an image, you probably want the SHA one. This probably won't work nicely dependabot/renovate, though. Maybe I'll add semver to the tag.

## Use with dev containers

These images were made for use with VSCode, but [dev containers spec](https://github.com/devcontainers/spec/blob/main/docs/specs/devcontainerjson-reference.md) is now it's own thing.
Here's a snippet from a _.devcontainer.json_ in one of my projects:

```jsonc
{
  "name": "${localWorkspaceFolderBasename}",
  "image": "supastuff/python:poetry",
  "mounts": [
    "source=${localWorkspaceFolderBasename}_venv,target=${containerWorkspaceFolder}/.venv,type=volume",

    // VSCode plugins go in these. Prevents having to install every time you rebuild the container:
    // These should really go in customizations.vscode.mounts if it existed...
    "source=vscode_server4python,target=/home/python/.vscode-server/extensions,type=volume",
    "source=vscode_server_insiders4python,target=/home/python/.vscode-server-insiders/extensions,type=volume",
  ],
  "containerUser": "python",
  "postCreateCommand": "chown python .venv",
  // Tool specific configurations (honestly, it should be a separate file...):
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-python.python",
        "editorconfig.editorconfig",
        "bungcip.better-toml",
        "yzhang.markdown-all-in-one",
        "bierner.markdown-mermaid",
        "davidanson.vscode-markdownlint",
      ],
    }
  },
}
```

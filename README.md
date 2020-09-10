# Dockerfiles

## The CI

- On PRs, test stage is built for changed images. (test stage must exist for each _Dockerfile_)
- On merge, the `merge` tag is updated
- On push tags `merge` or `release`, changed each _Dockerfile_ is built and pushed
  - Push tag `release` to trigger the workflow manually
- On docker push success, push tag `latest`
- Ideally, cache layers so that once PR is merged, the docker push build can just use existing layers
  - With a 5GB limit, this may not be that desirable

## Dockerfiles in each directory

Each directory corresponds to a main application. Some are meant to be used with VSCode
while others are just applications I didn't find a satisfying enough docker image for.

### Images for VSCode

I typically have something like this in my _.devcontainer/Dockerfile_

```dockerfile
FROM base_img

ARG USERNAME=user

RUN mkdir -p \
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

_entrypoint.sh_ might be some hacky script that copies ssh keys and changes their permissions.
And then I would mount whatever volumes in either the _docker-compose.yml_ or the _devcontainer.json_

### Other applications

These are built with an entrypoint that uses su-exec or gosu to drop you out of root is you
didn't specify a user.

# Dockerfiles

This repo will contain all my Dockerfiles for stuff like applications and dev
environments until there's a really good reason to separate them.


There are a few handy scripts in the script directory. I would clone this repo
to the home directory and add them to the `PATH` variable like so:

### Linux

My `.bashrc` looks for `~/.optional` and runs it if it exists:
```bash
echo 'PATH=$PATH:$HOME/dockerfiles/scripts/sh/' >> ~/.optional
```

### Windows

> TODO


## The scripts

**docker-build**: Builds the `Dockerfile` and uses the directory to name the image.
Currently, the namespace is hard coded as `supastuff`... Haven't yet figured out how
to get the desired namespace without passing it as an argument.

Optionally, you can pass an argument to give the image a tag.

**docker-generate**: Generates an image named `$USER/home`. All it does is take
a dotfiles repo and runs stow to set up the home directory for the user.
The repo is hardcoded to use mine for now...

**docker-personalize**: Assuming you have a `$USER/home` image by running
`docker-generate`, this will build a new image from the one supplied in the
argument and inject the home directory into it.

**docker-run**: You give it `namespace/image:optionalTag` and extra arguments
for `docker run`, and it will do `docker run` with some arguments that I think
are frequently used. The container is removed after the session is over. (`--rm`)

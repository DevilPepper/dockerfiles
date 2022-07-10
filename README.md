# Dockerfiles

Because Github doesn't point to the right readme on the package page, here's a TOC:

- [Node](images/node/README.md)
- [Python](images/python/README.md)

## Structure

- _images/_: a directory per Dockerfile
- _legacy/_: old images pending migration

Build targets are prefixed with `build-` and `test-` for publishing and (light) testing respectively.

I don't have a decent testing strategy. Test targets basically try checking if relevant tools exist.

## The CI

Only run jobs on changed images. Images are changed if anything in their directory is changed

- On PRs, test targets are built for changed images.
- On merge, build targets are built and pushed to Dockerhub AND GHPR
  - Base image is tagged like:
    - `supastuff/${image}:latest`
    - `supastuff/${image}:${TAG_FROM_BASE_IMAGE}`
    - `supastuff/${image}:${SHA}`
  - Images with extras are tagged like
    - `supastuff/${image}:${extra}`
    - `supastuff/${image}:${extra}-${TAG_FROM_BASE_IMAGE}`
    - `supastuff/${image}:${extra}-${SHA}`

Ideally, I would cache layers so that once PR is merged, the docker push build can just use existing layers...
but with a 5GB limit, this may not be that desirable

I should probably consider using semver on image tags instead of SHA...

# docker-pip-cache

# Introduction

This repository is a fork of https://github.com/aanatoly/docker-pip-cache

The reason for this is because the way that devpi is run has changed since this repo was worked on.  So this is an attempt to fix all those issues, and simplify a bit more, what's going on.

This image runs `devpi` server serving as a caching proxy to the main index.

## Requirements

You need to have a copy of `docker desktop` and `docker-compose` installed on your system.

Edit the `env.example` if desired to use a different name, and copy it to `.env`

## Building an Image

I do not provide a public image of this build.  You'll need to build this yourself.

To do this, run `docker-compose build`

## Using an Image

To run the container, type:

`docker-compose up -d`

To run with Pip:

```
Run pip
```bash
PHOST=localhost
pip install --trusted-host $PHOST --index-url http://$PHOST:3141/root/pypi/+simple/ tox
```

You can access the web interface by visiting: http://127.0.0.1:3141

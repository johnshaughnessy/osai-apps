# `nginx` configuration

This directory contains scripts to set up `nginx` as a reverse proxy so that you can run osai apps on subdomains.

## Setup

- Change the `server_name` in `conf.d/default.conf` to match your subdomain.
- Run `./run.sh`
- Access apps by going to `http://<subdomain>.<yourdomain>.com`

> TODO: SSL support

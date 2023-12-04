# Open Source AI - Apps

This repository contains scripts to help run and develop AI applications inside of isolated Docker containers.

To setup a device to run these scripts, see [osai-ubuntu](https://github.com/johnshaughnessy/osai-ubuntu).

## Usage

Each subdirectory in `apps/` has instructions for setting up that particular application. Usually, the steps are as simple as running `./init.sh` and then running `./run.sh`.

## Running apps on subdomains

One nice way to set things up is to use `nginx` as a reverse proxy, so that if you have a domain like `mydomain.com`, you can access the various applications with subdomains like `comfyui.mydomain.com`, `stable-diffusion-webui.mydomain.com`, `jupyter-lab.mydomain.com`.

See [`apps/nginx/README.md`](./apps/nginx/README.md) for instructions.

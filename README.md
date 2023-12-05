# Open Source AI - Apps

This repository contains scripts to help run and develop AI applications inside Docker containers.

## Apps

| Status | App                                                                    | Summary                                               |
| :----- | :--------------------------------------------------------------------- | :---------------------------------------------------- |
| Great  | [`ComfyUI`](./apps/ComfyUI/README.md)                                  | Powerful and modular Stable Diffusion GUI and backend |
| Great  | [`Fast AI Diffusion Notebooks`](./apps/fastai-diffusion-nbs/README.md) | Jupyter notebooks for getting started with diffusion  |
| WIP    | [`fastbook`](./apps/fastbook/README.md)                                | The fastai book for intro to deep learning            |
| Great  | [`Jupyter Lab`](./apps/jupyter-lab/README.md)                          | Jupyter Lab                                           |
| WIP    | [`Memory Cache`](./apps/memory-cache/README.md)                        | privateGPT for the Memory Cache browser extension     |
| Great  | [`nginx`](./apps/nginx/README.md)                                      | Reverse proxy for running osai-apps on subdomains.    |
| Great  | [`Stable Diffusion WebUI`](./apps/stable-diffusion-webui/README.md)    | A browser interface for Stable Diffusion              |
| WIP    | [`x11vnc`](./apps/x11vnc/README.md)                                    | Remotely control graphical programs                   |

## Usage

To setup a device to run these scripts, see [osai-ubuntu](https://github.com/johnshaughnessy/osai-ubuntu).

Each subdirectory in `apps/` has instructions for setting up that particular application. Usually, the steps are as simple as running `./init.sh` and then running `./run.sh`.

## Running apps on subdomains

One nice way to set things up is to use `nginx` as a reverse proxy, so that if you have a domain like `mydomain.com`, you can access the various applications with subdomains like `comfyui.mydomain.com`, `stable-diffusion-webui.mydomain.com`, `jupyter-lab.mydomain.com`.

See [`apps/nginx/README.md`](./apps/nginx/README.md) for instructions.

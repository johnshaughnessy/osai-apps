# `jupyter-lab`

This directory contains scripts for running [Jupyter Lab](https://jupyter.org/) in a docker container.

## Basic Usage

1. Run `./init.sh` to build the base image.
2. Run `./run.sh`.

## Running notebooks

The base image sets up just enough to run Jupyter Lab. In order to run the various notebooks you come across online, you will need to:

1. Determine the notebooks' dependencies.
2. Create an environment with the dependencies installed.
3. Run Jupyter Lab and load the notebook.

See the [`fastai-diffusion-nbs/README.md`](../apps/fastai-diffusion-nbs/README.md) for a complete walkthrough of these steps.

### Determining dependencies

Each jupyter notebook has its own python dependencies or system dependencies.

- Python dependencies are often specified in a [requirements file](https://pip.pypa.io/en/stable/reference/requirements-file-format/) (`requirements.txt`).
- System dependencies may be specified in project `README` files or other documentation. Alternatively, there might be scripts or lines in the notebook that say things like, `apt install <package>`.

Not all notebooks specify their dependencies explicitly, and documentation can be out of date.

In general, you will need to troubleshoot dependencies like you would for any other program. The good news is that since we are working in containers, it is easy to undo or retrace steps if anything goes wrong.

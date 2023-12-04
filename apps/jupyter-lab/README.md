# `jupyter-lab`

This directory contains scripts for running in jupyter lab.

# Usage

1. Run `./init.sh` to build the base image for running `jupyter-lab`.

2. Run jupyter lab in the container with:

```sh
docker run \
    --rm \
    --gpus all \
    -it \
    --name jupyter-lab-base \
    --publish   7002:7002 \
    --mount type=bind,source="$(pwd)"/code,target=/home/john/code \
    --user "john":"john" \
    jupyter-lab-base \
    /home/john/code/run-jupyter-lab.sh
```

3. Access it via http://192.168.2.234:7002/ (replacing the ip address with the target node's IP).

# Running `fastai/diffusion-nbs`

1. Build `jupyter-lab-base` (following the instructions above).
2. Clone the git repo.

```sh
pushd code
git clone https://github.com/fastai/diffusion-nbs
popd
```

3. Build `jupyter-lab-fastai-diffusion-nbs`

```sh
docker build -f Dockerfile.fastai-diffusion-nbs -t jupyter-lab-fastai-diffusion-nbs .
```

4.  Run it:

```sh
docker run \
     --rm \
     --gpus all \
     -it \
     --name jupyter-lab-fastai-diffusion-nbs \
     --publish 7002:7002 \
     --mount type=bind,source="$(pwd)"/code,target=/home/john/code \
     --mount type=bind,source="$(pwd)"/huggingface-cache,target=/home/john/.cache/huggingface \
     --user "john":"john" \
     jupyter-lab-fastai-diffusion-nbs \
     /home/john/code/run-jupyter-lab.sh
```

5. Access it via http://192.168.2.234:7002/ (replacing the ip address with the target node's IP).

## Note to self [John]

In the previous set up, I ran jupyter lab as a systemd service. This was not in a docker containter. It was just configured to use a particular virtual env (with mamba).

```sh
/home/john/mambaforge/envs/scratch/bin/jupyter lab --config=/home/john/.jupyter/jupyter_lab_config.py --NotebookApp.allow_origin='https://deeplearning8.com' --no-browser
```

# Running `huggingface/notebooks`

There are a bunch of `huggingface/notebooks`. The easiest way to run them is to use `jupyter-lab-base` and then `pip install` whatever you need to run the particular notebook you're interested in. (When you stop running the container, you'll lose all the dependencies you installed, which is usually what you want.)

One exception is large model files that take a long time to download. You'll want to keep those, which we can do by bind mounting huggingface cache directory:

```sh
docker run \
    --rm \
    --gpus all \
    -it \
    --name jupyter-lab-base \
    --publish 7002:7002 \
    --mount type=bind,source="$(pwd)"/code,target=/home/john/code \
    --mount type=bind,source="$(pwd)"/huggingface-cache,target=/home/john/.cache/huggingface \
    --user "john":"john" \
    jupyter-lab-base \
    /home/john/code/run-jupyter-lab.sh
```

# Mounting model files

Large model files take a long time to download

#!/bin/bash
mkdir -p code
pushd code
git clone https://github.com/fastai/diffusion-nbs
popd

mkdir -p setup
cp ../jupyter-lab/setup/run-jupyter-lab.sh setup/

mkdir -p /home/$USER/.cache/huggingface

docker build \
    -f Dockerfile.fastai-diffusion-nbs \
    -t fastai-diffusion-nbs \
    .

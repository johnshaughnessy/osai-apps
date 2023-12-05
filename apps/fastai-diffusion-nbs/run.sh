#!/bin/bash
echo "Stopping fastai-diffusion-nbs if it is running."
docker stop fastai-diffusion-nbs || true
sleep 1

docker network create osai-bridge || true

echo "Ensuring that the code and setup directories are owned by the container user."
echo "This command may require sudo privileges."
# TODO: There should be a better way to do this.
sudo chown -R 1000:1000 ./code ./setup /home/$USER/.cache/huggingface

echo
read -sp "Enter password for Jupyter Lab: " JUPYTER_PASSWORD
echo
echo "Running fastai-diffusion-nbs."
docker run \
    --rm \
    --gpus all \
    -d \
    -it \
    --name fastai-diffusion-nbs \
    --network osai-bridge \
    --publish 7003:7003 \
    --mount type=bind,source="$(pwd)"/code,target=/home/"$USER"/code \
    --mount type=bind,source="$(pwd)"/setup,target=/setup \
    --mount type=bind,source=/home/$USER/.cache/huggingface,target=/home/$USER/.cache/huggingface \
    fastai-diffusion-nbs \
    /setup/run-jupyter-lab.sh "$JUPYTER_PASSWORD" 7003

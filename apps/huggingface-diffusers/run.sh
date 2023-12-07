#!/bin/bash
echo "Stopping huggingface-diffusers if it is running."
docker stop huggingface-diffusers || true
sleep 1

docker network create osai-bridge || true

echo "Starting huggingface-diffusers with interactive shell"
docker run \
    --rm \
    --gpus all \
    -it \
    --name huggingface-diffusers \
    --network osai-bridge \
    --publish 7006:7006 \
    --mount type=bind,source="$(pwd)"/code,target=/home/"$USER"/code \
    --mount type=bind,source=/home/$USER/.cache/huggingface,target=/root/.cache/huggingface \
    huggingface-diffusers \
    bash

# Try this:

#!/bin/bash

echo "Stopping ffmpeg-nvidia if it is running."
docker stop ffmpeg-nvidia || true
sleep 1

docker network create osai-bridge || true

echo "Running ffmpeg-nvidia."
docker run \
    --rm \
    -d \
    --gpus all \
    -it \
    --name ffmpeg-nvidia \
    --network osai-bridge \
    --publish 7007:7007 \
    --mount type=bind,source="$(pwd)",target=/app/data \
    -w /app \
    ffmpeg-nvidia \
    sleep infinity

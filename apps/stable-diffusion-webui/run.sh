#!/bin/bash

echo "Stopping stable-diffusion-webui if it is running."
docker stop stable-diffusion-webui || true
sleep 1

docker network create osai-bridge || true

echo "Running stable-diffusion-webui."
docker run \
  --rm \
  -d \
  --gpus all \
  -it \
  --name stable-diffusion-webui \
  --network osai-bridge \
  --publish 7860:7860 \
  --mount type=bind,source="$(pwd)"/app,target=/app \
  --mount type=bind,source="$(pwd)"/webui-user.sh,target=/app/stable-diffusion-webui/webui-user.sh \
  -w /app \
  --user $USER:$USER \
  stable-diffusion-webui \
  sleep infinity

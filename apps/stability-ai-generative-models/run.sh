#!/bin/bash
echo "Stopping stability-ai-generative-models if it is running."
docker stop stability-ai-generative-models || true
sleep 1

docker network create osai-bridge || true

echo "Starting stability-ai-generative-models with interactive shell"
docker run \
    --rm \
    --gpus all \
    -it \
    --name stability-ai-generative-models \
    --network osai-bridge \
    --publish 7005:7005 \
    --mount type=bind,source="$(pwd)"/code,target=/home/"$USER"/code \
    --mount type=bind,source=/home/$USER/.cache/huggingface,target=/root/.cache/huggingface \
    stability-ai-generative-models \
    bash

# Try this:
# streamlit run scripts/demo/video_sampling.py --server.address 0.0.0.0 --server.port 7005

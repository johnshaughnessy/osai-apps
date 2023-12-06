echo "Stopping comfyui if it is running."
docker stop comfyui || true
sleep 1

docker network create osai-bridge || true

echo "Running comfyui."
docker run \
    --rm \
    -d \
    --gpus all \
    -it \
    --name comfyui \
    --network osai-bridge \
    --publish 8188:8188 \
    --mount type=bind,source="$(pwd)"/ComfyUI,target=/ComfyUI \
    --mount type=bind,source="$(pwd)"/output,target=/ComfyUI/output \
    --mount type=bind,source=/home/$USER/.cache/huggingface,target=/root/.cache/huggingface \
    comfyui \
    python3 /ComfyUI/main.py --listen 0.0.0.0 --port 8188

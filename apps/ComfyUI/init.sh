docker network create osai-bridge || true

git clone https://github.com/comfyanonymous/ComfyUI

docker build -f Dockerfile.ComfyUI -t comfyui .

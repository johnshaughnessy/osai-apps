docker network create osai-bridge || true

git clone https://github.com/comfyanonymous/ComfyUI

# Create a symlink to the model checkpoint
ln -s /root/.cache/huggingface/hub/models--stabilityai--stable-video-diffusion-img2vid/snapshots/0f2d55c1e358d608120344d3ea9c35fb5f2c31b3/svd.safetensors ./ComfyUI/models/checkpoints/svd.safetensors

docker build -f Dockerfile.ComfyUI -t comfyui .

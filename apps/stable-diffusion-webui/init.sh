echo "Building the stable-diffusion-webui image."
docker build \
    --build-arg USER=$USER \
    -f Dockerfile.stable-diffusion-webui \
    -t stable-diffusion-webui \
    .

echo "Running additional container initialization steps."
docker run \
    --rm \
    -it \
    --name stable-diffusion-webui \
    --mount type=bind,source="$(pwd)"/app,target=/app \
    -w /app \
    -e HOST_USER=$USER \
    --entrypoint /entrypoint.sh \
    stable-diffusion-webui

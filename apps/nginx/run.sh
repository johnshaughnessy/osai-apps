echo "Stopping nginx-proxy if it is running."
docker stop nginx-proxy || true

sleep 1

docker network create osai-bridge || true

# If services are not running, then nginx initialization will fail.
# So, if any of the services are not running, we set up a mock service instead,
# running a simple http server.

# Check if comfyui is running.
if [ "$(docker ps -q -f name=comfyui)" ]; then
    echo "comfyui is running."
else
    echo "comfyui is not running."
    echo "Running mock http server."
    docker run \
        --label mock \
        --rm \
        -d \
        --name comfyui \
        --network osai-bridge \
        --publish 8188:8188 \
        --mount type=bind,source="$(pwd)"/mock,target=/mock \
        -w /mock \
        python:3.8.5-slim-buster \
        python -m http.server -b 0.0.0.0 --directory . 8188
fi

echo "Running nginx-proxy."
docker run \
    --rm \
    -it \
    --name nginx-proxy \
    --network osai-bridge \
    -v ./conf.d:/etc/nginx/conf.d \
    -v ./log:/var/log/nginx/ \
    -p 80:80 \
    nginx:latest

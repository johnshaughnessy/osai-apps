echo "Stopping nginx-proxy if it is running."
docker stop nginx-proxy || true

sleep 1

docker network create osai-bridge || true

# If services are not running, then nginx initialization will fail.
# So, if any of the services are not running, we set up a mock service instead,
# running a simple http server.
./mock.sh

echo "Running nginx-proxy."
docker run \
    --rm \
    -it \
    -d \
    --name nginx-proxy \
    --network osai-bridge \
    -v ./conf.d:/etc/nginx/conf.d \
    -v ./log:/var/log/nginx/ \
    -p 80:80 \
    nginx:latest

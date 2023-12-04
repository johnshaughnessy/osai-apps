echo "Stopping nginx-proxy if it is running."
docker stop nginx-proxy || true

sleep 1

docker network create osai-bridge || true

echo "Running nginx-proxy."
docker run --rm -d \
    --name nginx-proxy \
    --network osai-bridge \
    -v ./conf.d:/etc/nginx/conf.d \
    -v ./log:/var/log/nginx/ \
    -p 80:80 \
    nginx:latest

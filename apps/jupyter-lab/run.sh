#!/bin/bash
echo "Stopping jupyter-lab if it is running."
docker stop jupyter-lab || true
sleep 1

docker network create osai-bridge || true

echo
read -sp "Enter password for Jupyter Lab: " JUPYTER_PASSWORD
echo
echo "Running jupyter-lab."
docker run \
    --rm \
    --gpus all \
    -d \
    -it \
    --name jupyter-lab \
    --network osai-bridge \
    --publish 7002:7002 \
    --mount type=bind,source="$(pwd)"/code,target=/home/"$USER"/code \
    jupyter-lab-base \
    /home/john/code/run-jupyter-lab.sh "$JUPYTER_PASSWORD"

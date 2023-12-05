#!/bin/bash

docker build \
    --build-arg USER=$USER \
    -f Dockerfile.jupyter-lab-base \
    -t jupyter-lab-base:latest \
    .

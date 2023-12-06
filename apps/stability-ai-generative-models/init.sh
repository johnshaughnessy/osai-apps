#!/bin/bash

mkdir -p libs
cp /usr/lib/x86_64-linux-gnu/libGL.so.1 ./libs/
cp /usr/lib/x86_64-linux-gnu/libGL.so.1.7.0 ./libs/

docker build \
    -f Dockerfile.stability-ai-generative-models \
    -t stability-ai-generative-models \
    .

if [ -d code ] && [ -d code/generative-models ]; then
    exit 0
fi
mkdir -p code
pushd code
git clone https://github.com/Stability-AI/generative-models.git
popd

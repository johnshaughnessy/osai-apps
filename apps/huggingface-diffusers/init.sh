mkdir -p code

if [ ! -d "code/diffusers" ]; then
    pushd code
    echo "Cloning the huggingface/diffusers repository"
    git clone https://github.com/huggingface/diffusers.git
    popd
fi

echo "Building the huggingface-diffusers image."
docker build \
    -f Dockerfile.diffusers-pytorch-compile-cuda \
    -t huggingface-diffusers \
    .

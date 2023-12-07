# Hugging Face - Diffusers

This setup builds [huggingface/diffusers](https://github.com/huggingface/diffusers/blob/main/examples/dreambooth/README_sdxl.md) from source.

The Dockerfile is taken from the source repo: [diffusers-pytorch-compile-cuda/Dockerfile](https://github.com/huggingface/diffusers/blob/6bf1ca2c799f3f973251854ea3c379a26f216f36/docker/diffusers-pytorch-compile-cuda/Dockerfile#L1C1-L46C18) with minor changes. For example:

```diff
- FROM nvidia/cuda:12.1.0-runtime-ubuntu20.04
+ FROM nvidia/cuda:12.1.1-devel-ubuntu22.04
```

Refer to the source repo for alternatives or changes.

# Usage

Run `./init.sh`.
Run `./run.sh`.

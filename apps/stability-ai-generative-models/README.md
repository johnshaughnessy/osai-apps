# Stability AI Generative Models

This directory contains setup scripts to run [Stability-AI/generative-models](https://github.com/Stability-AI/generative-models) in a docker container.

[The project uses CUDA 11.8](https://github.com/Stability-AI/generative-models/blob/9d759324e914de6c96dbd1468b3a4a50243c6528/pyproject.toml#L45), so we use `nvidia/cuda:11.8.0-devel-ubuntu22.04` as our base image.

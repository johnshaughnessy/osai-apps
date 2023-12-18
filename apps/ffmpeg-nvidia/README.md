# ffmpeg + nvidia + docker

It turns out, there's no need to use this dockerfile. [`jrottenberg/ffmpeg`](https://github.com/jrottenberg/ffmpeg) is all you need.

```sh
docker run --rm -it \
  --gpus=all \
  -v $(pwd):/config \
  jrottenberg/ffmpeg:4.1-nvidia \
  -hwaccel cuvid \
  -c:v h264_cuvid \
  -i /config/input.mkv \
  -vf \
  scale_npp=-1:720 \
  -c:v h264_nvenc \
  -preset slow \
  /config/output.mkv
```

--

Previously, I was trying to build this myself following this documentation and the ffmpeg docs:

- https://docs.nvidia.com/video-technologies/video-codec-sdk/12.0/ffmpeg-with-nvidia-gpu/index.html
- https://github.com/linuxserver/docker-ffmpeg

This was unnecessary.

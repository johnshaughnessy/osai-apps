# ffmpeg + nvidia + docker

Followed the instructions in nvidia documentation:

https://docs.nvidia.com/video-technologies/video-codec-sdk/12.0/ffmpeg-with-nvidia-gpu/index.html

Inspired by https://github.com/linuxserver/docker-ffmpeg

```sh
docker run --rm -it \
  --gpus=all \
  -v $(pwd):/config \
  ffmpeg-nvidia \
  ffmpeg \
  -hwaccel nvdec \
  -i /config/input.mkv \
  -c:v h264_nvenc \
  -b:v 4M \
  -vf scale=1280:720 \
  -c:a copy \
  /config/output.mkv
```

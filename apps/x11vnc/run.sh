docker stop x11vnc || true
docker run --rm -it -p 3389:3389 --name x11vnc --privileged x11vnc

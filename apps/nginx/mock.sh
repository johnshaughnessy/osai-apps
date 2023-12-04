#!/bin/bash

# If services are not running, then nginx initialization will fail.
# So, if any of the services are not running, we set up a mock service instead,
# running a simple http server.

# Declare an associative array
declare -A service_ports
service_ports["comfyui"]="8188"
service_ports["jupyter-lab"]="7002"
# Add other services and their ports here

# Iterate over the array
for service in "${!service_ports[@]}"; do
    port=${service_ports[$service]}

    if [ "$(docker ps -q -f name=$service)" ]; then
        echo "$service is running."
    else
        echo "$service is not running."
        echo "Running mock http server for $service on port $port."

        docker run \
            --label mock \
            --rm \
            -d \
            --name $service \
            --network osai-bridge \
            --publish $port:$port \
            --mount type=bind,source="$(pwd)"/mock,target=/mock \
            -w /mock \
            python:3.8.5-slim-buster \
            python -m http.server -b 0.0.0.0 --directory . $port
    fi
done

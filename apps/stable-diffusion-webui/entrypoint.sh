#!/bin/bash
echo "Running entrypoint.sh"
whoami

chown -R $HOST_USER:$HOST_USER /app

su $HOST_USER -c "cd /app && /container_init.sh"

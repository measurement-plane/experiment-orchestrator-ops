#!/bin/bash

set -e

CONTAINER_NAME="experiment-orchestrator"
IMAGE_NAME="ghcr.io/measurement-plane/experiment-orchestrator:latest"

# Default environment variables
BROKER_URL="nats://172.17.0.1:4222"

echo "Using BROKER_URL=$BROKER_URL"

# Stop and remove any running container with the same name
echo "Stopping and removing existing container (if any)..."
docker stop "$CONTAINER_NAME" >/dev/null 2>&1 || true
docker rm "$CONTAINER_NAME" >/dev/null 2>&1 || true

# Pull the latest pre-built image
echo "Pulling the latest image..."
if ! docker pull "$IMAGE_NAME"; then
    echo "Error: Failed to pull the image. Exiting."
    exit 1
fi

# Run GUI container
echo "Starting the container..."
docker run -d \
    --name "$CONTAINER_NAME" \
    -p 8080:8080 \
    -e BROKER_URL="$BROKER_URL" \
    -e ORCHESTRATOR_URL="$ORCHESTRATOR_URL" \
    "$IMAGE_NAME"

#!/bin/bash

# Create a Docker network
NETWORK_NAME="myapp"
echo "Creating Docker network: $NETWORK_NAME"
docker network create $NETWORK_NAME

# Pull Drupal and PostgreSQL images
DRUPAL_IMAGE="drupal:latest"
POSTGRES_IMAGE="postgres:latest"
echo "Pulling Drupal image: $DRUPAL_IMAGE"
docker pull $DRUPAL_IMAGE
echo "Pulling PostgreSQL image: $POSTGRES_IMAGE"
docker pull $POSTGRES_IMAGE

# Create Docker volumes
VOLUMES=(
  "drupal-modules"
  "drupal-profiles"
  "drupal-sites"
  "drupal-themes"
  "postgres-data"
)
echo "Creating Docker volumes..."
for VOLUME in "${VOLUMES[@]}"; do
  echo "Creating volume: $VOLUME"
  docker volume create $VOLUME
done

echo "Setup complete. Docker network and volumes are ready."

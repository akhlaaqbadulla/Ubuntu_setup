#!/bin/bash

# Author: Akhlaaq Budulla
# Date: 15/10/2024
# Use this script to install docker / docker compose on ubuntu 24.04

# Update and upgrade system packages
echo "Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

# Install Docker if not already installed
echo "Installing Docker..."
sudo apt install -y docker.io

# Download and install Docker Compose from the official GitHub repository
echo "Installing Docker Compose..."
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Make the Docker Compose binary executable
echo "Setting Docker Compose permissions..."
sudo chmod +x /usr/local/bin/docker-compose

# Verify installation of Docker Compose
echo "Verifying Docker Compose installation..."
docker-compose --version

# Notify user that the process is complete
echo "Docker and Docker Compose installation complete."

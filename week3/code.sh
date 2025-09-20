#!/bin/bash
# Week 3 - Docker & GitHub Actions Commands

echo "=== Week 3: Docker and GitHub Actions ==="

# Docker Basics
# Check Docker version
docker --version

# Pull a sample image
docker pull hello-world

# Run a container from the image
docker run hello-world

# List running containers
docker ps

# List all containers (including stopped)
docker ps -a

# Build a Docker image from Dockerfile
docker build -t myapp:1.0 .

# Run a container from custom image
docker run -d -p 8080:80 myapp:1.0

# Check Docker images
docker images

# Stop a running container
docker stop <container_id>

# Remove container
docker rm <container_id>

# Remove image
docker rmi myapp:1.0

# --- GitHub Actions ---
# Example workflow file (.github/workflows/ci.yml)

# name: CI Pipeline
# on:
#   push:
#     branches: [ "main" ]
#   pull_request:
#     branches: [ "main" ]
# jobs:
#   build:
#     runs-on: ubuntu-latest
#     steps:
#     - uses: actions/checkout@v3
#     - name: Set up Docker Buildx
#       uses: docker/setup-buildx-action@v2
#     - name: Login to DockerHub
#       uses: docker/login-action@v2
#       with:
#         username: ${{ secrets.DOCKERHUB_USERNAME }}
#         password: ${{ secrets.DOCKERHUB_TOKEN }}
#     - name: Build and push
#       uses: docker/build-push-action@v3
#       with:
#         push: true
#         tags: user/myapp:latest

echo "=== Week 3 tasks completed ==="

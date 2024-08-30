#!/bin/bash

# 设置变量
DOCKER_USERNAME="mobaijun"
IMAGE_NAME="generator"
TAG="latest"

# 构建 Docker 镜像
echo "Building Docker image..."
docker build -t $DOCKER_USERNAME/$IMAGE_NAME:$TAG .

# 检查构建是否成功
if [ $? -ne 0 ]; then
    echo "Docker build failed. Exiting."
    exit 1
fi

# 查看构建的镜像
echo "Docker images:"
docker images | grep $IMAGE_NAME

# 推送镜像到 Docker Hub
echo "Pushing Docker image to Docker Hub..."
docker push $DOCKER_USERNAME/$IMAGE_NAME:$TAG

# 检查推送是否成功
if [ $? -ne 0 ]; then
    echo "Docker push failed. Exiting."
    exit 1
fi

echo "Docker image successfully pushed to Docker Hub."
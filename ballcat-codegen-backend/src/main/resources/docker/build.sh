#!/bin/bash

# 设置变量
DOCKER_USERNAME="mobaijun"
IMAGE_NAME="generator"
TAG="latest"
EXPORT_NAME="${IMAGE_NAME}_${TAG}"

# 构建 Docker 镜像
echo "Building Docker image..."
docker build -t $DOCKER_USERNAME/$IMAGE_NAME:$TAG .

# 检查构建是否成功
if [ $? -ne 0 ]; then
    echo "Docker build failed. Exiting."
    exit 1
fi

# 导出并压缩镜像为 tar.gz 文件
echo "Exporting and compressing Docker image..."
docker save $DOCKER_USERNAME/$IMAGE_NAME:$TAG | gzip > ${EXPORT_NAME}.tar.gz

# 检查导出和压缩是否成功
if [ $? -ne 0 ]; then
    echo "Export or compression failed. Exiting."
    exit 1
fi

# 从压缩文件中加载 Docker 镜像
echo "Loading Docker image from compressed file..."
gunzip -c ${EXPORT_NAME}.tar.gz | docker load

# 检查加载是否成功
if [ $? -ne 0 ]; then
    echo "Docker load failed. Exiting."
    exit 1
fi

# 推送镜像到 Docker Hub
echo "Pushing Docker image to Docker Hub..."
docker push $DOCKER_USERNAME/$IMAGE_NAME:$TAG

# 检查推送是否成功
if [ $? -ne 0 ]; then
    echo "Docker push failed. Exiting."
    exit 1
fi

echo "Docker image successfully built, compressed, loaded, and pushed to Docker Hub."

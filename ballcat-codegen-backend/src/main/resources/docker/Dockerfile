# syntax=docker/dockerfile:1
# 使用官方的 Eclipse Temurin 作为基础镜像
FROM eclipse-temurin:11-jdk-jammy

# 设置维护者信息
LABEL maintainer="mobaijun <mobaijun8@163.com>"

# 设置工作目录
WORKDIR /usr/local/codegen

# 复制 jar 文件到工作目录
COPY april-codegen.jar .

# 设置 JVM 参数并指定要执行的 jar 文件
ENTRYPOINT ["java", "-Xms256m", "-Xmx512m", "-XX:+UseContainerSupport", "-jar", "april-codegen.jar"]
# 使用 JRE 11 作为基础镜像
FROM openjdk:11-jre-slim

# 配置作者信息
LABEL maintainer="mobaijun8@163.com"

# 设置工作目录
WORKDIR /app

# 复制应用程序的 JAR 文件到工作目录，并将名称更改为 april-codegen.jar
COPY ./ballcat-codegen-backend/target/*.jar ./april-codegen.jar

# 暴露应用程序运行的端口
EXPOSE 8889

# 启动 Spring Boot 应用
ENTRYPOINT ["java", "-Xms256m", "-Xmx512m", "-XX:+UseContainerSupport", "-jar", "april-codegen.jar"]
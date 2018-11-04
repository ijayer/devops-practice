# Program: Dockerfile for API Service
# Build:
# 	docker build -t <image_name> .

# 基础镜像
# Usage: FROM image:tag
FROM alpine:3.8
  
# 设置环境变量
# Usage: ENV <key=value> <key=value>
ENV WorkDir=/home/api

# 指定维护者信息
# Usage: MAINTAINER name
MAINTAINER <xxx@xxx.com>

# 给镜像添加工作目录
# Usage: RUN [命令]
# RUN mkdir -p ${WorkDir}}
# Set Time Zone
RUN echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/main' > /etc/apk/repositories \
	&& echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/community' >> /etc/apk/repositories \
	&& apk update && apk add tzdata \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai/etc/localtime \
	&& echo "Asia/Shanghai" > /etc/timezone

# 设定默认工作路径
# Usage: WORKDIR [path]
WORKDIR ${WorkDir}

# 复制本地应用程序文件[src]到Container的工作目录[dst]
# Usage: COPY [src] [dst]
COPY app ${WorkDir}/

RUN chmod +x ${WorkDir}/app
    
# 容器暴漏给外侧的端口号
# Usage: EXPOSE port [port...]
EXPOSE 80

# 指定容器启动时执行的命令
# Usage: CMD ["executable", "param1", "param2"]
CMD ["./app"]
#!/bin/sh
#
# Program: 部署 Docker 容器服务
# Authors: zhangzhe
# History:
#   2018-10-24：编写脚本实现
#

# Pre Set
set -x

# Set Var
Tag=$1                                    # 读取 git tag (版本号：x.y.z)
Commit=$2                                 # 读取 git commit 号(8位)

if [ -z ${Tag} ]; then
    echo -e "Empty git tag given"
    exit 1
fi

ImageName=go-app:${Tag}                   # 镜像名
Registry=repo.company.com:5000            # 私有仓库地址
BaseImage=${Registry}/${ImageName}        # 远程 Image 地址：docker pull ${BaseImage}
ContainerName=api${Tag}

# Reconfigure docker-compose.yml & Caddyfile
sed -i "s/api(@tag)/${ContainerName}/g" docker-compose.yml  # 启动对应版本(Tag)的 API 容器
sed -i "s/(@tag)/${Tag}/g" dockere-compose.yml              # 拉去对应版本(Tag)的 API 镜像
sed -i "s/api(@tag)/${ContainerName}/g" Caddyfile           # Caddy 代理到对应版本的 API 容器服务

# Pull image and run docker container
docker pull ${BaseImage}
docker-compose up -d
docker ps
docker-compose logs caddy
docker-compose logs mgo
docker logs api${Tag}

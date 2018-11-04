#!/bin/sh
#
# Program: 构建 Go-App & 打包资源文件
# Authors: zhangzhe
# History:
#   2018-10-24：编写脚本实现
#

# Pre Set
set -x

# Set ENV
export GO111MODULE=on                               # Go1.11.x 版本需要开启
export http_proxy=http://10.0.0.121:1080
export https_proxy=${http_proxy}

# Set Var
Src=../                                             # 程序源码
Out="app"
Options="-a -installsuffix cgo -o"
# PreSet='GOOS=linux GOARCH=amd64'                  # 构建变量设置

# Build
go version
go env

CGO_ENABLED=0 go build -o ${Out} ${Src}             # build

# Package
tar -zcvf release.tar.gz ../www ./*
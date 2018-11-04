#!/bin/sh
#
# Program: API 单元测试脚本
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
DB=$1                                               # Database Server Address
if [ -z $1 ]; then
    DB=mgo:27017
fi

# Golang Test
echo Test Info: $@                                  # 打印构建信息, 脚本执行参数
                                                    # ${DRONE_COMMIT_BRANCH}
                                                    # ${DRONE_COMMIT_SHA:0:8}
                                                    # ${DRONE_BUILD_EVENT}
                                                    # ${DRONE_COMMIT_MESSAGE}
                                                    # ${DRONE_TAG}
echo $PWD

go mod tidy                                         # 解决依赖包
go test -v --cover ${Src} --db_addr=${DB}           # 'mgo:27017' Drone 提供的数据库服务
                                                    # 'localhost:27017' 宿主机提供的数据库服务
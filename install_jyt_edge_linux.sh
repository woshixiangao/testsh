#!/bin/bash

# timedatectl set-timezone Asia/Shanghai

# if [ -f "/etc/redhat-release" ]
# then 
# yum install -y wget
# fi

# cd /tmp
# wget http://resource.jiayuntong.com/cloud/node_exporter-1.0.0-rc.0.linux-amd64.tar.gz
# wget http://resource.jiayuntong.com/cloud/node_exporter.service

# tar -zxvf node_exporter-1.0.0-rc.0.linux-amd64.tar.gz
# mv node_exporter-1.0.0-rc.0.linux-amd64 /usr/local/node_exporter
# cp node_exporter.service /lib/systemd/system/
# /sbin/restorecon -v /usr/local/node_exporter/node_exporter
# systemctl start node_exporter
# systemctl enable node_exporter
# timedatectl set-timezone Asia/Shanghai

mkdir /home/edgex
# # ==========卸载============
sudo apt-get autoremove docker docker-ce docker-engine  docker.io  containerd runc
sudo apt-get autoremove docker-ce-*
sudo rm -rf /etc/systemd/system/docker.service.d
sudo rm -rf /var/lib/docker
sudo rm /usr/local/bin/docker-compose # 卸载docker-compose
# =============安装==========
curl -sSL https://get.daocloud.io/docker | sh #docker安装
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker-compose -version # 查看docker-compose版本 

mkdir -p /home/edgex/docker-compose
# sudo curl -L https://github.com/woshixiangao/testsh/blob/master/docker-compose-geneva-redis-no-secty.yml -o /home/edgex/docker-compose
sudo wget -P /home/edgex/docker-compose https://github.com/woshixiangao/testsh/blob/master/docker-compose-geneva-redis-no-secty.yml
cd /home/edgex/docker-compose
mv docker-compose-geneva-redis-no-secty.yml docker-compose.yml
docker-compose up -d
docker-compose ps
# sudo rm /usr/local/bin/docker-compose # 卸载docker-compose

# ====安装docker-compose指令串=====
# sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

# docker -v # 查看docker版本

# ====卸载docker指令串=====
# 删除某软件,及其安装时自动安装的所有包
#  sudo apt-get autoremove docker docker-ce docker-engine  docker.io  containerd runc
#  sudo apt-get autoremove docker-ce-*
#  sudo rm -rf /etc/systemd/system/docker.service.d
#  sudo rm -rf /var/lib/docker
# ======安装docker指令串=========
# curl -sSL https://get.daocloud.io/docker | sh

#  =====================
# $ dpkg -i libltdl7_2.4.6-0.1_amd64.deb	# 必须先安装docker-ce依赖包
# $ dpkg -i docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb	# 安装docker-ce
# $ docker version	# 查看docker版本



# wget -qO- https://get.docker.com/ | sh

# curl -sSL https://get.daocloud.io/docker | sh

# 新建docker存储目录
# mkdir -p /data/program/docker

# 查询默认的存储路径
# sudo docker info | grep "Docker Root Dir"

# sudo service docker stop

# sudo ln -s /data/program/docker /var/lib/docker

# sudo service docker start

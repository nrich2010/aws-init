#!/bin/bash
set -e -x

#install nginx & memcached
sudo echo 'deb http://ppa.launchpad.net/nginx/stable/ubuntu precise main' >> /etc/apt/sources.list
sudo echo 'deb-src http://ppa.launchpad.net/nginx/stable/ubuntu precise main ' >> /etc/apt/sources.list
sudo apt-get -q -y update && apt-get -q -y install nginx memcached
wait

#let's replace the nginx config file and mime types
sudo curl -Lsk https://github.com/nrich2010/server-configs/archive/master.zip

sudo mv server-configs/nginx/mime.types > /etc/nginx/mime.types
sudo mv server-configs/nginx/nginx.conf > /etc/nginx/nginx.conf

sudo mkdir /etc/nginx/conf
sudo rsync server-configs/nginx/conf/* /etc/nginx/conf/

# Install and use so firewalls are saved through restarts
sudo apt-get install -y iptables-persistent
sudo service iptables-persistent start
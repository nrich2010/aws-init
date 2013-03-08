#!/bin/bash
set -e -x

#prepare instance
apt-get -q -y install python-software-properties
wait
apt-get -q -y update
wait

#install nginx
add-apt-repository ppa:nginx/stable
wait
apt-get -q -y update && apt-get install nginx
wait

#install mysql
DEBIAN_FRONTEND=noninteractive
apt-get -q -y install mysql-server mysql-client
wait
#sudo mysql_secure_installation

#install memcached
apt-get -q -y install memcached
wait

#install php
apt-get -q -y install php5-cli php5-common php5-mysql php5-suhosin php5-gd php5-fpm php5-cgi php-pear php5-memcache php-apc php5-geoip php5-curl php5-dev php5-mhash php5-pgsql php5-sqlite php5-tidy php5-xmlrpc php5-mcrypt php5-imagick php5-ffmpeg
wait

#configure services

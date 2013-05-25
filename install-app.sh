#!/bin/bash
set -e -x

#prepare instance
apt-get -q -y install python-software-properties
wait
apt-get -q -y update
wait

#install memcached
apt-get -q -y install memcached
wait

#install php
apt-get -q -y install php5-cli php5-fpm php5-mysql php5-suhosin php5-gd php-pear php5-memcache php-apc php5-curl php5-mhash php5-mcrypt
wait
#optional php modules
apt-get -q -y install php5-dev php5-geoip php5-pgsql php5-sqlite php5-tidy php5-imagick php5-ffmpeg php5-xmlrpc
wait

#other packages
apt-get -q -y install git-core

#configure services

# Install composer globally
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer



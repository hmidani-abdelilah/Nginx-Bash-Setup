#!/bin/bash    

#remove apache2
service apache2 stop;
rm /etc/init.d/apache2;

#enable mysql
mv /etc/init.d/mysql.conf-disable /etc/init.d/mysql.conf;

#update packages
apt-get update;

#install basic software
apt-get -y install nginx;
apt-get -y install nano;
apt-get -y install htop;
apt-get -y install imagemagick;
apt-get -y install mcrypt;
apt-get -y install curl;
apt-get -y install mysql-server;
apt-get -y install zip;
apt-get -y install ufw;
apt-get -y install zlib;

#install php packages
apt-get -y install php5-fpm;
apt-get -y install php5-tidy;
apt-get -y install php5-memcache;
apt-get -y install php5-pspell;
apt-get -y install php5-ssh2;
apt-get -y install php5-sqlite;
apt-get -y install php5-mysql;
apt-get -y install php5-mcrypt;
apt-get -y install php5-curl;
apt-get -y install php5-gd;
apt-get -y install php5-cgi;
apt-get -y install php5-cli;
apt-get -y install php5-curl;
apt-get -y install php5-memcache;
apt-get -y install php5-tidy;
##
apt-get -y install php-fileinfo;
apt-get -y install php-iconv;
apt-get -y install php-zlib;
apt-get -y install php-openssl;
apt-get -y install php-xmlreader;
apt-get -y install php-xmlwriter;

#start up nginx
service nginx start;

#firewall?
##ufw allow ssh;
##ufw allow http;
##ufw enable;
##ufw status verbose;

#set up nginx a little bit
rm /etc/nginx/sites-enabled/default;
sed -i "s/127\.0\.0\.1\:9000/\/var\/run\/php5\-fpm\.sock/g" /etc/php5/fpm/pool.d/www.conf;
service php5-fpm restart;
service nginx restart;

#this is where we can put our site specific set up...
##make site available file
##link site available file
##search and replace site available file
##make website directory
##dump sql on remote
##sync up website with preview
##search and replace sql
##search and replace configs
##set permissions
##chown -R www-data:www-data /path/to/directory
##restart nginx

##TODO: More complete tweaking of nginx, mysql, ubuntu settings for super speed

#And..
echo 'Done!'

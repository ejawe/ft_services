#!/bin/sh

if [[ ! -d "/var/lib/mysql/mysql" || ! -d "/var/lib/mysql/wordpress" || ! -d "/var/lib/mysql/phpmyadmin" ]]
then
	mysql_install_db --datadir=/var/lib/mysql
	rc-service mariadb restart
	mysql -u root mysql < ./mysql.sql
	mysql -u root wordpress < ./wordpress.sql
	rc-service mariadb stop
	mysqld --user=root
fi
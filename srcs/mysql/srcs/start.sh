#!/bin/sh

if [[ ! -d "/var/lib/mysql/mysql" ]] 
then
	mysql_install_db --datadir=/var/lib/mysql
    mysqld --user=root --init_file=/mysql.sql
fi
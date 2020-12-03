#!/bin/bash

#mkdir -p /run/mysqld
#chown -R mysql:mysql /run/mysqld

#mkdir -p /var/lib/mysql 
#chown -R mysql:mysql /var/lib/mysql 

#chmod 1777 /var/run/mysqld /var/lib/mysql 

/etc/init.d/mariadb setup
/etc/init.d/mariadb start

mysql_install_db --user=mysql --datadir=/var/lib/mysql

rc-service mariadb start

mysqladmin -u root password toor

#touch /run/mysqld/mysqld.sock
#chmod +x /run/mysqld/mysqld.sock
#ln -s /run/mysqld/mysqld.sock /tmp/mysqld.sock





mysql_secure_installation <<EOF
n
password
password
y
y
y
y
y
EOF

rc-service mariadb restart
rc-update add mariadb default

mysql < /tmp/mysql.sql
mysql -u root --password='password'
#!/bin/sh

echo -e "$PASSWORD\n$PASSWORD" | adduser -h ftp/$USER -s /sbin/nologin $USER
mkdir -p ftp/$USER
chown $USER:$USER ftp/$USER

exec /usr/sbin/vsftpd -opasv_min_port=21000 -opasv_max_port=21001 -opasv_address=192.168.49.2 /etc/vsftpd/vsftpd.conf
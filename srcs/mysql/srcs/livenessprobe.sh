#!/bin/sh
mysql --user=root<< EOF
SHOW DATABASES;
EOF
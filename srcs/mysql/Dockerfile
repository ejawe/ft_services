FROM alpine

# Installing packages MariaDB
RUN apk update \
	&& apk add --no-cache mysql mysql-client su-exec\
    && apk add openrc \
 	&& addgroup mysql mysql \
	&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld /var/lib/mysql \
	&& chmod 1777 /var/run/mysqld /var/lib/mysql 

RUN openrc ; touch /run/openrc/softlevel

RUN sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i 's/skip-bind-address/#skip-bind-address/g' /etc/my.cnf.d/mariadb-server.cnf

ADD ./srcs/mysql.sql /tmp
ADD ./srcs/start.sh .
COPY ./srcs/my.cnf /etc/my.cnf

RUN chmod 777 ./start.sh

#VOLUME [ “/sys/fs/cgroup” ]
VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

CMD ["/bin/ash","/start.sh"]
#ENTRYPOINT ["./start.sh"]
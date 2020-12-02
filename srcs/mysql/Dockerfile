FROM alpine

# Installing packages MariaDB
RUN apk update ; apk add bash mysql mysql-client openrc 


RUN sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i 's/skip-bind-address/#skip-bind-address/g' /etc/my.cnf.d/mariadb-server.cnf

ADD ./srcs/mysql.sql /tmp
ADD srcs/start.sh .

RUN chmod 777 ./start.sh

#VOLUME [ “/sys/fs/cgroup” ]
VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

CMD ["/bin/ash","/start.sh"]
#ENTRYPOINT ["./start.sh"]
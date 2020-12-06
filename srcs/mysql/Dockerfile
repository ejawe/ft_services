FROM alpine


RUN apk update \
	&& apk add --no-cache mysql mysql-client \
 	&& addgroup mysql mysql \
	&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld /var/lib/mysql \
	&& chmod 1777 /var/run/mysqld /var/lib/mysql 

COPY ./srcs/my.cnf /etc/my.cnf
COPY ./srcs/mysql.sql /mysql.sql
COPY ./srcs/start.sh .

RUN chmod 777 start.sh
EXPOSE 3306

ENTRYPOINT [ "./start.sh" ]
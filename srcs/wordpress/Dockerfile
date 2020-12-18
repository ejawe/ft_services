FROM	alpine

RUN	apk update && apk add lighttpd nginx curl php7 php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype mysql-client 
RUN apk add --no-cache openrc openssl openssh 


RUN curl -O https://wordpress.org/latest.tar.gz && tar xf latest.tar.gz && rm latest.tar.gz && mv wordpress /var/www/


RUN	mkdir -p var/run/nginx
COPY ./srcs/index_nginx.html var/www/

RUN	rm /etc/nginx/nginx.conf
COPY ./srcs/nginx.conf /etc/nginx/nginx.conf

COPY ./srcs/wp-config.php var/www/wordpress/

#RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/nginx-selfsigned.key -out /etc/nginx/nginx-selfsigned.crt -subj "/C=FR/ST=IDF/L=Paris/O=Company/OU=42/CN=mywebsite.com" 

COPY ./srcs/start.sh .
RUN	chmod +x start.sh

EXPOSE 5050

CMD	["sh", "./start.sh" ]
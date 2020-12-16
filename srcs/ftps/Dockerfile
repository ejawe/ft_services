FROM	alpine

RUN	apk update ; \
    apk add vsftpd ; \
	apk add --no-cache openrc openssl openssh

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/vsftpd.key.pem -out /etc/ssl/certs/vsftpd.cert.pem -subj "/C=FR/ST=IDF/L=Paris/O=Company/OU=42/CN=ftservices"  

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

ADD start.sh /

RUN chmod 775 start.sh

EXPOSE 20 21 21000-21001

CMD /start.sh
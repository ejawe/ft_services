FROM alpine

#voir pour ssh et rc
RUN	apk update && apk add nginx ; \
	apk add --no-cache openrc openssl openssh

#dossier nécessaire pour le fichier nginx.pid (run/nginx/nginx.pid)
RUN	mkdir -p var/run/nginx

RUN	mkdir -p /var/www/app
COPY index.html /var/www/app

COPY nginx.conf /etc/nginx/nginx.conf

#certificat ssl
RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=IDF/L=Paris/O=Company/OU=42/CN=mywebsite.com" 

EXPOSE	80 443

CMD ["nginx", "-g", "daemon off;"]
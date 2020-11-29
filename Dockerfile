FROM alpine:latest
RUN apk update \
    && apk add apache2 \
    && sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/httpd.conf \
    && chmod -R 777 /var/www/logs 

LABEL maintainer='Anitaaa'
CMD [ "httpd", "-D", "FOREGROUND" ]

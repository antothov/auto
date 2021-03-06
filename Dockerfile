FROM alpine:latest
RUN apk update \
    && apk add apache2 \
    && sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/httpd.conf \
    && chgrp -R 0 /var/www/logs/  /usr/sbin/httpd \
    && chmod -R g=u /var/www/logs/ /usr/sbin/httpd 

USER 1001
LABEL maintainer='Anitaaa'
CMD [ "httpd", "-D", "FOREGROUND" ]

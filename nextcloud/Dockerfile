FROM debian:buster

ARG DEBIAN_FRONTED=noninteractive
RUN apt update ; apt install -y dialog nginx vim curl unzip bash php-fpm php-gd php-json php-mysql php-curl php-mbstring php-intl php-imagick php-xml php-zip php-sqlite3

RUN curl https://download.nextcloud.com/server/releases/nextcloud-13.0.6.zip -Lvo /var/www/nextcloud-13.0.6.zip
RUN cd /var/www/ ; unzip nextcloud-13.0.6.zip
RUN chown www-data /var/www/nextcloud/
RUN chown www-data /var/www/nextcloud/config/
RUN chown www-data /var/www/nextcloud/apps/

RUN rm /etc/nginx/sites-enabled/default
COPY nginx.conf /etc/nginx/sites-available/nextcloud
RUN ln -s /etc/nginx/sites-available/nextcloud /etc/nginx/sites-enabled/nextcloud

RUN mkdir /var/run/php

ENTRYPOINT /usr/sbin/service nginx restart ; /usr/sbin/service php7.2-fpm restart ; /bin/bash

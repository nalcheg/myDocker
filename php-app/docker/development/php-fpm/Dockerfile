FROM php:7.4-fpm-alpine

ARG USER_ID
ARG GROUP_ID

RUN sed -i "s/82/$USER_ID/g" /etc/passwd
RUN sed -i "s/82/$GROUP_ID/g" /etc/group
RUN chown $USER_ID:$GROUP_ID -R /home/www-data/

RUN apk update && apk add autoconf g++ make \
    && pecl install xdebug \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable xdebug

RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

RUN apk update && apk add postgresql-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql

COPY ./development/php/conf.d /usr/local/etc/php/conf.d
COPY ./development/php-fpm/conf.d /usr/local/etc/php/conf.d

WORKDIR /app

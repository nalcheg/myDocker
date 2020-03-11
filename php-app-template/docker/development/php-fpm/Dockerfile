FROM php:7.4-fpm-alpine

RUN apk update && apk add git openssh-client unzip

# You should merge all `RUN docker-php-ext-install something` in one string
RUN apk add postgresql-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pgsql pdo_pgsql
RUN docker-php-ext-install mysqli pdo_mysql
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pcntl
RUN apk add libzip-dev \
    && docker-php-ext-install zip
RUN apk add freetype-dev libjpeg-turbo-dev libpng-dev \
    && docker-php-ext-install gd

RUN rm -rf /tmp/* /var/cache/apk/*

RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini
COPY ./development/php/conf.d /usr/local/etc/php/conf.d
COPY ./development/php-fpm/conf.d /usr/local/etc/php/conf.d

WORKDIR /app

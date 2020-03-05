FROM php:7.4-fpm-alpine

RUN apk update && apk add autoconf g++ make \
    && pecl install xdebug \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable xdebug

RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

# You should merge all `RUN docker-php-ext-install something` in one string
RUN apk add postgresql-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install mysqli pdo_mysql
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pcntl

RUN rm -rf /tmp/* /var/cache/apk/*

COPY ./development/php/conf.d /usr/local/etc/php/conf.d
COPY ./development/php-xdebug-fpm/conf.d /usr/local/etc/php/conf.d

WORKDIR /app

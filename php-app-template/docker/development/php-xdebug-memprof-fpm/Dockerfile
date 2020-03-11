FROM php:7.4-fpm-buster

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y build-essential \
    && pecl install xdebug \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable xdebug

RUN apt install -y libjudy-dev libjudydebian1 \
    && pecl channel-update pecl.php.net \
    && pecl install memprof-2.0.0

# You should merge all `RUN docker-php-ext-install something` in one string
#RUN apt install postgresql-dev \
RUN apt install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pgsql pdo_pgsql
RUN docker-php-ext-install mysqli pdo_mysql
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pcntl

RUN apt-get clean && apt-get autoclean

RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini
COPY ./development/php/conf.d /usr/local/etc/php/conf.d
COPY ./development/php-xdebug-memprof-fpm/conf.d /usr/local/etc/php/conf.d

WORKDIR /app

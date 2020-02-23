FROM php:7.4-cli-alpine

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

COPY ./development/php/conf.d /usr/local/etc/php/conf.d

# You should merge all `RUN docker-php-ext-install something` in one string
RUN apk update && apk add postgresql-dev unzip \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install mysqli pdo_mysql
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pcntl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin --filename=composer --quiet

USER $USER_ID:$GROUP_ID

RUN composer global require hirak/prestissimo --no-plugins --no-scripts \
    && rm -rf ~/.composer/cache

WORKDIR /app

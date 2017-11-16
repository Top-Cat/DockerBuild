FROM bitnami/php-fpm

RUN apt-get update
RUN apt-get install -y autoconf make gcc pkg-config zlib1g-dev libmemcached-dev ssmtp
RUN pecl install memcached

RUN apt-get remove --purge --auto-remove -y autoconf make gcc pkg-config

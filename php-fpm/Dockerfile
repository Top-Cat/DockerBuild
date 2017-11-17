FROM bitnami/php-fpm

RUN apt-get update
RUN apt-get install -y autoconf make gcc pkg-config zlib1g-dev libmemcached-dev ssmtp libssl-dev
RUN pecl install memcached mongodb

RUN apt-get remove --purge --auto-remove -y autoconf make gcc pkg-config libssl-dev

FROM bitnami/php-fpm:7.4

RUN apt-get update
RUN apt-get install -y autoconf make gcc pkg-config zlib1g-dev libmemcached-dev ssmtp libssl-dev php-pdo-pgsql
RUN pecl install memcached redis mongodb

RUN apt-get remove --purge --auto-remove -y autoconf make gcc pkg-config libssl-dev

RUN sed -e 's/;clear_env = no/clear_env = no/' -i /opt/bitnami/php/etc/php-fpm.d/www.conf && \
    sed -e 's/;catch_workers_output = yes/catch_workers_output = yes/' -i /opt/bitnami/php/etc/php-fpm.d/www.conf && \
    sed -e 's/pm.max_children = 5/pm.max_children = 25/' -i /opt/bitnami/php/etc/php-fpm.d/www.conf

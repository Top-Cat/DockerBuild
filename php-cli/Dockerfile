FROM php:7.1-cli

RUN apt-get install -y libzip-dev zip

RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install pdo pdo_mysql zip

RUN apt-get update
RUN apt-get install -y ssmtp

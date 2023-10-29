FROM php:7-cli

RUN apt-get update
RUN apt-get install -y libzip-dev zip msmtp-mta

RUN docker-php-ext-install pdo pdo_mysql zip mysqli

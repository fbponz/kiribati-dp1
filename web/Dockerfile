FROM php:5-apache

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update

RUN apt-get install -y \
    git \
    nano \
    libpng-dev \
    libmcrypt-dev \ 
    libpq-dev \  
    zlib1g-dev \
    zip \
    unzip &&\
    a2enmod rewrite

RUN docker-php-ext-install pdo &&\
    docker-php-ext-install pdo_mysql &&\
    docker-php-ext-install pdo_pgsql &&\
    docker-php-ext-install zip &&\
    docker-php-ext-install gd &&\
    docker-php-ext-install pcntl &&\ 
    docker-php-ext-install mcrypt

# COPY php.ini /usr/local/etc/php/php.ini
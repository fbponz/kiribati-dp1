FROM php:7.3-apache
COPY ./html/ /var/www/html/
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql
EXPOSE 80
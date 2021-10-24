FROM php:7.3-apache

RUN apt-get update && apt-get install -y curl zip libzip-dev libpng-dev npm && \
    # php extensions
    docker-php-ext-install pdo pdo_mysql && \
    docker-php-ext-install bcmath && \
    docker-php-ext-install zip && \
    docker-php-ext-install gd && \
    # composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    composer create-project laravel/laravel . && \
    npm install

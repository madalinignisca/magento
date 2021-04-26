FROM php:7.4-apache

ARG REPO_USERNAME
ARG REPO_PASSWORD

ENV COMPOSER_ALLOW_SUPERUSER=1

ADD https://getcomposer.org/composer-stable.phar /usr/local/bin/composer

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libicu-dev \
        libxml2-dev \
        libxslt1-dev \
        libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd bcmath intl pdo_mysql soap xsl zip sockets \
    && chmod 755 /usr/local/bin/composer \
    && composer config -g http-basic.repo.magento.com $REPO_USERNAME $REPO_PASSWORD \
    && cd / \
    && composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition app

WORKDIR /app

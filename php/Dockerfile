FROM php:7.1-fpm-stretch

RUN apt-get update
RUN apt-get install -y vim

# Install GD library
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && apt-get install -y --no-install-recommends libicu-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

# Install Postgre PDO
RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

# Install PDO and Mcrypt
RUN docker-php-ext-install mysqli \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install mbstring

# Install Zip
RUN docker-php-ext-install zip

# Enable session
RUN chmod 777 -R /tmp

# Enable website permission
RUN chmod 777 -R /var/www/html/

VOLUME /var/www/html


FROM php:8.1-apache

# Install required packages
RUN apt-get update && apt-get install -y \
    unzip \
    default-mysql-client \
    && docker-php-ext-install mysqli pdo pdo_mysql

# Set Apache Document Root
WORKDIR /var/www/html

# Copy OpenEMR source code to container
COPY . /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port
EXPOSE 80
# Dockerfile

# Use the official PHP image with Apache
FROM php:8.2-apache

# Install required PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache mod_rewrite for Symfony routing
RUN a2enmod rewrite

# Set the working directory
WORKDIR /var/www/html

# Copy the Symfony project files to the working directory
COPY . .

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Install Symfony dependencies
RUN composer install

# Set the Apache document root to the public directory
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Update the default Apache site configuration to use the Symfony public directory
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/*.conf

# Expose port 80 for the web server
EXPOSE 80

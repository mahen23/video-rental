# Dockerfile

FROM php:8.2-apache

# Install necessary PHP extensions including pdo_mysql
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set the working directory
WORKDIR /var/www/html

# Copy the project files
COPY . .

# Install Composer (assuming Composer is not yet installed)
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Run Composer install
RUN composer install

# Set the document root to the Symfony public directory
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Adjust Apache config to use Symfony's public directory as document root
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/*.conf

# Expose port 80
EXPOSE 80

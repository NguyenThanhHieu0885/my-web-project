FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    unzip zip git libzip-dev nano default-mysql-client \
    && docker-php-ext-install pdo_mysql zip

RUN a2enmod rewrite

COPY apache.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /app

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

# Copy project into /app
COPY src/ /app/

# If empty → auto install Laravel
RUN if [ ! -f "/app/artisan" ]; then \
        composer create-project laravel/laravel /app --prefer-dist; \
    fi

# Ensure .env exists
RUN if [ ! -f "/app/.env" ]; then \
        cp /app/.env.example /app/.env; \
    fi

# Fix DB config
RUN sed -i "s/DB_CONNECTION=.*/DB_CONNECTION=mysql/" /app/.env && \
    sed -i "s/DB_HOST=.*/DB_HOST=mysql/" /app/.env && \
    sed -i "s/DB_PORT=.*/DB_PORT=3306/" /app/.env && \
    sed -i "s/DB_DATABASE=.*/DB_DATABASE=laravel/" /app/.env && \
    sed -i "s/DB_USERNAME=.*/DB_USERNAME=root/" /app/.env && \
    sed -i "s/DB_PASSWORD=.*/DB_PASSWORD=123456/" /app/.env

# Install vendor
RUN composer install --working-dir=/app --no-interaction

# Copy app into Apache directory
RUN rm -rf /var/www/html && cp -R /app /var/www/html

# Permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 80

CMD ["apache2-foreground"]

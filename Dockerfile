FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    sqlite3 \
    libsqlite3-dev \
    && docker-php-ext-install pdo pdo_mysql pdo_sqlite zip

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . .

RUN composer install --no-dev --optimize-autoloader

# Crear la base de datos SQLite dentro del contenedor
RUN mkdir -p /app/database && touch /app/database/database.sqlite

RUN chown -R www-data:www-data /app/storage /app/bootstrap/cache /app/database

EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000

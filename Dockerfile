# Stage 1: Build frontend assets
FROM node:18 AS frontend

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build


# Stage 2: PHP + Laravel
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

# Copy project files
COPY . .

# 🔥 Copy built assets from frontend stage
COPY --from=frontend /app/public/build /app/public/build

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Create SQLite database inside container
RUN mkdir -p /app/database && touch /app/database/database.sqlite

# Permissions
RUN chown -R www-data:www-data /app/storage /app/bootstrap/cache /app/database

EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000

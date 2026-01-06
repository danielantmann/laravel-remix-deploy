# Stage 1: Build frontend assets
FROM node:18 AS frontend

WORKDIR /app

# Force cache bust
ARG CACHE_BREAKER=1

# Copy only package files
COPY package.json package-lock.json ./
RUN npm ci

# Copy frontend source
COPY resources ./resources
COPY vite.config.js ./
COPY tailwind.config.js ./
COPY postcss.config.js ./

# Build assets
RUN npm run build

# Move manifest where Laravel expects it
RUN mv /app/public/build/.vite/manifest.json /app/public/build/manifest.json


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

# Copy full repo
COPY . .

# Copy Vite build
COPY --from=frontend /app/public/build /app/public/build

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Create SQLite database
RUN mkdir -p /app/database && touch /app/database/database.sqlite

# Permissions
RUN chown -R www-data:www-data /app/storage /app/bootstrap/cache /app/database

EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000

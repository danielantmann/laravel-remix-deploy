FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    sqlite3 \
    libsqlite3-dev \
    curl \
    && docker-php-ext-install pdo pdo_mysql pdo_sqlite zip

# Install Node.js (LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app

# Copy project files
COPY . .

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Install JS dependencies and build assets
RUN npm ci && npm run build

# Create SQLite database inside container
RUN mkdir -p /app/database && touch /app/database/database.sqlite

# Permissions
RUN chown -R www-data:www-data /app/storage /app/bootstrap/cache /app/database

EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000

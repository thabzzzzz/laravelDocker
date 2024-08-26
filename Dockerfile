# Use the PHP-Apache image
FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Install PHP extensions and tools
RUN apt-get update \
  && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libmariadb-dev-compat \
    libmariadb-dev \
    mariadb-client-core \
    libzip-dev \
    unzip \
    nodejs \
    npm \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install gd \
  && docker-php-ext-install pdo_mysql \
  && docker-php-ext-install zip \
  && rm -rf /var/lib/apt/lists/*



# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY startup.sh /usr/local/bin/startup.sh

# Enable the site
RUN a2ensite 000-default.conf

# Copy application source code
COPY . .


# Install Laravel and Vue dependencies
RUN composer install \
  && npm install \
  && npm run prod 

# Expose port 80
EXPOSE 80

# Set the Apache DocumentRoot
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Update Apache config to allow overrides
RUN echo '<Directory /var/www/html/public>\n\
    AllowOverride All\n\
</Directory>' > /etc/apache2/conf-available/override.conf \
  && a2enconf override

# Start Apache in the foreground
ENTRYPOINT ["/usr/local/bin/startup.sh"]
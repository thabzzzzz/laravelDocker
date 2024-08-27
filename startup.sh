#!/bin/bash

# Start Apache in the background
apache2-foreground &



# Install npm dependencies and build assets
npm install
npm run build

# Run Laravel migrations
php artisan migrate --force

# Keep the container running
wait

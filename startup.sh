#!/bin/bash

# Start Apache in the background
apache2-foreground &

# Wait for the database to be ready


# Run Laravel migrations
php artisan migrate --force

# Keep the container running
wait

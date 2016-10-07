#!/bin/bash
# Copyright EasyPath IT Solutions Inc.

# WordPress database connection details
export MYSQL_ROOT_PASSWORD=password
export MYSQL_DATABASE=wordpress
export MYSQL_USER=wordpress
export MYSQL_PASSWORD=password
export MYSQL_DBHOST=db
export WP_ROOT=/webapps/wordpress/site

# Run Docker build
docker-compose up --build -d

# Get ID of PHP-FPM container
export PHP="$(docker-compose ps -q php)"

# Wait for MariaDB container to finish starting up
sleep 30

# Install WordPress
docker exec -it $PHP /bin/bash -c "cd $WP_ROOT && wp core download --allow-root"
docker exec -it $PHP /bin/bash -c "cd $WP_ROOT && wp core config --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_DBHOST"

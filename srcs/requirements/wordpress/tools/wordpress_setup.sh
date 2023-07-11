#!/bin/bash

if [ ! -f "/var/www/html/wordpress/index.php" ]; then
	wp core download --path=/var/www/html --allow-root && \

	wp config create --allow-root \
	--dbname=$DB_NAME \
	--dbuser=$DB_USER \
	--dbpass=$DB_PWD \
	--dbhost=$DB_HOST \
	--dbcharset="utf8" && \

	wp core install --allow-root \
	--url=$DOMAIN_NAME \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PWD \
	--admin_email=$WP_ADMIN_EMAIL && \

	wp user create --allow-root \
	$WP_USER $WP_EMAIL --role=author \
	--user_pass=$WP_PWD
	
	wp plugin update --all --path=/var/www/html --allow-root
fi

# exec php-fpm7.4 -F

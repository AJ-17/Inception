sleep 5

cd /var/www/wordpress
rm wp-config.php

wp config create	--allow-root \
                    --dbname=$SQL_DATABASE \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_PASSWORD \
                    --dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --url="${WP_URL}" \
                --title="${WP_TITLE}" \
                --admin_user="${WP_ADMIN_USER}" \
                --admin_password="${WP_ADMIN_PASSWORD}" \
                --admin_email="${WP_ADMIN_EMAIL}" \
                --allow-root \
                --path=$WP_PATH

wp user create  $WP_USER $WP_USER_EMAIL \
                --user_pass="${WP_USER_PASSWORD}" \
                --allow-root \
                --path=$WP_PATH

mkdir -p /run/php
php-fpm7.4 -F
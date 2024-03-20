sleep 10

cd /var/www/wordpress
rm wp-config.php

wp config create	--allow-root \
                    --dbname=$SQL_DATABASE \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_PASSWORD \
                    --dbhost=mariadb:3306 --path='/var/www/wordpress'

mkdir -p /run/php
php-fpm7.4 -F
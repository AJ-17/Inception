FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y

RUN apt install netcat -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3\
                       php-fpm\
                       php-mysql\
                       mariadb-client

# Change PHP config file
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN tar -xzvf /var/www/latest.tar.gz -C /var/www
RUN rm /var/www/latest.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

COPY tools/script.sh ./script.sh
CMD ["bash", "./script.sh"]
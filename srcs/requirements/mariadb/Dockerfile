FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y mariadb-server
COPY conf/50-server.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh ./script.sh
CMD ["bash", "./script.sh"]
# RUN service mariadb start //don't work like this test with CMD

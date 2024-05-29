FROM debian:bullseye
RUN apt update
RUN apt upgrade -y
RUN apt install nginx -y

# COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/test /etc/nginx/sites-enabled

RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ajakubcz.42.fr/UID=ajakubcz"

# CMD	["nginx"]
# CMD ["nginx", "-g", "daemon off;"]
CMD nginx -g 'daemon off;'

# ENTRYPOINT	["/bin/bash"]
# RUN nginx

EXPOSE 443/tcp
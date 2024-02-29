FROM debian:bullseye
RUN apt update
RUN apt install nginx -y

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD	["nginx"]

# ENTRYPOINT	["/bin/bash"]
# RUN nginx

EXPOSE 443/tcp
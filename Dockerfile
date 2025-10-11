FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y nginx zip unzip curl && \
    rm -rf /var/lib/apt/lists/*

# Set Nginx to run in foreground
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Download and extract 2048 game
RUN curl -L -o /var/www/html/master.zip https://github.com/gabrielecirulli/2048/archive/refs/heads/master.zip && \
    cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip

EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]

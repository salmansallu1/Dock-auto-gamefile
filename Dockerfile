FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y nginx zip unzip curl && \
    rm -rf /var/lib/apt/lists/*

# Run nginx in foreground
RUN sed -i 's/daemon on;/daemon off;/g' /etc/nginx/nginx.conf

# Download and extract game
RUN curl -L -o /tmp/game.zip https://github.com/salmansallu1/gaming/archive/refs/heads/master.zip && \
    unzip /tmp/game.zip -d /tmp && \
    cp -r /tmp/gaming-master/* /var/www/html/ && \
    rm -rf /tmp/*

EXPOSE 80

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]


#code build successfully
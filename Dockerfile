FROM        nginx:latest

MAINTAINER  thomasdolar@gmail.com

COPY        nginx.conf /etc/nginx/conf.d/default.conf

COPY        letsencrypt.conf /etc/nginx/letsencrypt.conf

COPY        ssl.conf /etc/nginx/ssl.conf

COPY        php.conf /etc/nginx/php.conf

# ENTRYPOINT ["nginx"]
# CMD ["-g", "daemon off;"]
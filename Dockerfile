FROM nginx:latest

MAINTAINER  thomasdolar@gmail.com

COPY        nginx.conf /etc/nginx/conf.d/default.conf
COPY        letsencrypt.conf /etc/nginx/conf.d/letsencrypt.conf
COPY        ssl.conf /etc/nginx/conf.d/ssl.conf
COPY        php.conf /etc/nginx/conf.d/php.conf

# ENTRYPOINT ["nginx"]
# CMD ["-g", "daemon off;"]
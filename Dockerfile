FROM nginx:latest

MAINTAINER  thomasdolar@gmail.com

RUN         echo 'deb http://ftp.debian.org/debian jessie-backports main' | tee /etc/apt/sources.list.d/backports.list && \
            apt-get update && \
            apt-get install certbot letsencrypt -y -t jessie-backports

RUN         mkdir -p /var/www/public/letsencrypt/.well-known/acme-challenge

RUN         certbot --quiet certonly --webroot -w /var/www/public  \
            -d www.commercefacile.com -d commercefacile.com \
            --email commercefaciletogo@gmail.com --agree-tos

COPY        nginx.conf /etc/nginx/conf.d/default.conf
COPY        letsencrypt.conf /etc/nginx/conf.d/letsencrypt.conf
COPY        ssl.conf /etc/nginx/conf.d/ssl.conf
COPY        php.conf /etc/nginx/conf.d/php.conf

# ENTRYPOINT ["nginx"]
# CMD ["-g", "daemon off;"]
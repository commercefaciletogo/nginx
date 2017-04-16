FROM nginx:latest

MAINTAINER  thomasdolar@gmail.com

RUN         apt-get update && \
            apt-get install -y letsencrypt && \
            mkdir -p /var/www/letsencrypt/.well-known/acme-challenge && \
            letsencrypt certonly --webroot -w /var/www/letsencrypt  \
            -d www.commercefacile.com -d commercefacile.com --email commercefaciletogo@gmail.com --agree-tos

COPY        nginx.conf /etc/nginx/conf.d/default.conf
COPY        letsencrypt.conf /etc/nginx/conf.d/letsencrypt.conf
COPY        ssl.conf /etc/nginx/conf.d/ssl.conf
COPY        php.conf /etc/nginx/conf.d/php.conf

# ENTRYPOINT ["nginx"]
# CMD ["-g", "daemon off;"]
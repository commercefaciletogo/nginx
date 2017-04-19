FROM        nginx:latest

MAINTAINER  thomasdolar@gmail.com

COPY        nginx.conf /etc/nginx/conf.d/default.conf

RUN         mkdir /var/commercefacile/cert

COPY        ./.cert/* /var/commercefacile/cert

# ENTRYPOINT ["nginx"]
# CMD ["-g", "daemon off;"]
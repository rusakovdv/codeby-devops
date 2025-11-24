FROM debian:11
WORKDIR /app
RUN apt update && apt install -y nginx
RUN mkdir -p /opt/www/
COPY index.html /opt/www/index.html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
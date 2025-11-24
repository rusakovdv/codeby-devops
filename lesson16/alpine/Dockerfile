FROM alphine:latest
WORKDIR /app
RUN apk update && apk add --no-cache nginx
RUN mkdir -p /opt/www/
COPY index.html /opt/www/
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
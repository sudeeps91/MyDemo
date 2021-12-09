FROM nginx:alpine
COPY ./index.html /usr/share/nginx/html
$COPY ./script.sh /tmp
$RUN chmod +x /tmp/script.sh
$WORKDIR /tmp
#RUN mkdir -p /var/www/html
#RUN chmod 750 /var/www/html
$RUN /bin/sh script.sh
$CMD ["nginx", "-g", "daemon off;"]

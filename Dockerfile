FROM nginx:alpine
COPY ./index.html /usr/share/nginx/html
RUN mkdir -p /scripts
COPY script.sh /scripts
WORKDIR /scripts
RUN chmod +x script.sh
RUN mkdir -p /var/www/html/
RUN chmod -R 750 /var
ENTRYPOINT ["/bin/sh", "script.sh"]

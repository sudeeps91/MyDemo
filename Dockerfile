FROM nginx:alpine
COPY ./index.html /usr/share/nginx/html
COPY ./script.sh /tmp
RUN chmod +x /tmp/script.sh
WORKDIR /tmp
RUN /bin/sh script.sh
CMD ["nginx", "-g", "daemon off;"]

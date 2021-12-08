FROM nginx:alpine
COPY ./index.html /usr/share/nginx/html
RUN mkdir -p /scripts
COPY script.sh /scripts
WORKDIR /scripts
RUN chmod +x script.sh
RUN ./script.sh

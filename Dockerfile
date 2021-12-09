FROM nginx:alpine
COPY ./index.html /usr/share/nginx/html
COPY ./script.sh /tmp
RUN CHMOD +x /tmp/script.sh
WORKDIR /tmp
CMD ["sh"] ["script.sh"]

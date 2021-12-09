#!/bin/bash

#instanceId=$(curl http://169.254.169.254/latest/meta-data/instance-id)
containerId=$(hostname)
echo "<h1>Hello World from $containerId </h1>" > /usr/share/nginx/html/index.html

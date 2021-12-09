#!/bin/bash

#instanceId=$(curl http://169.254.169.254/latest/meta-data/instance-id)
containerId=$(hostname)
echo "<h1>Hello World from $hostname </h1>" > /var/www/html/index.html

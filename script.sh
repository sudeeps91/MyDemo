#!/bin/bash

instanceId=$(curl http://169.254.169.254/latest/meta-data/instance-id)

echo "<h1>Hello World from $instanceId </h1>" > /var/www/html/index.html

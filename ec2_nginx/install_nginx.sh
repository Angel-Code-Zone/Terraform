#!/bin/bash

# first update the ec2 instance.
# install nginx on ec2 instance, when it launch.

sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1> Hello, Practicing the Terraform </h1>" >>  /home/terraform/demo.txt
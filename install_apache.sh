#!/bin/bash
# User Data script used in the Launch Template to bootstrap the web server.

yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>AWS Auto Scaling Lab - Instance Managed by ASG</h1>" > /var/www/html/index.html

#!/bin/bash

dnf update -y

dnf install httpd -y

systemctl enable httpd

systemctl start httpd

TOKEN=$(curl -X PUT \
"http://169.254.169.254/latest/api/token" \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl \
-H "X-aws-ec2-metadata-token: $TOKEN" \
http://169.254.169.254/latest/meta-data/instance-id)

echo "<h1>Enterprise Web Platform</h1>" \
> /var/www/html/index.html

echo "<h2>Instance: $INSTANCE_ID</h2>" \
>> /var/www/html/index.html

#!/bin/bash

# todo: HTTPS

yum install httpd -y

setsebool httpd_read_user_content 1

firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --reload

rsync -a html/ /var/www/html/
chown -R apache:apache /var/www/html

systemctl start httpd
systemctl enable httpd

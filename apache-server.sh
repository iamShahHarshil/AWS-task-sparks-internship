#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo yum install php -y
sudo echo -e "<pre>\n<?php\nprint 'Welcome to my page BY <b>HARSHIL</b>. <br />This is a test page for internship<br />';\n?>\n</pre>" > /var/www/html/index.php
systemctl start httpd
systemctl enable httpd
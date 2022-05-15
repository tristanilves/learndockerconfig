#!/bin/sh 

sudo a2ensite wordpress
sudo a2enmod rewrite
sudo a2dissite 000-default
service apache2 start && tail -f /dev/null

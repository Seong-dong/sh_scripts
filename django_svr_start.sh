#!/bin/bash
echo "##################################################"
echo "###start docker-compose start#####################"
echo "##################################################"
echo " "
echo "This script pid : $$"
echo " "
cd /root/github/django_blog
dirpath=${PWD}
echo "change directory :  $dirpath"
echo "start 3svr db, web, nginx"
echo "wait for minute..."
docker-compose start db
echo "started 1"
docker-compose start web
echo "started 2"
docker-compose start nginx
echo "started 3"
echo "### complete ###"

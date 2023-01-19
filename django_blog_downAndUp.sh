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
echo "start down"
echo "wait for minute..."
docker-compose down
echo "up & build"
git stash
git pull
docker-compose up --build -d
echo "### complete ###"

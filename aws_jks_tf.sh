#!/bin/bash
echo "##################################################"
echo "###start docker-compose start#####################"
echo "##################################################"
echo " "
echo "This script pid : $$"
echo " "
cd /root/github/team_prj_sub
dirpath=${PWD}
echo "change directory :  $dirpath"
echo "start down"
echo "wait for minute..."
echo "up & build"
git stash
git pull
echo "### complete ###"

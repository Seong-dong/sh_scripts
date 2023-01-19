#!/bin/bash
echo "##################################################"
echo "###start terraform      start#####################"
echo "##################################################"
echo " "
echo "This script pid : $$"
echo " "
cd /root/github/team_prj_sub
dirpath=${PWD}
echo "change directory :  $dirpath"
echo "wait for minute..git pull"
git stash
git pull
echo "cd terraform"
cd /root/github/team_prj_sub/prod-web-autoscale
echo "terraform plan"
pwd
terraform plan
echo "terraform apply"
terraform apply --auto-approve
echo "### complete ###"

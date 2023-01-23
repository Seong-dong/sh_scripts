#!/bin/bash
echo "##################################################"
echo "###start eks setting    start#####################"
echo "##################################################"
echo " "
echo "This script pid : $$"
echo "Cluster Connect"
aws eks update-kubeconfig --region=$AWS_REGION --name=$CLUSTER_NAME --alias=22shop
echo "Cluster Check"
kubectl config get-contexts
echo "Role modify"
kubectl edit configmap aws-auth -n kube-system

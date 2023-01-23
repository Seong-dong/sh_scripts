#!/bin/bash
echo "##################################################"
echo "###start eks setting    start#####################"
echo "##################################################"
echo " "
echo "This script pid : $$"
echo "EFS Setting start"
aws iam create-policy --policy-name AmazonEKS_EFS_CSI_Driver_Policy --policy-document file://iam-policy-example.json
eksctl utils associate-iam-oidc-provider --region=$AWS_REGION --cluster=$CLUSTER_NAME --approve
echo eksctl create iamserviceaccount --name efs-csi-controller-sa --namespace kube-system --cluster $CLUSTER_NAME --attach-policy-arn arn:aws:iam::$ACCOUNT_ID:policy/AmazonEKS_EFS_CSI_Driver_Policy --approve --override-existing-serviceaccounts --region $AWS_REGION
eksctl create iamserviceaccount --name efs-csi-controller-sa --namespace kube-system --cluster $CLUSTER_NAME --attach-policy-arn arn:aws:iam::$ACCOUNT_ID:policy/AmazonEKS_EFS_CSI_Driver_Policy --approve --override-existing-serviceaccounts --region $AWS_REGION
echo "set dirver.yaml"
cd /root/team_prj_k8s/environment/efs
echo "kubectl apply driver"
kubectl apply -f driver.yaml
sleep 30s
echo "storageclasee id set"
vim storageclass.yaml
kubectl apply -f storageclass.yaml
sleep 10s
echo "pvc deply"
kubectl apply -f pvc.yaml
cd /root/team_prj_k8s/database
kubectl apply -f svc.yml
kubectl apply -f mariadb.yml

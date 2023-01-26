#!/bin/bash
echo "##################################################"
echo "###start eks setting    start#####################"
echo "##################################################"
echo " "
echo "This script pid : $$"
echo "iam-didc-provider"
eksctl utils associate-iam-oidc-provider --region $AWS_REGION --cluster $CLUSTER_NAME --approve
aws eks describe-cluster --name $CLUSTER_NAME --query "cluster.identity.oidc.issuer" --output text
cd /root/team_prj_k8s/environment
aws iam create-policy --policy-name AWSLoadBalancerControllerIAMPolicy --policy-document file://iam-policy.json
echo "service Account add by Cloudformation"
eksctl create iamserviceaccount --cluster $CLUSTER_NAME --namespace kube-system --name aws-load-balancer-controller --attach-policy-arn arn:aws:iam::$ACCOUNT_ID:policy/AWSLoadBalancerControllerIAMPolicy --override-existing-serviceaccounts --approve
echo "kubectl apply cert-manager"
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.5.4/cert-manager.yaml
echo "sleep 90 second"
sleep 90
echo "kubectl apply controller"
kubectl apply -f v2_4_4_full_22shop.yaml

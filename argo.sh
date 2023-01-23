#!/bin/bash
echo "##################################################"
echo "###start ArgoCD setting    start##################"
echo "##################################################"
echo " "
echo "This script pid : $$"
echo "ArgoCD Setting start"
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
sleep 30
echo "Argo CLB name"
echo `kubectl get svc argocd-server -n argocd -o json | jq --raw-output .status.loadBalancer.ingress[0].hostname`
ARGO_PWD=`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`
echo "Argo CD Admin Passwd"
echo $ARGO_PWD

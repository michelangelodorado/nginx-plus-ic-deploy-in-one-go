#!/bin/bash

echo Paste the contents of the nginx-repo.jwt you obtained from NGINX Team: 
read jwt
echo $jwt
kubectl apply -f 1-RBAC/
kubectl create secret docker-registry regcred --docker-server=private-registry.nginx.com --docker-username=$jwt --docker-password=none -n nginx-ingress
kubectl apply -f 2-CommonResources/ 
kubectl apply -f 3-CustomResources/
kubectl apply -f 4-nginx-deploy/ 
kubectl apply -f 5-service/ 

echo Below resources are created under the 'nginx-ingress'
kubectl get all -n nginx-ingress 

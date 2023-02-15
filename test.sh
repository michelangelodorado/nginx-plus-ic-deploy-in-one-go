#!/bin/bash

IC_HTTPS_PORT=$(kubectl describe svc nginx-ingress -n nginx-ingress | grep "NodePort:                 https" | awk '{print $3}' | cut -d'/' -f1)
IC_IP=$(hostname -I | awk '{print $1}')

kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/main/examples/custom-resources/basic-configuration/cafe.yaml
kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/main/examples/custom-resources/basic-configuration/cafe-secret.yaml
kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/main/examples/custom-resources/basic-configuration/cafe-virtual-server.yaml

echo
echo ===============================================================================
echo "Mimicing access to https://cafe.example.com/tea and requesting it for 5 times"
echo ===============================================================================
echo

for i in {1..5}
do curl --resolve cafe.example.com:$IC_HTTPS_PORT:$IC_IP https://cafe.example.com:$IC_HTTPS_PORT/tea --insecure
done

echo
echo ===============================================================================
echo "Mimicing access to https://cafe.example.com/coffee and requesting it for 5 times"
echo ===============================================================================
echo

for i in {1..5}
do curl --resolve cafe.example.com:$IC_HTTPS_PORT:$IC_IP https://cafe.example.com:$IC_HTTPS_PORT/coffee --insecure
done

#!/bin/bash

kubectl delete -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/main/examples/custom-resources/basic-configuration/cafe.yaml
kubectl delete -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/main/examples/custom-resources/basic-configuration/cafe-secret.yaml
kubectl delete -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/main/examples/custom-resources/basic-configuration/cafe-virtual-server.yaml

kubectl delete -f 1-RBAC/
kubectl delete -f 2-CommonResources/ingress-class.yaml
kubectl delete -f 3-CustomResources/


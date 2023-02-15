#!/bin/bash

kubectl delete secret regcred 
kubectl delete -f 1-RBAC/
kubectl delete -f 2-CommonResources/
kubectl delete -f 3-CustomResources/
kubectl delete -f 4-nginx-deploy/
kubectl delete -f 5-service/


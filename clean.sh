#!/bin/bash

kubectl delete -f 1-RBAC/
kubectl delete -f 2-CommonResources/ingress-class.yaml
kubectl delete -f 3-CustomResources/

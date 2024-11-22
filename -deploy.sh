#!/bin/bash
kubectl apply -f 1_pg-secret.yaml
kubectl apply -f 2_postgres.yaml

kubectl apply -f 3_backend.yaml
kubectl apply -f 4_hpa-backend.yaml

kubectl apply -f 5_frontend.yaml
kubectl apply -f 6_ingress.yaml
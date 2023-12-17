#!/bin/sh
kubectl apply -f namespace.yaml
kubectl apply -f secret.yaml
kubectl apply -f deploy.yaml
kubectl apply -f service.yaml
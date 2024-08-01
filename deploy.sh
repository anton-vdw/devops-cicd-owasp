#!/bin/bash

# Changing the directory path to the current directory as it seems that's where your yml files are located
if [ -d "k8s" ]; then
  cd k8s

  echo "Deploying OWASP ZAP ConfigMap for domains..."
  [ -f zap-domains-configmap.yaml ] && kubectl apply -f zap-domains-configmap.yaml

  echo "Deploying OWASP ZAP Deployment..."
  [ -f zap-deployment.yaml ] && kubectl apply -f zap-deployment.yaml

  echo "Deploying OWASP ZAP Service..."
  [ -f zap-service.yaml ] && kubectl apply -f zap-service.yaml

  echo "Deploying OWASP ZAP CronJob..."
  [ -f zap-cronjob.yaml ] && kubectl apply -f zap-cronjob.yaml

  echo "Deployment complete."
else
  echo "Error: Directory 'k8s' does not exist."
  exit 1
fi

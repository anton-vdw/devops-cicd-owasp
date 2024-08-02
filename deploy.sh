#!/bin/bash

# Changing the directory path to the current directory as it seems that's where your yml files are located
if [ -d "k8s" ]; then
  cd k8s

  echo "Creating OWASP ZAP Namespace..."
  [ -f zap-namespace.yml ] && kubectl apply -f zap-namespace.yml

  echo "Deploying OWASP ZAP ConfigMap for domains..."
  [ -f zap-domains-configmap.yml ] && kubectl apply -f zap-domains-configmap.yml

  echo "Deploying OWASP ZAP Deployment..."
  [ -f zap-deployment.yml ] && kubectl apply -f zap-deployment.yml

  echo "Deploying OWASP ZAP Service..."
  [ -f zap-service.yml ] && kubectl apply -f zap-service.yml

  echo "Deploying OWASP ZAP CronJob..."
  [ -f zap-cronjob.yml ] && kubectl apply -f zap-cronjob.yml

  echo "Deployment complete."
else
  echo "Error: Directory 'k8s' does not exist."
  exit 1
fi

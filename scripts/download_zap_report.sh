#!/bin/bash

# Define the namespace and pod name
NAMESPACE=default
POD_NAME=$(kubectl get pods -n $NAMESPACE -l app=zap -o jsonpath="{.items[0].metadata.name}")

# Copy the report from the ZAP pod to the current directory
kubectl cp $NAMESPACE/$POD_NAME:/zap/wrk/zap_report.html zap_report.html

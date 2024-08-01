# devops-cicd-owasp

This repository automates the deployment of OWASP ZAP and its integration with SonarQube for periodic security scans.

## Repository Structure

- `.github/workflows/import-zap-results.yml`: GitHub Actions workflow to import ZAP results into SonarQube.
- `k8s/`: Kubernetes manifests for deploying OWASP ZAP and scheduling periodic scans.
  - `zap-deployment.yaml`: Deployment configuration for OWASP ZAP.
  - `zap-service.yaml`: Service configuration for OWASP ZAP.
  - `zap-cronjob.yaml`: CronJob configuration for periodic ZAP scans.
- `scripts/download_zap_report.sh`: Script to download the ZAP report from the Kubernetes pod.

## Getting Started

1. Deploy the OWASP ZAP resources in your Kubernetes cluster:
   ```bash
   kubectl apply -f k8s/zap-deployment.yaml
   kubectl apply -f k8s/zap-service.yaml
   kubectl apply -f k8s/zap-cronjob.yaml

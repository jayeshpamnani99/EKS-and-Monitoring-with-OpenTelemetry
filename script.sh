#!/bin/bash

# List of services
services=(
  "adservice"
  "cartservice"
  "checkoutservice"
  "currencyservice"
  "emailservice"
  "flagd"
  "frontend"
  "frontendproxy"
  "imageprovider"
  "kafka"
  "loadgenerator"
  "paymentservice"
  "productcatalogservice"
  "quoteservice"
  "recommendationservice"
  "shippingservice"
  "valkey"
)

# Base directory for the structure
base_dir="/Users/manavgupta/Library/CloudStorage/OneDrive-UniversityofMaryland/UMD Courses/Sem 3/ENPM 818N Cloud Computing/endsem/cloud818n-group11-endsem/kubernetes/otel-demo-yaml-new-approach/application"

# Create directory structure and files
for service in "${services[@]}"; do
  # Create a folder for each service
  mkdir -p "$base_dir/$service"

  # Create empty YAML files for configmap, service, and deployment
  touch "$base_dir/$service/${service}-configmap.yaml"
  touch "$base_dir/$service/${service}-service.yaml"
  touch "$base_dir/$service/${service}-deployment.yaml"

  echo "Created directory and files for $service"
done

echo "All directories and files have been created successfully."

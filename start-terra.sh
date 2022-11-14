#!/bin/bash

terraform workspace select default
terraform workspace select prod
terraform apply -var-file prod.tfvars -auto-approve
sleep 2
echo "Terraform infra set-up."
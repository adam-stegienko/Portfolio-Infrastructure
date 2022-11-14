#!/bin/bash

terraform workspace select default
sleep 2
terraform workspace select dev
sleep 2
terraform apply -var-file dev.tfvars -auto-approve
sleep 2
echo "Terraform infra set-up."
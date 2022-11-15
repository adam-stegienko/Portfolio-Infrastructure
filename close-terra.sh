#!/bin/bash


terraform workspace select default
terraform workspace select prod
terraform destroy -var-file prod.tfvars -auto-approve
sleep 2
echo "Terraform infra destroyed."

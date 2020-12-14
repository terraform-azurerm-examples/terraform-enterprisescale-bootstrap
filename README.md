# Enterprise Scale Landing Zones Azure DevOps Bootstrap

## Scope of the project

This project is comprised of three repos that together work to provide the following. Progress is stated towards MVP:

1. An automated bootstrap process that configures Azure DevOps for Enterprise Scale Landing Zones using Terraform - **75% complete**
2. An Enterprise Scale Git repo to store the Terraform config **75% complete**
3. Another Git repo to store the Docker configuration of the Terraform CI/CD build agents **90% complete**
3. Azure Pipelines providing a subscription vending machine and CI/CD for Terraform **50% copmplete**

## Quick Start

```bash
cd bootstrap
export AZDO_ORG_SERVICE_URL=https://dev.azure.com/myorgname
export AZDO_PERSONAL_ACCESS_TOKEN=<myPAT>
export TF_VAR_azuredevops_url=$AZDO_ORG_SERVICE_URL
export TF_VAR_azuredevops_token=$AZDO_PERSONAL_ACCESS_TOKEN
export TFE_PARALLELISM=256

az login # login with admin user account - must be subscription owner

terraform init
terraform plan
terraform apply
```

# Enterprise Scale Landing Zones Azure DevOps Bootstrap

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

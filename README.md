# Enterprise Scale Landing Zones Azure DevOps Bootstrap

## Scope of the project

This project is comprised of three repos that together work to provide the following. Progress is stated towards MVP:

1. An automated bootstrap process that configures Azure DevOps for Enterprise Scale Landing Zones using Terraform - **75% complete**
2. An Enterprise Scale Git repo to store the Terraform config **75% complete**
3. Another Git repo to store the Docker configuration of the Terraform CI/CD build agents **90% complete**
3. Azure Pipelines providing a subscription vending machine and CI/CD for Terraform **50% complete**

## Why is this project called 'Subscription Vending Machine' when it does more than that?

Because scope creep

## Quick Start

The bootstrap process is intended to be just that, a bootstrap.
Though it uses Terraform it was never conceived that long term state management would be used to manage Azure DevOps and the build agent infrastructure.
It has been designed to run interactively to allow rapid commencement of operations.

You will need:

Azure AD account with access to:

- Azure portal, at last owner on a subscription (this will become your 'management' subscription in ES terms)
- Azure DevOps, currently you need to be able to create projects. The ability to use an existing project is a `TODO`
- Personal Access token (PAT) for Azure DevOps with full access - create this in the AzDo portal

You will also need:

- az cli installed
- Terraform >= 0.14.0 available and in the $PATH
- A `bash` shell

```bash
cd bootstrap
export AZDO_ORG_SERVICE_URL=https://dev.azure.com/myorgname # This allows the azuredevops provider to work properly
export AZDO_PERSONAL_ACCESS_TOKEN=<myPAT>                   # This allows the azuredevops provider to work properly
export TF_VAR_azuredevops_url=$AZDO_ORG_SERVICE_URL         # we need this within Terraform as a var so am defining twice, don't hate me
export TF_VAR_azuredevops_token=$AZDO_PERSONAL_ACCESS_TOKEN # we need this within Terraform as a var so am defining twice, don't hate me
export TFE_PARALLELISM=256

az login # login with admin user account - must be subscription owner

terraform init
terraform plan
terraform apply
```

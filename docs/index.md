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

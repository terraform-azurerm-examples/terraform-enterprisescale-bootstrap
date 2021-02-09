# Quick Start

The bootstrap process is intended to be just that, a bootstrap.
Though it uses Terraform it was never conceived that long term state management would be used to manage Azure DevOps.

It has been designed to run interactively to allow rapid commencement of operations.

You will need:

- Org admin access to Azure DevOps, currently you need to be able to create projects. The ability to use an existing project is a `TODO`
- Personal Access token (PAT) for Azure DevOps with full access to the org

You will also need:

- Terraform >= 0.14.0 available and in the `$PATH`
- A `bash` shell

```bash
export AZDO_ORG_SERVICE_URL=https://dev.azure.com/myorgname
export AZDO_PERSONAL_ACCESS_TOKEN=<myPAT>
export TFE_PARALLELISM=256

terraform init
terraform plan
terraform apply
```

## Next Step

Now you have bootstrapped Azure DevOps, move on to [configuring the build agents](configure-build-agents.md)

# Enterprise Scale Landing Zones Azure DevOps Bootstrap

## Scope of the project

This project is comprised of three repos that together work to provide the following. Progress is stated towards MVP:

1. An automated bootstrap process that configures Azure DevOps for Enterprise Scale Landing Zones using Terraform
2. An Enterprise Scale Git repo to store the Terraform config
3. Another Git repo to store the Docker configuration of the Terraform CI/CD build agents
4. Azure Pipelines providing a subscription vending machine and CI/CD for Terraform

## Repos Used

* https://github.com/terraform-azurerm-examples/terraform-azuredevops-buildagent
* https://github.com/terraform-azurerm-examples/terraform-enterprisescale-starter

## Docs

Documentation is hosted on [GitHub Pages](https://terraform-azurerm-examples.github.io/terraform-enterprisescale-bootstrap/)

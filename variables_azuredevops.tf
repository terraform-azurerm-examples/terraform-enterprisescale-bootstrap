# Azure DevOps org URL - set using TF_VAR_azuredevops_url environment variable
# e.g. https://dev.azure.com/myorg
variable "azuredevops_url" {
  type = string
}

# Project name for created project
variable "azuredevops_project_name" {
  type    = string
  default = "Enterprise-Scale-Landing-Zones"
}

# Work item template for the created project
variable "azuredevops_project_work_item_template" {
  type = string
  validation {
    condition = contains(
      [
        "Agile",
        "Basic",
        "CMMI",
        "Scrum",
      ], var.azuredevops_project_work_item_template
    )
    error_message = "Work item template must be one of: Scrum, Agile, Basic or CMMI."
  }
  default = "Basic"
}

# Source location for repo import
# must have trailing slash '/'
variable "build_agent_repo_source_url" {
  type    = string
  default = "https://github.com/terraform-azurerm-examples/terraform-azuredevops-buildagent.git"
}

variable "eslz_source_repo_url" {
  type    = string
  default = "https://github.com/terraform-azurerm-examples/terraform-enterprisescale-starter.git"
}

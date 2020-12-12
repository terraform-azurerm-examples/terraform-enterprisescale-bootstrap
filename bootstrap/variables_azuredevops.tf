# Azure DevOps org URL - set using TF_VAR_azuredevops_url environment variable
# e.g. https://dev.azure.com/myorg
variable "azuredevops_url" {
  type = string
}

# PAT token - set using TF_VAR_azuredevops_token environment variable
variable "azuredevops_token" {
  type      = string
  sensitive = true
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
variable "azuredevops_repo_source_url" {
  type    = string
  default = "https://dev.azure.com/dctteam/Subscription%20Vending%20Machine/_git/"
}

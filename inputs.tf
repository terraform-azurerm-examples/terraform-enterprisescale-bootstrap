# Project name for created project
variable "build_agent_environments" {
  type    = set(string)
  default = ["prod","canary"]
}

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

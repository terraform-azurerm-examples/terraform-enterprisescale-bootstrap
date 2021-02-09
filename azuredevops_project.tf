# The ESLZ AzDo project
resource "azuredevops_project" "eslz" {
  name               = var.azuredevops_project_name
  description        = "Enterprise Scale Landing Zones"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = var.azuredevops_project_work_item_template

  features = {
    "testplans" = "disabled"
  }
}

resource "azuredevops_project" "eslz" {
  name               = "ESLZ"
  description        = "Enterprise Scale Landing Zones"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Scrum"

  features = {
    "testplans" = "disabled"
  }
}

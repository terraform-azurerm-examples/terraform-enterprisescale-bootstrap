# User managed identity for the ACI instance
# Used for creation of platform resources
resource "azurerm_user_assigned_identity" "buildagent" {
  resource_group_name = azurerm_resource_group.terraform.name
  location            = azurerm_resource_group.terraform.location

  name = var.azurerm_user_assigned_identity_aci_name
}

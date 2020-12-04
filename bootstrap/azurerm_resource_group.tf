resource "azurerm_resource_group" "terraform" {
  name     = "estf"
  location = var.azurerm_location
}

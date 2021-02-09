# The resource group for the whole shebang
resource "azurerm_resource_group" "terraform" {
  name     = "estf"
  location = var.azurerm_location
}

resource "azurerm_container_registry" "tfbuildagents" {
  name                     = "${var.azurerm_container_registry_prefix}${random_id.azurerm_random_id.hex}"
  resource_group_name      = azurerm_resource_group.terraform.name
  location                 = var.azurerm_location
  sku                      = "Standard"
  admin_enabled            = false
}
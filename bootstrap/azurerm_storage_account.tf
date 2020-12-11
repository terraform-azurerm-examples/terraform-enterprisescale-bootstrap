resource "azurerm_storage_account" "backend" {
  name                      = "${var.azurerm_storage_account_prefix}${random_id.azurerm_random_id.hex}"
  resource_group_name       = azurerm_resource_group.terraform.name
  location                  = var.azurerm_location
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  account_tier              = "Standard"
  enable_https_traffic_only = true
}

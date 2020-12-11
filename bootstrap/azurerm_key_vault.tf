resource "azurerm_key_vault" "terraform" {
  name                        = "${var.azurerm_key_vault_prefix}${random_id.azurerm_random_id.hex}"
  location                    = azurerm_resource_group.terraform.location
  resource_group_name         = azurerm_resource_group.terraform.name
  enabled_for_disk_encryption = false
  enable_rbac_authorization   = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }
}

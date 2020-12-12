# Storage account permission to allow current user to manage blobs
# Used to create the initial container for backend - should then be removed
resource "azurerm_role_assignment" "tfbackendstorage_adminuser" {
  scope                = azurerm_storage_account.backend.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}

# Storage account permission to allow the ACI instance to manage blobs
# Required for proper Terraform operation
resource "azurerm_role_assignment" "tfbackendstorage_aci" {
  scope                = azurerm_storage_account.backend.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = azurerm_user_assigned_identity.buildagent.principal_id
}

resource "azurerm_role_assignment" "tfbackendstorage_adminuser" {
  scope                = azurerm_storage_account.backend.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "tfbackendstorage_aci" {
  scope                = azurerm_storage_account.backend.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = azurerm_user_assigned_identity.buildagent.principal_id
}

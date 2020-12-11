resource "azurerm_storage_container" "backend" {
  name                  = "tfbackend"
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private"

  depends_on = [azurerm_role_assignment.tfbackendstorage_adminuser]
}

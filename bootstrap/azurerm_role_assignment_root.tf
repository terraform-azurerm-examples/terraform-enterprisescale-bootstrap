resource "azurerm_role_assignment" "root" {
  count                = var.azurerm_create_root_role_assignment ? 1 : 0
  scope                = var.azurerm_root_scope
  role_definition_name = "Management Group Contributor"
  principal_id         = azurerm_user_assigned_identity.buildagent.principal_id
}
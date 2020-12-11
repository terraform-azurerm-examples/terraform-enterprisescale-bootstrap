resource "azurerm_role_assignment" "buildagent_acrpull" {
  scope                = azurerm_container_registry.tfbuildagents.id
  role_definition_name = "acrpull"
  principal_id         = azurerm_user_assigned_identity.buildagent.principal_id
}

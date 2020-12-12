# Role assignment using user assigned identity to allow the ACI to pull containers from the registry
# This isn't currently used because we must use admin creds on resource creation due to a platform limitation
resource "azurerm_role_assignment" "buildagent_acrpull" {
  scope                = azurerm_container_registry.tfbuildagents.id
  role_definition_name = "acrpull"
  principal_id         = azurerm_user_assigned_identity.buildagent.principal_id
}

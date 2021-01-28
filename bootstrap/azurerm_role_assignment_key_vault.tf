# Role assignment using user assigned identity to allow the ACI to read secrets
# Currently using Key Vault Azure RBAC - in preview
resource "azurerm_role_assignment" "key_vault_aci" {
  scope                = azurerm_key_vault.terraform.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_user_assigned_identity.buildagent.principal_id
}

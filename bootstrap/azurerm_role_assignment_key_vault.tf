resource "azurerm_role_assignment" "key_vault_aci" {
  scope                = azurerm_key_vault.terraform.id
  role_definition_name = "Key Vault Secrets User (preview)"
  principal_id         = azurerm_user_assigned_identity.buildagent.principal_id
}

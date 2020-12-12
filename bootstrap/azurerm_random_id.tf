# Random ID for generating unique names where this is required
# e.g. storage accounts, key vaults, ACR
resource "random_id" "azurerm_random_id" {
  byte_length = 4
}

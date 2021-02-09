# AzureRM provider block
provider "azurerm" {
  features {}
}

# Get current Azure connection information
data "azurerm_client_config" "current" {
}

# Get details of Azure subscription
data "azurerm_subscription" "current" {
}

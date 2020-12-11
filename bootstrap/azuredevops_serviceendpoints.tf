# Disabled as we cannot currently create MSI based endpoints with
# the azuredevops provider
# https://github.com/microsoft/terraform-provider-azuredevops/issues/101

resource "azuredevops_serviceendpoint_azurerm" "azurerm" {
  project_id                = azuredevops_project.eslz.id
  service_endpoint_name     = "azure-sub-mgmt"
  description               = "Management subscription"
  azurerm_spn_tenantid      = data.azurerm_client_config.current.tenant_id
  azurerm_subscription_id   = data.azurerm_client_config.current.subscription_id
  azurerm_subscription_name = data.azurerm_subscription.current.display_name
}

resource "azuredevops_serviceendpoint_azurecr" "azurecr" {
  project_id                = azuredevops_project.eslz.id
  service_endpoint_name     = "azure-cr-mgmt"
  resource_group            = azurerm_resource_group.terraform.name
  azurecr_spn_tenantid      = data.azurerm_client_config.current.tenant_id
  azurecr_name              = azurerm_container_registry.tfbuildagents.name
  azurecr_subscription_id   = data.azurerm_client_config.current.subscription_id
  azurecr_subscription_name = data.azurerm_subscription.current.display_name
}

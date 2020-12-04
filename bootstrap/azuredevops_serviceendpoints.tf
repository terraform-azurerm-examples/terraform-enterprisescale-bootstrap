# Disabled as we cannot currently create MSI based endpoints with
# the azuredevops provider
# https://github.com/microsoft/terraform-provider-azuredevops/issues/101

/* resource "azuredevops_serviceendpoint_azurerm" "endpointazure" {
  project_id                = azuredevops_project.eslz.id
  service_endpoint_name     = "mgmt"
  description               = "Management subscription" 
  azurerm_spn_tenantid      = data.azurerm_client_config.current.tenant_id
  azurerm_subscription_id   = data.azurerm_client_config.current.subscription_id
  azurerm_subscription_name = var.azurerm_management_subscription_name
} */
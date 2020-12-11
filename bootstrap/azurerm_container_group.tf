resource "azurerm_container_group" "buildagent" {
  name                = "${var.azurerm_container_group_prefix}${random_id.azurerm_random_id.hex}"
  location            = azurerm_resource_group.terraform.location
  resource_group_name = azurerm_resource_group.terraform.name
  ip_address_type     = "public"
  os_type             = "Linux"

  depends_on = [azurerm_role_assignment.buildagent_acrpull]

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.buildagent.id]
  }

  image_registry_credential {
    server   = azurerm_container_registry.tfbuildagents.login_server
    password = azurerm_container_registry.tfbuildagents.admin_password
    username = azurerm_container_registry.tfbuildagents.admin_username
  }

  container {
    name   = "estfbuildagent"
    image  = "${azurerm_container_registry.tfbuildagents.name}.azurecr.io/${var.azurerm_build_container_image_name}"
    cpu    = "2.0"
    memory = "4"

    # TODO Seems to be bug whereby there needs to be at least one port :(
    ports {
      port     = 23134
      protocol = "UDP"
    }

    environment_variables = {
      "AZP_URL"  = var.azuredevops_url
      "AZP_POOL" = "terraform"
    }

    secure_environment_variables = {
      "AZP_TOKEN" = var.azuredevops_token
    }
  }
}

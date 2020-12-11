resource "azurerm_container_registry" "tfbuildagents" {
  name                = "${var.azurerm_container_registry_prefix}${random_id.azurerm_random_id.hex}"
  resource_group_name = azurerm_resource_group.terraform.name
  location            = var.azurerm_location
  sku                 = "Standard"
  admin_enabled       = true # TODO we need this for ACI at creation time :(
}

resource "null_resource" "azure_container_registry_build_task" {
  depends_on = [azurerm_container_registry.tfbuildagents]
  provisioner "local-exec" {
    command = "az acr build -t ${var.azurerm_build_container_image_name} -r ${azurerm_container_registry.tfbuildagents.name} --no-logs ../buildagent/"
  }
}
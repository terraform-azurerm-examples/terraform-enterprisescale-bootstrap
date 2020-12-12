# Container registry to store the container images
# Currently needs admin access enabled as we cannot use managed identity during creation (platform limitation - same in portal)
resource "azurerm_container_registry" "tfbuildagents" {
  name                = "${var.azurerm_container_registry_prefix}${random_id.azurerm_random_id.hex}"
  resource_group_name = azurerm_resource_group.terraform.name
  location            = var.azurerm_location
  sku                 = "Standard"
  admin_enabled       = true # TODO we need this for ACI at creation time :(
}

# Local-exec provisioner to stand up the initial container image
# ...Sleep 30 due to Azure timing issue when provisioning with TF
# Future agent builds will be managed using Azure pipelines, see the aci build definition
# Build will take approx 5 mins
resource "null_resource" "azure_container_registry_build_task" {
  depends_on = [azurerm_container_registry.tfbuildagents]
  provisioner "local-exec" {
    command = "git clone ${var.azuredevops_repo_source_url}buildagent && az acr build -t ${var.azurerm_build_container_image_name} -r ${azurerm_container_registry.tfbuildagents.name} --no-logs ./buildagent/ && sleep 30"
  }
}

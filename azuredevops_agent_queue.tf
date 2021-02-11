# This creates the ACI build agent queue for the project
resource "azuredevops_agent_queue" "eslz" {
  for_each      = azuredevops_agent_pool.eslz
  project_id    = azuredevops_project.eslz.id
  agent_pool_id = each.value.id
}

# This grants permissiom for the project to use the ACI agent for builds
resource "azuredevops_resource_authorization" "eslz" {
  for_each    = azuredevops_agent_queue.eslz
  project_id  = azuredevops_project.eslz.id
  resource_id = each.value.id
  type        = "queue"
  authorized  = true
}

# This creates the ACI build agent queue for the project
resource "azuredevops_agent_queue" "terraform" {
  project_id    = azuredevops_project.eslz.id
  agent_pool_id = azuredevops_agent_pool.terraform.id
}

# This grants permissiom for the project to use the ACI agent for builds
resource "azuredevops_resource_authorization" "terraform" {
  project_id  = azuredevops_project.eslz.id
  resource_id = azuredevops_agent_queue.terraform.id
  type        = "queue"
  authorized  = true
}

resource "azuredevops_agent_queue" "terraform" {
  project_id    = azuredevops_project.eslz.id
  agent_pool_id = azuredevops_agent_pool.terraform.id
}

resource "azuredevops_resource_authorization" "terraform" {
  project_id  = azuredevops_project.eslz.id
  resource_id = azuredevops_agent_queue.terraform.id
  type        = "queue"
  authorized  = true
}

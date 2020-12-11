resource "azuredevops_agent_pool" "terraform" {
  name           = "terraform"
  auto_provision = false
}

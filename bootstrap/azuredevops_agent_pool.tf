# AzDo build agent pool for the ACI instance - defined at org level
resource "azuredevops_agent_pool" "terraform" {
  name           = "terraform"
  auto_provision = false
}

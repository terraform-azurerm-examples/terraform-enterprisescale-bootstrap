# AzDo build agent pool for the ACI instance - defined at org level
resource "azuredevops_agent_pool" "eslz" {
  for_each       = var.build_agent_environments
  name           = "eslz-${each.key}"
  auto_provision = false
}

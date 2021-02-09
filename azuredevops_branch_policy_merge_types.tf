// Available if merged: https://github.com/microsoft/terraform-provider-azuredevops/pull/299
/* # main
resource "azuredevops_branch_policy_merge_types" "eslz_main" {
  project_id = azuredevops_project.eslz.id

  enabled  = true
  blocking = true

  settings {
    allow_squash = true

    scope {
      repository_id  = azuredevops_git_repository.eslz.id
      repository_ref = "refs/heads/main"
      match_type     = "Exact"
    }
  }
}
 */
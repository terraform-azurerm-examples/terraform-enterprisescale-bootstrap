/* data "azuredevops_group" "build_agents" {
  project_id = azuredevops_project.eslz.id
  name       = "Project Collection Build Service Accounts"
}

resource "azuredevops_git_permissions" "project-git-repo-permissions" {
  project_id    = azuredevops_project.eslz.id
  repository_id = azuredevops_git_repository.eslz.id
  principal     = data.azuredevops_group.build_agents.id
  permissions = {
    PullRequestContribute = "Allow"
    GenericContribute     = "Allow"
    CreateBranch          = "Allow"
  }
} */

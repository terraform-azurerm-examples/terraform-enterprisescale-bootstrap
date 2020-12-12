# Build definition (pipeline) for the ACI CI/CD
resource "azuredevops_build_definition" "buildagent_cicd" {
  project_id = azuredevops_project.eslz.id
  name       = "aci-build-agent"
  path       = "\\"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.buildagent.id
    branch_name = azuredevops_git_repository.buildagent.default_branch
    yml_path    = ".azure-pipelines/aci-build-agent.yml"
  }
}

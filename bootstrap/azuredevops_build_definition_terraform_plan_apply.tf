# Build definition (pipeline) for the ACI CI/CD
resource "azuredevops_build_definition" "tf_plan_apply_cicd" {
  project_id = azuredevops_project.eslz.id
  name       = "terraform-plan-apply"
  path       = "\\"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.eslz.id
    branch_name = "refs/heads/main"
    yml_path    = ".azure-pipelines/tf-plan-apply-prod.yml"
  }
}

# Build definition (pipeline) for the ACI CI/CD - prod
resource "azuredevops_build_definition" "tf_plan_apply_cicd_prod" {
  project_id = azuredevops_project.eslz.id
  name       = "terraform-plan-apply-prod"
  path       = "\\"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.eslz.id
    yml_path    = ".azure-pipelines/tf-plan-apply-prod.yml"
  }
}

# Build definition (pipeline) for the ACI CI/CD - canary
resource "azuredevops_build_definition" "tf_plan_apply_cicd_canary" {
  project_id = azuredevops_project.eslz.id
  name       = "terraform-plan-apply-canary"
  path       = "\\"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.eslz.id
    yml_path    = ".azure-pipelines/tf-plan-apply-prod.yml"
  }
}

# Build definition (pipeline) for the ACI CI/CD - build validation
resource "azuredevops_build_definition" "tf_build_validation" {
  project_id = azuredevops_project.eslz.id
  name       = "terraform-build-validation"
  path       = "\\"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.eslz.id
    yml_path    = ".azure-pipelines/tf-build-validation.yml"
  }
}
# Build definition (pipeline) for the ACI CI/CD - prod
resource "azuredevops_build_definition" "tf_plan_apply_prod" {
  project_id = azuredevops_project.eslz.id
  name       = "tf-plan-apply-prod"
  path       = "\\"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type = "TfsGit"
    repo_id   = azuredevops_git_repository.eslz.id
    yml_path  = ".azure-pipelines/tf-plan-apply-prod.yml"
  }
}

# Build definition (pipeline) for the ACI CI/CD - canary
resource "azuredevops_build_definition" "tf_plan_apply_canary" {
  project_id = azuredevops_project.eslz.id
  name       = "tf-plan-apply-canary"
  path       = "\\"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type = "TfsGit"
    repo_id   = azuredevops_git_repository.eslz.id
    yml_path  = ".azure-pipelines/tf-plan-apply-prod.yml"
  }
}

# Build definition (pipeline) for the ACI CI/CD - build validation
resource "azuredevops_build_definition" "tf_build_validation" {
  project_id = azuredevops_project.eslz.id
  name       = "tf-build-validation"
  path       = "\\"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type = "TfsGit"
    repo_id   = azuredevops_git_repository.eslz.id
    yml_path  = ".azure-pipelines/tf-build-validation.yml"
  }
}

# Build definition (pipeline) for the force unlock canary
resource "azuredevops_build_definition" "tf_force_unlock_canary" {
  project_id = azuredevops_project.eslz.id
  name       = "tf-force-unlock-canary"
  path       = "\\"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type = "TfsGit"
    repo_id   = azuredevops_git_repository.eslz.id
    yml_path  = ".azure-pipelines/tf-force-unlock-canary.yml"
  }
}

# Build definition (pipeline) for the force unlock prod
resource "azuredevops_build_definition" "tf_force_unlock_prod" {
  project_id = azuredevops_project.eslz.id
  name       = "tf-force-unlock-prod"
  path       = "\\"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type = "TfsGit"
    repo_id   = azuredevops_git_repository.eslz.id
    yml_path  = ".azure-pipelines/tf-force-unlock-prod.yml"
  }
}

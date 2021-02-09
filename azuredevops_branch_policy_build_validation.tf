# main
resource "azuredevops_branch_policy_build_validation" "eslz_main" {
  project_id = azuredevops_project.eslz.id

  enabled  = true
  blocking = true

  settings {
    display_name        = "tf-build-validation"
    build_definition_id = azuredevops_build_definition.tf_build_validation.id
    valid_duration      = 8

    scope {
      repository_id  = azuredevops_git_repository.eslz.id
      repository_ref = "refs/heads/main"
      match_type     = "Exact"
    }
  }
}

# canary
resource "azuredevops_branch_policy_build_validation" "eslz_canary" {
  project_id = azuredevops_project.eslz.id

  enabled  = true
  blocking = true

  settings {
    display_name        = "tf-build-validation"
    build_definition_id = azuredevops_build_definition.tf_plan_apply_canary.id
    valid_duration      = 8

    scope {
      repository_id  = azuredevops_git_repository.eslz.id
      repository_ref = "refs/heads/canary"
      match_type     = "Exact"
    }
  }
}

# canary
resource "azuredevops_branch_policy_build_validation" "eslz_prod" {
  project_id = azuredevops_project.eslz.id

  enabled  = true
  blocking = true

  settings {
    display_name        = "tf-build-validation"
    build_definition_id = azuredevops_build_definition.tf_plan_apply_prod.id
    valid_duration      = 8

    scope {
      repository_id  = azuredevops_git_repository.eslz.id
      repository_ref = "refs/heads/prod"
      match_type     = "Exact"
    }
  }
}
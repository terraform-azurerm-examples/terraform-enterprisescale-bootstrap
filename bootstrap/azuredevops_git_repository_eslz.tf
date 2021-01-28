# This creates a new repo, importing the eslz code from the source
# We cannot use the default repo as it's created with the project and Terraform won't overwrite it
resource "azuredevops_git_repository" "eslz" {
  project_id = azuredevops_project.eslz.id
  name       = "eslz-terraform"
  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = var.eslz_source_repo_url
  }
}

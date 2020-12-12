# This creates a new repo, importing the buildagent code from the source
# Build agent kept seperate due to use of public agents to create the image
# If both buildagent and terraform used same repo then we'd have to checkout the Terraform code in public
resource "azuredevops_git_repository" "buildagent" {
  project_id = azuredevops_project.eslz.id
  name       = "buildagent"
  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "${var.azuredevops_repo_source_url}buildagent"
  }
}

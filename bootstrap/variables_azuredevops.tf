variable "azuredevops_url" {
  type = string
}

variable "azuredevops_token" {
  type      = string
  sensitive = true
}

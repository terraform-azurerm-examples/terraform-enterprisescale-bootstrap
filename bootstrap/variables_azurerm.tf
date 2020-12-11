variable "azurerm_location" {
  type    = string
  default = "westeurope"
}

variable "azurerm_storage_account_prefix" {
  type    = string
  default = "eslztf"
}

variable "azurerm_container_registry_prefix" {
  type    = string
  default = "eslztf"
}

variable "azurerm_build_container_image_name" {
  type    = string
  default = "eslz/buildagent:main"
}

variable "azurerm_container_group_prefix" {
  type    = string
  default = "estfbuildagent"
}

variable "azurerm_user_assigned_identity_aci_prefix" {
  type    = string
  default = "eslzaci"
}

variable "azurerm_key_vault_prefix" {
  type    = string
  default = "eslztf"
}

variable "azurerm_create_root_role_assignment" {
  type    = bool
  default = false
}

variable "azurerm_root_scope" {
  type    = string
  default = "/"
}

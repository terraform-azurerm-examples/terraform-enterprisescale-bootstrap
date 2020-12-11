terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.1.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.40.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 1.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0.0"
    }
  }
}

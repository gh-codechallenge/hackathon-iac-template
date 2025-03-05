terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.7.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.50.0"
    }
  }
}


# Configure the AzureRM Provider
# This section of the provider will help set up
# resources in Azure Resource Manager (ARM) ONLY
provider "azurerm" {
  # Configuration options
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

# Configure the Azure Active Directory Provider
# This section of the provider will help set up users
# and groups in Azure AD ONLY
provider "azuread" {
  tenant_id = "4ee48f43-e15d-4f4a-ad55-d0990aac660e"

}

# Configure terraform remote state
# This section of the provider will help set up
# access to workspace environment variables
terraform {
  backend "remote" {
    organization = "terraform organization name"

    workspaces {
      name = "terraform workspace name"
    }
  }
}

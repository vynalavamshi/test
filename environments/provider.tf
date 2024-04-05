#providing version
terraform {
    required_version = ">=1.2.6"
    # backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
    skip_provider_registration = "true"
  features {
     key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}


# #key vault
# provider "azurerm" {
#   features {
   
#   }
# }
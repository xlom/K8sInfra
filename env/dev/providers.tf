terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.81"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }

  required_version = ">= 1.0.8"

  #NB: These values may be different depending on your setup.
  # See docs/Infrastructure.md
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstatewi8ct"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {
    organization = "lukaszbabiarz1"

    workspaces {
      name = "hands-on-lab"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-2436890c-hands-on-with-terraform-on-azure"
  location = "West US"
}

module "secstorage2" {
  source               = "app.terraform.io/lukaszbabiarz1/secstorage2/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "rcaistg5363"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.8.0"
    }
  }
required_version = ">= 1.5.0"

}
# Configure the Microsoft Azure Provider
provider "azurerm" {
   resource_provider_registrations = "none"
  features {}
}

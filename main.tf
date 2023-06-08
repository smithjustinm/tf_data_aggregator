provider "azurerm" {
  features {

  }
}

# Azure Resource Group
resource "azurerm_resource_group" "k8s_app" {
  name     = var.resource_group_name
  location = var.azure_location
}
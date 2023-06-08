provider "azurerm" {
  features {

  }
}

# Azure Resource Group
resource "azurerm_resource_group" "k8s_app" {
  name     = var.resource_group_name
  location = var.azure_location
}

module "service_principal" {
  source = "./modules/service_principal"
  service_principal_name = var.service_principal_name
}

module "aks" {
    source = "./modules/aks"
    service_principal_name = var.service_principal_name
    client_id = module.service_principal.client_id
    client_secret = module.service_principal.client_secret
    location = var.azure_location
    resource_group_name = var.resource_group_name
}

module "postgres" {
    source = "./modules/postgres"
    location = var.azure_location
    resource_group_name = var.resource_group_name
}

module "keyvault" {
  source                      = "./modules/keyvault"
  azure_location              = var.azure_location
  keyvault_name               = var.keyvault_name
  resource_group_name         = var.resource_group_name
  service_principal_name      = var.service_principal_name
  service_principal_object_id = module.service_principal.service_principal_object_id
  service_principal_tenant_id = module.service_principal.service_principal_tenant_id

  depends_on = [
    module.service_principal
  ]
}

resource "azurerm_key_vault_secret" "example" {
  name         = module.service_principal.client_id
  value        = module.service_principal.client_secret
  key_vault_id = module.keyvault.keyvault_id

  depends_on = [
    module.keyvault
  ]
}
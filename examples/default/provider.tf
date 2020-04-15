#Set the Provider
provider "azurerm" {
  features {}
  version         = ">= 2.0.0"
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

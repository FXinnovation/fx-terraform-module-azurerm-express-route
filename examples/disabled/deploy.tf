######
# Locals
######

locals {
  tags = {
    FXOwner      = "Test user - Terraform"
    FXProjet     = "FXCO"
    FXDepartment = "CloudCICD"
  }
}

######
# Resources
######

resource "random_string" "this" {
  length  = 3
  upper   = false
  special = false
}

module "az_rg_demo" {
  source   = "git::https://github.com/FXinnovation/fx-terraform-module-azurerm-resource-group.git?ref=0.3.0"
  location = "canadacentral"
  name     = "fxcozca2dgenrg${random_string.this.result}"
  tags     = local.tags
}

module "az_expressroute_demo" {
  source                                                  = "../../"
  enabled                                                 = false
  resource_group_name                                     = module.az_rg_demo.name
  location                                                = module.az_rg_demo.location
  virtual_network_gateway_public_ip_name                  = ""
  virtual_network_gateway_name                            = ""
  virtual_network_gateway_sku                             = ""
  gatewaysubnet_subnet_id                                 = ""
  express_route_circuit_name                              = ""
  express_route_circuit_service_provider_name             = ""
  express_route_circuit_service_provider_peering_location = ""
  express_route_circuit_bandwidth_in_mbps                 = 50
  express_route_circuit_sku_tier                          = ""
  express_route_circuit_sku_family                        = ""
  enable_peering_and_connection                           = false
}

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

module "az_vnet_demo" {
  source              = "git::https://github.com/FXinnovation/fx-terraform-module-azurerm-virtual-network.git?ref=0.1.0"
  resource_group_name = module.az_rg_demo.name
  location            = module.az_rg_demo.location
  tags                = local.tags

  virtual_network_name          = "fxcozca2dgenvn${random_string.this.result}"
  virtual_network_address_space = ["10.0.0.0/16"]
  virtual_network_dns_servers   = ["8.8.8.8", "8.8.4.4"]
  subnets_config = {
    gatewaysubnet = {
      name           = "GatewaySubnet"
      address_prefix = "10.0.0.0/24"
    }
  }

  enable_nsg = false
  enable_rt  = false
}

module "az_expressroute_demo" {
  source                                                  = "../../"
  resource_group_name                                     = module.az_rg_demo.name
  location                                                = module.az_rg_demo.location
  tags                                                    = local.tags
  virtual_network_gateway_public_ip_name                  = "fxcozca2dgenvg${random_string.this.result}-pip"
  virtual_network_gateway_name                            = "fxcozca2dgenvg${random_string.this.result}"
  virtual_network_gateway_sku                             = "Standard"
  gatewaysubnet_subnet_id                                 = lookup(module.az_vnet_demo.subnets_ids_map, "GatewaySubnet")
  express_route_circuit_name                              = "fxcozca2dgenvg${random_string.this.result}-circuit"
  express_route_circuit_service_provider_name             = "Equinix"
  express_route_circuit_service_provider_peering_location = "Toronto"
  express_route_circuit_bandwidth_in_mbps                 = 50
  express_route_circuit_sku_tier                          = "Standard"
  express_route_circuit_sku_family                        = "MeteredData"
  enable_peering_and_connection                           = false
}

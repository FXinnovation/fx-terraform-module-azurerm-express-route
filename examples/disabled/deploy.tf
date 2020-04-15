######
# Resources
######

module "az_expressroute_demo" {
  source                                                  = "../../"
  enabled                                                 = false
  resource_group_name                                     = "tftest"
  location                                                = "west US"
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

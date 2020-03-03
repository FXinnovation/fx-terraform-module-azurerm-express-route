######
# Resources - prod_networking - ExpressRoute
######

resource "azurerm_public_ip" "this_virtual_network_gateway_public_ip" {
  count               = var.enabled ? 1 : 0
  name                = var.virtual_network_gateway_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  tags = merge(
    {
      "Terraform" = "true"
    },
    var.tags
  )
}

resource "azurerm_virtual_network_gateway" "this_virtual_network_gateway" {
  count               = var.enabled ? 1 : 0
  name                = var.virtual_network_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name.name

  type = "ExpressRoute"
  sku  = var.express_route_virtual_network_gateway_sku

  ip_configuration {
    public_ip_address_id          = azurerm_public_ip.this_virtual_network_gateway_public_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gatewaysubnet_subnet_id
  }
  tags = merge(
    {
      "Terraform" = "true"
    },
    var.tags
  )
}


resource "azurerm_express_route_circuit" "this_express_route_circuit" {
  count               = var.enabled ? 1 : 0
  name                = var.express_route_circuit_name
  location            = var.location
  resource_group_name = var.resource_group_name

  service_provider_name = var.express_route_circuit_service_provider_name
  peering_location      = var.express_route_circuit_service_provider_peering_location
  bandwidth_in_mbps     = var.express_route_circuit_bandwidth_in_mbps

  sku {
    tier   = var.express_route_circuit_sku_tier
    family = var.express_route_circuit_sku_family
  }
  tags = merge(
    {
      "Terraform" = "true"
    },
    var.tags
  )
}

resource "azurerm_express_route_circuit_peering" "this_express_route_circuit_private_peering" {
  count                      = var.enabled && var.enable_peering_and_connection ? 1 : 0
  resource_group_name        = var.resource_group_name
  express_route_circuit_name = azurerm_express_route_circuit.this_express_route_circuit.name

  peering_type                  = "AzurePrivatePeering"
  peer_asn                      = 65901
  primary_peer_address_prefix   = "172.19.253.236/30"
  secondary_peer_address_prefix = "172.19.253.232/30"
  vlan_id                       = 1005
  shared_key                    = var.prod_networking_express_route_circuit_peering_shared_key
}

resource "azurerm_express_route_circuit_peering" "this_express_route_circuit_microsoft_peering" {
  count                      = var.enabled && var.enable_peering_and_connection ? 1 : 0
  resource_group_name        = var.resource_group_name
  express_route_circuit_name = azurerm_express_route_circuit.this_express_route_circuit.name

  peering_type                  = "MicrosoftPeering"
  peer_asn                      = 65901
  primary_peer_address_prefix   = "172.19.253.236/30"
  secondary_peer_address_prefix = "172.19.253.232/30"
  vlan_id                       = 1005
  shared_key                    = var.prod_networking_express_route_circuit_peering_shared_key

  microsoft_peering_config {
    advertised_public_prefixes = ["123.1.0.0/24"]
  }
}

resource "azurerm_express_route_circuit_authorization" "this_express_route_circuit_authorization" {
  count                      = var.enabled && var.enable_peering_and_connection ? 1 : 0
  resource_group_name        = var.resource_group_name
  name                       = var.prod_networking_express_route_circuit_authorization_name
  express_route_circuit_name = azurerm_express_route_circuit.this_express_route_circuit.name
}

resource "azurerm_virtual_network_gateway_connection" "this_virtual_network_gateway_connection_express_route" {
  count               = var.enabled && var.enable_peering_and_connection ? 1 : 0
  name                = "ExpressRoute"
  location            = var.location
  resource_group_name = var.resource_group_name

  type                       = "ExpressRoute"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.this_virtual_network_gateway.id
  express_route_circuit_id   = azurerm_express_route_circuit.this_express_route_circuit.id
  authorization_key          = azurerm_express_route_circuit_authorization.this_express_route_circuit_authorization.authorization_key
  tags = merge(
    {
      "Terraform" = "true"
    },
    var.tags
  )
}

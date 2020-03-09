resource "azurerm_public_ip" "this" {
  count               = var.enabled ? 1 : 0
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = var.virtual_network_gateway_public_ip_name
  allocation_method   = "Dynamic"
  tags = merge(
    {
      "Terraform" = "true"
    },
    var.tags
  )
}

resource "azurerm_virtual_network_gateway" "this" {
  count               = var.enabled ? 1 : 0
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = var.virtual_network_gateway_name

  type = "ExpressRoute"
  sku  = var.virtual_network_gateway_sku

  ip_configuration {
    public_ip_address_id          = element(concat(azurerm_public_ip.this.*.id, list("")), 0)
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


resource "azurerm_express_route_circuit" "this" {
  count               = var.enabled ? 1 : 0
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = var.express_route_circuit_name

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

resource "azurerm_express_route_circuit_peering" "this_private_peering" {
  count                      = var.enabled && var.enable_peering_and_connection ? 1 : 0
  resource_group_name        = var.resource_group_name
  express_route_circuit_name = element(concat(azurerm_express_route_circuit.this.*.name, list("")), 0)

  peering_type                  = "AzurePrivatePeering"
  peer_asn                      = var.private_peering_peer_asn
  primary_peer_address_prefix   = var.private_peering_primary_peer_address_prefix
  secondary_peer_address_prefix = var.private_peering_secondary_peer_address_prefix
  vlan_id                       = var.private_peering_vlan_id
  shared_key                    = var.private_peering_shared_key
}

resource "azurerm_express_route_circuit_peering" "this_microsoft_peering" {
  count                      = var.enabled && var.enable_peering_and_connection ? 1 : 0
  resource_group_name        = var.resource_group_name
  express_route_circuit_name = element(concat(azurerm_express_route_circuit.this.*.name, list("")), 0)

  peering_type                  = "MicrosoftPeering"
  peer_asn                      = var.microsoft_peering_peer_asn
  primary_peer_address_prefix   = var.microsoft_peering_primary_peer_address_prefix
  secondary_peer_address_prefix = var.microsoft_peering_secondary_peer_address_prefix
  vlan_id                       = var.microsoft_peering_vlan_id
  shared_key                    = var.microsoft_peering_shared_key

  microsoft_peering_config {
    advertised_public_prefixes = var.microsoft_peering_onpremises_advertised_public_prefixes
  }
}

resource "azurerm_express_route_circuit_authorization" "this" {
  count                      = var.enabled && var.enable_peering_and_connection ? 1 : 0
  resource_group_name        = var.resource_group_name
  name                       = var.express_route_circuit_authorization_name
  express_route_circuit_name = element(concat(azurerm_express_route_circuit.this.*.name, list("")), 0)
}

resource "azurerm_virtual_network_gateway_connection" "this" {
  count               = var.enabled && var.enable_peering_and_connection ? 1 : 0
  name                = "ExpressRoute"
  location            = var.location
  resource_group_name = var.resource_group_name

  type                       = "ExpressRoute"
  virtual_network_gateway_id = element(concat(azurerm_virtual_network_gateway.this.*.id, list("")), 0)
  express_route_circuit_id   = element(concat(azurerm_express_route_circuit.this.*.id, list("")), 0)
  authorization_key          = element(concat(azurerm_express_route_circuit_authorization.this.*.authorization_key, list("")), 0)
  tags = merge(
    {
      "Terraform" = "true"
    },
    var.tags
  )
}

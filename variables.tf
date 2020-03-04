variable "enabled" {
  description = "Enable or disable module"
  type        = bool
  default     = true
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the resource will be deployed."
  type        = string
}

variable "virtual_network_gateway_public_ip_name" {
  description = "Name of the public IP address to be assigned to the virutal network gateway."
  type        = string
}

variable "virtual_network_gateway_name" {
  description = "Name of the virutal network gateway to deploy."
  type        = string
}

variable "virtual_network_gateway_sku" {
  description = "ExpressRoute SKU of the virtual network gateway to deploy. Remember that there's particular SKUs for ExpressRoute."
  type        = string
}

variable "gatewaysubnet_subnet_id" {
  description = "Id of the gatewaysubnet to link the virtual network gateway to."
  type        = string
}

variable "express_route_circuit_name" {
  description = "Name of the express route circuit."
  type        = string
}

variable "express_route_circuit_service_provider_name" {
  description = "Name of the external service provider (see Azure documentation)."
  type        = string
}

variable "express_route_circuit_service_provider_peering_location" {
  description = "Location of the peering point with the service provider."
  type        = string
}

variable "express_route_circuit_bandwidth_in_mbps" {
  description = "Bandwidth to allocate to the circuit (See Azure docs for bandwidth limitation)."
  type        = number
}

variable "express_route_circuit_sku_tier" {
  description = "Tier of the ExpressRoute circuit (Standard or Premium)."
  type        = string
}

variable "express_route_circuit_sku_family" {
  description = "Family of the SKU (MeteredData or UnlimitedData)"
  type        = string
}

variable "enable_peering_and_connection" {
  description = "Enable the second configuration step for ExpressRoute."
  type        = bool
  default     = false
}

variable "private_peering_peer_asn" {
  description = "ASN number of the private peering."
  type        = number
  default     = 65514
}

variable "private_peering_primary_peer_address_prefix" {
  description = "Primary peer address prefix for the private peering."
  type        = string
  default     = ""
}

variable "private_peering_secondary_peer_address_prefix" {
  description = "Secondary peer address prefix for the private peering."
  type        = string
  default     = ""
}

variable "private_peering_vlan_id" {
  description = "Client Vlan ID of the private peering."
  type        = number
  default     = 2048
}

variable "private_peering_shared_key" {
  description = "Shared key for the authentication on the private peering."
  type        = string
  default     = ""
}

variable "microsoft_peering_peer_asn" {
  description = "ASN number of the Microsoft peering."
  type        = number
  default     = 65514
}

variable "microsoft_peering_primary_peer_address_prefix" {
  description = "Primary peer address prefix for the Microsoft peering."
  type        = string
  default     = ""
}

variable "microsoft_peering_secondary_peer_address_prefix" {
  description = "Secondary peer address prefix for the Microsoft peering."
  type        = string
  default     = ""
}

variable "microsoft_peering_vlan_id" {
  description = "Client Vlan ID of the Microsoft peering."
  type        = number
  default     = 2048
}

variable "microsoft_peering_shared_key" {
  description = "Shared key for the authentication on the Microsoft peering."
  type        = string
  default     = ""
}

variable "microsoft_peering_onpremises_advertised_public_prefixes" {
  description = "List of IP ranges that you own that you want to advertise on Microsoft network in order to reach Microsoft PaaS services."
  type        = list(string)
  default     = []
}

variable "express_route_circuit_authorization_name" {
  description = "Name of the autorization token to generate."
  type        = string
  default     = "ExRouteAuth"
}

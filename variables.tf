
variable "prod_networking_virtual_network_gateway_public_ip_name" {
  description = "Name of the public IP address to be assigned to the virutal network gateway."
  type        = string
  default     = "prklzus4pvgpip001"
}

variable "prod_networking_virtual_network_gateway_name" {
  description = "Name of the virutal network gateway to deploy."
  type        = string
  default     = "prklzus4pgenvg001"
}

variable "prod_networking_express_route_circuit_name" {
  description = "Name of the express route circuit."
  type        = string
  default     = "SEA_PH_AZURE_USWEST2"
}
variable "prod_networking_express_route_circuit_peering_shared_key" {
  description = "Shared key for the BGP session"
  type        = string
  default     = "CCdMZjpfetjbPiWg"
}
variable "prod_networking_express_route_circuit_authorization_name" {
  description = "Name of the circuit authorization used for ExpressRoute."
  type        = string
  default     = "SEA_PH_AZURE_USWEST2_AUTH"
}

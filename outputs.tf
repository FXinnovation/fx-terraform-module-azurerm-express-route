######
# Step 1
######

output "public_ip_id" {
  description = "Id of the provisioned public IP address."
  value       = element(concat(azurerm_public_ip.this.*.id, list("")), 0)
}

output "public_ip_fqdn" {
  description = "FQDN of the provisioned public IP address."
  value       = element(concat(azurerm_public_ip.this.*.fqdn, list("")), 0)
}

output "virtual_network_gateway_id" {
  description = "ID of the deployed virtual network gateway."
  value       = element(concat(azurerm_virtual_network_gateway.this.*.id, list("")), 0)
}

output "express_route_circuit_id" {
  description = "Id of the deployed ExpressRoute circuit."
  value       = element(concat(azurerm_express_route_circuit.this.*.id, list("")), 0)
}

output "express_route_circuit_service_provider_provisioning_state" {
  description = "Provisioning state of the circuit of the deployed ExpressRoute circuit."
  value       = element(concat(azurerm_express_route_circuit.this.*.service_provider_provisioning_state, list("")), 0)
}

output "express_route_circuit_service_key" {
  description = "Service Key of the deployed ExpressRoute circuit. You need to provide this to the external provider."
  value       = element(concat(azurerm_express_route_circuit.this.*.service_key, list("")), 0)
}

######
# Step 2
######

output "express_route_circuit_private_peering_id" {
  description = "Resource Id of the ExpressRoute circuit peering"
  value       = element(concat(azurerm_express_route_circuit_peering.this_private_peering.*.id, list("")), 0)
}

output "express_route_circuit_private_peering_azure_asn" {
  description = "ASN used by Azure"
  value       = element(concat(azurerm_express_route_circuit_peering.this_private_peering.*.azure_asn, list("")), 0)
}

output "express_route_circuit_private_peering_primary_azure_port" {
  description = "Primary port used by Azure for the peering."
  value       = element(concat(azurerm_express_route_circuit_peering.this_private_peering.*.primary_azure_port, list("")), 0)
}

output "express_route_circuit_private_peering_secondary_azure_port" {
  description = "Secondary Port Used by Azure for the peering."
  value       = element(concat(azurerm_express_route_circuit_peering.this_private_peering.*.secondary_azure_port, list("")), 0)
}

output "express_route_circuit_microsoft_peering_id" {
  description = "Resource Id of the ExpressRoute circuit peering"
  value       = element(concat(azurerm_express_route_circuit_peering.this_microsoft_peering.*.id, list("")), 0)
}

output "express_route_circuit_microsoft_peering_azure_asn" {
  description = "ASN used by Azure"
  value       = element(concat(azurerm_express_route_circuit_peering.this_microsoft_peering.*.azure_asn, list("")), 0)
}

output "express_route_circuit_microsoft_peering_primary_azure_port" {
  description = "Primary port used by Azure for the peering."
  value       = element(concat(azurerm_express_route_circuit_peering.this_microsoft_peering.*.primary_azure_port, list("")), 0)
}

output "express_route_circuit_microsoft_peering_secondary_azure_port" {
  description = "Secondary Port Used by Azure for the peering."
  value       = element(concat(azurerm_express_route_circuit_peering.this_microsoft_peering.*.secondary_azure_port, list("")), 0)
}

output "express_route_circuit_authorization_id" {
  description = "Resource Id of the ExpressRoute circuit authorization."
  value       = element(concat(azurerm_express_route_circuit_authorization.this.*.id, list("")), 0)
}

output "express_route_circuit_authorization_authorization_key" {
  description = "Authorization key of the ExpressRoute circuit authorization."
  value       = element(concat(azurerm_express_route_circuit_authorization.this.*.authorization_key, list("")), 0)
}

output "express_route_circuit_authorization_authorization_use_status" {
  description = "Status of the authorization of the ExpressRoute circuit authorization."
  value       = element(concat(azurerm_express_route_circuit_authorization.this.*.authorization_use_status, list("")), 0)
}

output "express_route_virtual_network_gateway_connection" {
  description = "Id of the connection between the virtual network gateway and the ExpressRoute circuit."
  value       = element(concat(azurerm_virtual_network_gateway_connection.this.*.id, list("")), 0)
}

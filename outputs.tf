######
# Step 1
######

output "public_ip_id" {
  description = "Id of the provisioned public IP address."
  value       = azurerm_public_ip.this_virtual_network_gateway_public_ip.id
}

output "public_ip_fqdn" {
  description = "FQDN of the provisioned public IP address."
  value       = azurerm_public_ip.this_virtual_network_gateway_public_ip.fqdn
}

output "virtual_network_gateway_id" {
  description = "ID of the deployed virtual network gateway."
  value       = azurerm_virtual_network_gateway.this_virtual_network_gateway.id
}

output "express_route_circuit_id" {
  description = "Id of the deployed ExpressRoute circuit."
  value       = azurerm_express_route_circuit.this_express_route_circuit.id
}

output "express_route_circuit_service_provider_provisioning_state" {
  description = "Provisioning state of the circuit of the deployed ExpressRoute circuit."
  value       = azurerm_express_route_circuit.this_express_route_circuit.service_provider_provisioning_state
}

output "express_route_circuit_service_key" {
  description = "Service Key of the deployed ExpressRoute circuit. You need to provide this to the external provider."
  value       = azurerm_express_route_circuit.this_express_route_circuit.service_key
}

######
# Step 2
######

output "express_route_circuit_private_peering_id" {
  description = "Resource Id of the ExpressRoute circuit peering"
  value       = azurerm_express_route_circuit_peering.this_express_route_circuit_private_peering.id
}

output "express_route_circuit_private_peering_azure_asn" {
  description = "ASN used by Azure"
  value       = azurerm_express_route_circuit_peering.this_express_route_circuit_private_peering.azure_asn
}

output "express_route_circuit_private_peering_primary_azure_port" {
  description = "Primary port used by Azure for the peering."
  value       = azurerm_express_route_circuit_peering.this_express_route_circuit_private_peering.primary_azure_port
}

output "express_route_circuit_private_peering_secondary_azure_port" {
  description = "Secondary Port Used by Azure for the peering."
  value       = azurerm_express_route_circuit_peering.this_express_route_circuit_private_peering.secondary_azure_port
}

output "express_route_circuit_microsoft_peering_id" {
  description = "Resource Id of the ExpressRoute circuit peering"
  value       = azurerm_express_route_circuit_peering.this_express_route_circuit_microsoft_peering.id
}

output "express_route_circuit_microsoft_peering_azure_asn" {
  description = "ASN used by Azure"
  value       = azurerm_express_route_circuit_peering.this_express_route_circuit_microsoft_peering.azure_asn
}

output "express_route_circuit_microsoft_peering_primary_azure_port" {
  description = "Primary port used by Azure for the peering."
  value       = azurerm_express_route_circuit_peering.this_express_route_circuit_microsoft_peering.primary_azure_port
}

output "express_route_circuit_microsoft_peering_secondary_azure_port" {
  description = "Secondary Port Used by Azure for the peering."
  value       = azurerm_express_route_circuit_peering.this_express_route_circuit_microsoft_peering.secondary_azure_port
}

output "express_route_circuit_authorization_id" {
  description = "Resource Id of the ExpressRoute circuit authorization."
  value       = azurerm_express_route_circuit_authorization.this_express_route_circuit_authorization.id
}

output "express_route_circuit_authorization_authorization_key" {
  description = "Authorization key of the ExpressRoute circuit authorization."
  value       = azurerm_express_route_circuit_authorization.this_express_route_circuit_authorization.authorization_key
}

output "express_route_circuit_authorization_authorization_use_status" {
  description = "Status of the authorization of the ExpressRoute circuit authorization."
  value       = azurerm_express_route_circuit_authorization.this_express_route_circuit_authorization.authorization_use_status
}

output "express_route_virtual_network_gateway_connection" {
  value = azurerm_virtual_network_gateway_connection.this_virtual_network_gateway_connection_express_route.id
}

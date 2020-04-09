# terraform-module-azurerm-express-route

## Usage

This module needs to be deployed twice to work properly since the ExpressRoute configuration requires a manual intervention at the connectivity provider (ex: Equinix) to be complete.

There is a toggle to enable to proceed with the second configuration of the ExpressRoute circuit.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enable\_peering\_and\_connection | Enable the second configuration step for ExpressRoute. | `bool` | `false` | no |
| enabled | Enable or disable module | `bool` | `true` | no |
| express\_route\_circuit\_authorization\_name | Name of the autorization token to generate. | `string` | `"ExRouteAuth"` | no |
| express\_route\_circuit\_bandwidth\_in\_mbps | Bandwidth to allocate to the circuit (See Azure docs for bandwidth limitation). | `number` | n/a | yes |
| express\_route\_circuit\_name | Name of the express route circuit. | `string` | n/a | yes |
| express\_route\_circuit\_service\_provider\_name | Name of the external service provider (see Azure documentation). | `string` | n/a | yes |
| express\_route\_circuit\_service\_provider\_peering\_location | Location of the peering point with the service provider. | `string` | n/a | yes |
| express\_route\_circuit\_sku\_family | Family of the SKU (MeteredData or UnlimitedData) | `string` | n/a | yes |
| express\_route\_circuit\_sku\_tier | Tier of the ExpressRoute circuit (Standard or Premium). | `string` | n/a | yes |
| gatewaysubnet\_subnet\_id | Id of the gatewaysubnet to link the virtual network gateway to. | `string` | n/a | yes |
| location | Location of the resources | `string` | n/a | yes |
| microsoft\_peering\_onpremises\_advertised\_public\_prefixes | List of IP ranges that you own that you want to advertise on Microsoft network in order to reach Microsoft PaaS services. | `list(string)` | `[]` | no |
| microsoft\_peering\_peer\_asn | ASN number of the Microsoft peering. | `number` | `65514` | no |
| microsoft\_peering\_primary\_peer\_address\_prefix | Primary peer address prefix for the Microsoft peering. | `string` | `""` | no |
| microsoft\_peering\_secondary\_peer\_address\_prefix | Secondary peer address prefix for the Microsoft peering. | `string` | `""` | no |
| microsoft\_peering\_shared\_key | Shared key for the authentication on the Microsoft peering. | `string` | `""` | no |
| microsoft\_peering\_vlan\_id | Client Vlan ID of the Microsoft peering. | `number` | `2048` | no |
| private\_peering\_peer\_asn | ASN number of the private peering. | `number` | `65514` | no |
| private\_peering\_primary\_peer\_address\_prefix | Primary peer address prefix for the private peering. | `string` | `""` | no |
| private\_peering\_secondary\_peer\_address\_prefix | Secondary peer address prefix for the private peering. | `string` | `""` | no |
| private\_peering\_shared\_key | Shared key for the authentication on the private peering. | `string` | `""` | no |
| private\_peering\_vlan\_id | Client Vlan ID of the private peering. | `number` | `2048` | no |
| resource\_group\_name | Resource group where the resource will be deployed. | `string` | n/a | yes |
| tags | Tags to add to the resource. | `map` | `{}` | no |
| virtual\_network\_gateway\_name | Name of the virutal network gateway to deploy. | `string` | n/a | yes |
| virtual\_network\_gateway\_public\_ip\_name | Name of the public IP address to be assigned to the virutal network gateway. | `string` | n/a | yes |
| virtual\_network\_gateway\_sku | ExpressRoute SKU of the virtual network gateway to deploy. Remember that there's particular SKUs for ExpressRoute. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| express\_route\_circuit\_authorization\_authorization\_key | Authorization key of the ExpressRoute circuit authorization. |
| express\_route\_circuit\_authorization\_authorization\_use\_status | Status of the authorization of the ExpressRoute circuit authorization. |
| express\_route\_circuit\_authorization\_id | Resource Id of the ExpressRoute circuit authorization. |
| express\_route\_circuit\_id | Id of the deployed ExpressRoute circuit. |
| express\_route\_circuit\_microsoft\_peering\_azure\_asn | ASN used by Azure |
| express\_route\_circuit\_microsoft\_peering\_id | Resource Id of the ExpressRoute circuit peering |
| express\_route\_circuit\_microsoft\_peering\_primary\_azure\_port | Primary port used by Azure for the peering. |
| express\_route\_circuit\_microsoft\_peering\_secondary\_azure\_port | Secondary Port Used by Azure for the peering. |
| express\_route\_circuit\_private\_peering\_azure\_asn | ASN used by Azure |
| express\_route\_circuit\_private\_peering\_id | Resource Id of the ExpressRoute circuit peering |
| express\_route\_circuit\_private\_peering\_primary\_azure\_port | Primary port used by Azure for the peering. |
| express\_route\_circuit\_private\_peering\_secondary\_azure\_port | Secondary Port Used by Azure for the peering. |
| express\_route\_circuit\_service\_key | Service Key of the deployed ExpressRoute circuit. You need to provide this to the external provider. |
| express\_route\_circuit\_service\_provider\_provisioning\_state | Provisioning state of the circuit of the deployed ExpressRoute circuit. |
| express\_route\_virtual\_network\_gateway\_connection | Id of the connection between the virtual network gateway and the ExpressRoute circuit. |
| public\_ip\_fqdn | FQDN of the provisioned public IP address. |
| public\_ip\_id | Id of the provisioned public IP address. |
| virtual\_network\_gateway\_id | ID of the deployed virtual network gateway. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Examples

Usage example is found in the `./examples/default/` folder.

## Inspec

No Inspec tests are done for this module.

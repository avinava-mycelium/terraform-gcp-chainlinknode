# Terraform module for Chainlink nodes

This module is used to create GCP resources to support Chainlink IAC setups.

## Usage implementation

See the [chainlink nodes](https://github.com/avinava-mycelium/chainlink-nodes) for a usage example.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_config | Access configurations, i.e. IPs via which the VM instance can be accessed via the Internet. | <pre>list(object({<br>    nat_ip       = string<br>    network_tier = string<br>  }))</pre> | `[]` | no |
| add\_hostname\_suffix | Adds a suffix to the hostname | `bool` | `true` | no |
| hostname | Hostname of instances | `string` | `""` | no |
| instance\_template | Instance template self\_link used to create compute instances | `any` | n/a | no |
| network | Network to deploy to. Only one of network or subnetwork should be specified. | `string` | `""` | no |
| num\_instances | Number of instances to create. This value is ignored if static\_ips is provided. | `string` | `"1"` | no |
| region | Region where the instances should be created. | `string` | `` | yes |
| static\_ips | List of static IPs for VM instances | `list(string)` | `[]` | no |
| subnetwork | Subnet to deploy to. Only one of network or subnetwork should be specified. | `string` | `""` | no |
| subnetwork\_project | The project that subnetwork belongs to | `string` | `""` | no |
| zone | Zone where the instances should be created. If not specified, instances will be spread across available zones in the region. | `string` | `` | yes |
| machine\_type | Machine configuration for CPU and Memory. | `string` | `` | yes |
| node\_name | Name of CL node. | `string` | `` | yes |
| node\_type | Type of CL node. | `string` | `` | yes |
| project\_id | Project ID in GCP for the code to be deployed. | `string` | `` | yes |

## Outputs

| Name | Description |
|------|-------------|
| disk\_names | The boot disk name of the node |
| instance\_name | The name of the VM instance holding the node |
| disk\_size | The disk size allocated to the node |
| gcs\_startup\_script | The private bucket location for the startup script of the node |
| external\_ip\_addresses | The public IP address of the node |
| internal\_ip\_addresses | The internal static IP address of the node |
| internal\_ip\_names | The internal static IP names of the node |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

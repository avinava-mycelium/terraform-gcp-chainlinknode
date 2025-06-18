# Terraform module for Chainlink nodes

This module is used to create GCP resources to support Chainlink IAC setups.

## Usage implementation

See the [chainlink nodes](https://github.com/avinava-mycelium/chainlink-nodes) for a usage example.

```hcl
module "chainlinknode" {
  source  = "avinava-mycelium/chainlinknode/gcp"
  version = "1.0.11"  # Use latest version for Apple Silicon compatibility
  
  # Required variables
  project_id     = var.project_id
  machine_type   = var.machine_type
  node_name      = var.node_name
  node_type      = var.node_type
  boot_disk_size = var.boot_disk_size
}
```

## Apple Silicon (M1/M2) Compatibility

This module is fully compatible with Apple Silicon Macs starting from **version 1.0.11**. If you're using an M1/M2 Mac, make sure to use version `1.0.11` or later to avoid the deprecated template provider compatibility issues.

## Release Process

### Version Numbering
This module follows [Semantic Versioning](https://semver.org/):
- **MAJOR** (x.0.0): Breaking changes that require user action
- **MINOR** (0.x.0): New features that are backward compatible  
- **PATCH** (0.0.x): Bug fixes and improvements

### Pre-Release Checklist
Before creating a new release:

1. **Test the changes locally**:
   ```bash
   terraform init
   terraform plan
   terraform validate
   ```

2. **Ensure compatibility**:
   - Test on both Intel and Apple Silicon Macs
   - Verify no deprecated provider dependencies
   - Check that all required variables are documented

3. **Update documentation**:
   - Update this README if new variables/outputs are added
   - Update examples if functionality changes
   - Document any breaking changes

### Release Steps

1. **Prepare the release**:
   ```bash
   # Ensure you're on master and up to date
   git checkout master
   git pull origin master
   
   # Check current tags
   git tag --sort=-version:refname | head -5
   ```

2. **Create and push the release**:
   ```bash
   # Create the new tag (replace x.y.z with actual version)
   git tag vx.y.z
   
   # Push the tag to trigger Terraform Registry release
   git push origin vx.y.z
   ```

3. **Verify the release**:
   - Check that the new version appears on [Terraform Registry](https://registry.terraform.io/modules/avinava-mycelium/chainlinknode/gcp)
   - Test the new version in a development environment
   - Update production deployments as needed

### Release Notes Template
When creating a GitHub release, use this template:

```markdown
## vx.y.z - Release Title

### 🚀 New Features
- Feature description

### 🐛 Bug Fixes  
- Bug fix description

### ⚠️ Breaking Changes
- Breaking change description (for major versions only)

### 📋 Notes
- Additional notes or migration instructions
```

### Production Deployment Strategy
- **Development environments**: Can use latest version immediately
- **Production nodes**: Test in staging first, then gradual rollout
- **Apple Silicon developers**: Always use version 1.0.11 or later

### Rollback Process
If a release has issues:
1. Identify the last known good version
2. Update module version in affected deployments
3. Create a patch release with the fix
4. Document the issue and resolution

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
| region | Region where the instances should be created. | `string` | `us-central1` | no |
| static\_ips | List of static IPs for VM instances | `list(string)` | `[]` | no |
| subnetwork | Subnet to deploy to. Only one of network or subnetwork should be specified. | `string` | `""` | no |
| subnetwork\_project | The project that subnetwork belongs to | `string` | `""` | no |
| zone | Zone where the instances should be created. If not specified, instances will be spread across available zones in the region. | `string` | `us-central1-a` | no |
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
| external\_ip\_addresses | The static public IP address of the node |
| external\_ip\_names | The static public IP name of the node |
| internal\_ip\_addresses | The internal static IP address of the node |
| internal\_ip\_names | The internal static IP names of the node |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

variable "project_id" {
  description = "The gcp project ID where the resources need to be deployed"
}
variable "region" {
  description = "Region inside GCP where resources need to be deployed"
  default = "us-central1"
}
variable "zone" {
  description = "Specific zone inside GCP region where resources need to be deployed"
  default = "us-central1-a"
}
variable "subnetwork" {
  description = "Subnet CIDR for the chainlink nodes"
  default = "sb-nodes-chainlink"
}
variable "network_tag" {
  description = "Firewall rules for chainlink nodes"
  default = "fw-sb-node-chainlink"
}
variable "machine_type" {
  description = "CPU and Memory speicifcations for VM instance"
}
variable "boot_disk_size" {
  description = "Disk size for the chainlink node"
  default = "10"
}
variable "boot_disk_type" {
  description = "Persistent SSD disk type for VM instance"
  default = "pd-ssd"
}
variable "network" {
  description = "Virtual Private Cloud to host the chainlink resources"
  default = "default"
}
variable "service_account_scope" {
  description = "Service account scope"
  default = "cloud-platform"
}
variable "image_family" {
  description = "GCP image family"
  default = "cos-stable"
}
variable "image_project" {
  description = "GCP image project"
  default = "cos-cloud"
}
variable "service_account_name" {
  description = "Service account name"
  default = "CL_Service_Account"
}
variable "service_account_version" {
  description = "Service account version"
  default = "1"
}
variable "int_address_type" {
  description = "Type of address the VM instance. Can be internal or external."
  default = "INTERNAL"
}

variable "ext_address_type" {
  description = "Type of address the VM instance. Can be internal or external."
  default = "EXTERNAL"
}

variable "address_tier" {
  description = "Tier type for the address to be allocated to the chainlink node"
  default = "PREMIUM"
}
variable "node_name" {
  description = "Chainlink node name. Eg xdai.heco, bsc etc"
}
variable "node_type" {
  description = "Type of the chainlink node. Can be OCR, FM , Keeper"
}
variable "node_count" {
  description = "Number of the chainlink node running"
  default = "1"
}
variable "node_source" {
  description = "Chainlink as the source of the node."
  default = "cl"
}
variable "startup_script_prefix" {
  description = "Private bucket in GCP to store the startup script for the chainlink application"
  default = "gs://myc-node/cl/cl-metadata-script/"
}
variable "startup_script_suffix" {
  description = "script name suffix"
  default = "startup.sh"
}

variable "is_gen_startup_script" {
  description = "boolean to check if we want to go with particular script or generic one"
  default = false
}

variable "vm_startup_script" {
  description = "Generic startup script for VM"
  default = "gs://myc-infra-scripts/startup-scripts/vm-startup-1.sh"
}

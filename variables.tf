variable "project_id" {}
variable "region" {}
variable "zone" {}
variable "subnetwork" {
  default = "sb-nodes-chainlink"
}
variable "network_tag" {
  default = "fw-sb-node-chainlink"
}
variable "machine_type" {}
variable "boot_disk_size" {
  default = "50"
}
variable "boot_disk_type" {
  default = "pd-ssd"
}
variable "network" {
  default = "default"
}
variable "service_account_scope" {
  default = "cloud-platform"
}
variable "image_family" {
  default = "cos-stable"
}
variable "image_project" {
  default = "cos-cloud"
}
variable "service_account_name" {
  default = "CL_Service_Account"
}
variable "service_account_version" {
  default = "1"
}
variable "address_type" {
  default = "INTERNAL"
}
variable "address_tier" {
  default = "PREMIUM"
}
variable "node_name" {
}
variable "node_type" {
}
variable "node_count" {
  default = "1"
}
variable "node_source" {
  default = "cl"
}
variable "startup_script_prefix" {
  default = "gs://myc-node/cl/cl-metadata-script/"
}
variable "startup_script_suffix" {
  default = "startup.sh"
}

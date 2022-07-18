output "instance_name" {
  description = "The name of the VM instance holding the node"
  value = google_compute_instance.this.name
}

output "disk_name" {
  description = "The boot disk name of the node"
  value = google_compute_instance.this.boot_disk[0].device_name
}

output "disk_size" {
  description = "The disk size allocated to the node"
  value = google_compute_instance.this.boot_disk[0].initialize_params[0].size
}

output "gcs_startup_script" {
  description = "The private bucket location for the startup script of the node"
  value = google_compute_instance.this.metadata.startup-script-url
}

output "external_ip_addresses" {
  description = "The public IP address of the node"
  value = google_compute_instance.this.network_interface[0].access_config[0].nat_ip
}

output "internal_ip_addresses" {
  description = "The internal static IP address of the node"
  value = module.address.addresses[0]
}

output "internal_ip_names" {
  description = "The internal static IP names of the node"
  value = module.address.names[0]
}
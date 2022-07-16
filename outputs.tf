output "instances_details" {
  description = "List of all details for compute instances"
  value       = google_compute_instance.this.*
}

output "static_internal_ip" {
  description = "List of all details for the internal IP"
  value       = module.address.*
}

resource "google_compute_instance" "this" {
  name         = "${var.node_source}-${var.node_name}-${var.node_type}-${var.node_count}"
  machine_type = var.machine_type
  zone         = var.zone

  tags = [var.network_tag]

  boot_disk {
    device_name = "pd-${var.node_source}-${var.node_name}-${var.node_type}-${var.node_count}"
    initialize_params {
      size = var.boot_disk_size
      type = var.boot_disk_type
      image = data.google_compute_image.cos_image.self_link
    }
  }

  network_interface {
    network = var.network
    subnetwork = var.subnetwork
    network_ip = module.address.addresses[0]
    access_config {
    }
  }

  metadata = {
    node = var.node_name
    type = var.node_type
    source = var.node_source
    startup-script-url = "${var.startup_script_prefix}${var.node_name}-${var.node_type}-${var.startup_script_suffix}"
  }

  service_account {
    email = data.google_secret_manager_secret_version.sa.secret_data
    scopes = [var.service_account_scope]
  }
}

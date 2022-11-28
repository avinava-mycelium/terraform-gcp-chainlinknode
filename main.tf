resource "google_compute_instance" "this" {
  name         = "${var.node_source}-${var.node_name}-${var.node_type}-${var.node_count}"
  machine_type = var.machine_type
  zone         = var.zone
  allow_stopping_for_update = true

  tags = [var.network_tag] // firewall rules implemeted via network tags

  boot_disk {
    device_name = "pd-${var.node_source}-${var.node_name}-${var.node_type}-${var.node_count}"
    initialize_params {
      size = var.boot_disk_size
      type = var.boot_disk_type
      image = data.google_compute_image.cos_image.self_link // dynamic allocation of latest stable OS image
    }
  }

  network_interface {
    network = var.network
    subnetwork = var.subnetwork
    network_ip = module.int_address.addresses[0] // dynamic allocation of static internal IP
    access_config {
      nat_ip = module.ext_address.addresses[0] // dynamic allocation of static external IP
    }
  }

  metadata = {
    node = var.node_name
    type = var.node_type
    source = var.node_source
    startup-script-url = var.is_gen_startup_script ? var.vm_startup_script : "${var.startup_script_prefix}${var.node_name}-${var.node_type}-${var.startup_script_suffix}" // deployment script for application stored in a private bucket
  }

  service_account {
    email = data.google_secret_manager_secret_version.sa.secret_data // Service account details pulled from secrets manager
    scopes = [var.service_account_scope]
  }
}

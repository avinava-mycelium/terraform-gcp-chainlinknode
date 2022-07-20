module "address" {
  source       = "terraform-google-modules/address/google"
  version      = "3.0.0"
  project_id   = var.project_id
  region       = var.region
  subnetwork   = var.subnetwork
  names        = ["ip-int-${var.node_source}-${var.node_name}-${var.node_type}-${var.node_count}"]
  address_type = var.address_type
  network_tier = var.address_tier
}

module "ext_address" {
  source       = "terraform-google-modules/address/google"
  version      = "3.0.0"
  project_id   = var.project_id
  region       = var.region
  names        = ["ip-ext-${var.node_source}-${var.node_name}-${var.node_type}-${var.node_count}"]
  address_type = "EXTERNAL"
  network_tier = var.address_tier
}
module "int_address" {
  source       = "terraform-google-modules/address/google"
  version      = "3.1.1"
  project_id   = var.project_id
  region       = var.region
  subnetwork   = var.subnetwork
  names        = ["ip-int-${var.node_source}-${var.node_name}-${var.node_type}-${var.node_count}"]
  address_type = var.int_address_type
  network_tier = var.address_tier
}

module "ext_address" {
  source       = "terraform-google-modules/address/google"
  version      = "3.1.1"
  project_id   = var.project_id
  region       = var.region
  names        = ["ip-ext-${var.node_source}-${var.node_name}-${var.node_type}-${var.node_count}"]
  address_type = var.ext_address_type
  network_tier = var.address_tier
}
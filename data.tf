data "google_compute_image" "cos_image" {
  family  = var.image_family
  project = var.image_project
}

data "google_secret_manager_secret_version" "sa" {
  provider = google-beta
  secret = var.service_account_name
  version = var.service_account_version
  project = var.project_id
}
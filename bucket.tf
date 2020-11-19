resource "google_storage_bucket" "static-site" {
  project = var.project_id
  name = var.image_name
  location = "US"
}



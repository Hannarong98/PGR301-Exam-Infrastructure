terraform {
  backend "gcs" {
    bucket = var.bucket_name
    prefix = var.bucket_directory_prefix
    credentials = "terraform-credentials.json"
  }
}

provider "google-beta" {
  credentials = file("terraform-credentials.json")
  project     = var.project_id
  version = "~> 3.0.0-beta.1"
}


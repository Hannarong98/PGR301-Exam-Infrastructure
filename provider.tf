terraform {
  backend "gcs" {
    bucket = "pgr301-exam-terraform-bucket"
    prefix = "terraform/state"
    credentials = "terraform-credentials.json"
  }
}

provider "google-beta" {
  credentials = file("terraform-credentials.json")
  project     = var.project_id
  version = "~> 3.0.0-beta.1"
}


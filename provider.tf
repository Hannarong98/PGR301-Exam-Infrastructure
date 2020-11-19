terraform {
  backend "gcs" {
    bucket = "pgr301-exam-bucket-57dy7x52hm"
    prefix = "terraform/state"
    credentials = "terraform-credentials.json"
  }
}

provider "google-beta" {
  credentials = file("terraform-credentials.json")
  project     = var.project_id
  version = "~> 3.0.0-beta.1"
}


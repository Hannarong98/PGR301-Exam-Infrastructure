terraform {
  backend "gcs" {
    bucket = "pgr301-terraform-state"
    prefix = "terraformstate"
    credentials = "terraform.json"
  }
}

provider "google-beta" {
  credentials = file("terraform.json")
  project     = "terraform-292215"
  version = "~> 3.0.0-beta.1"
}


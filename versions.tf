terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
    statuscake = {
      source = "terraform-providers/statuscake"
    }
  }
  required_version = ">= 0.13"
}

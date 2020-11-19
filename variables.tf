variable "bucket_name" {
  description = "Name of the bucket"
  type = string
  default = "pgr301-exam-bucket-57dy7x52hm"
}

variable "bucket_directory_prefix" {
  description = "The directory where terraform state-file will be saved in"
  type = string
  default = "terraform/state"
}

variable "deploy_region" {
  description = "Region where the application should deploy"
  type = string
  default = "us-central1"
}


variable "project_id" {
  description = "Id of the project"
  type = string
  default = "pgr301-exam-hannarong"
}

variable "service_runner" {
  description = "Name for the service runner"
  type = string
  default = "cloud_run_srv"
}

variable "logz_token" {

}

variable "logz_url" {

}
variable "bucket_name" {
  description = "Name of the bucket"
  type = string
  default = "pgr301-exam-terraform-bucket"
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
variable "logz_token" {

}

variable "project_id" {
  description = "Id of the project"
  type = string
  default = "pgr301-exam-hannarong"
}

variable "image_name" {
  description = "Docker image name of the project"
  type = string
  default = "gcr.io/pgr301-exam-hannarong/examapp"
}

variable "deploy_region" {
  description = "Region where the application should deploy"
  type = string
  default = "us-central1"
}
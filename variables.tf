variable "deploy_region" {
  description = "Region where the application should deploy"
  type = string
  default = "us-central1"
}

variable "project_id" {
  description = "Id of the project"
  type = string
  default = "pgr301-exam-hannarong-296202"
}

variable "service_runner" {
  description = "Name of the service runner"
  type = string
  default = "cloud-run-srv-296202"
}

variable "status_cake_website_name" {
  description = "Name of your website"
  type = string
  default = "DimFlow"
}

variable "status_cake_check_rate" {
  description = "Check rate frequency in seconds"
  type = number
  default = 300
}

variable "status_cake_contact_group" {
  description = "Array of contact group id's adjust the tuple type comma separated for more group id's"
  type = tuple([string])
  default = ["195453"]
}

variable "logz_token" {
  description = "Token for logz.io"
}

variable "logz_url" {
  description = "Listener url for logz.io"
}

variable "status_cake_username" {
  description = "Username for statuscake"
}

variable "status_cake_api_key" {
  description = "Api key for statuscake"
}


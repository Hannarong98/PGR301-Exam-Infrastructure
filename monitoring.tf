provider "statuscake" {
  username = var.status_cake_username
  apikey = var.status_cake_api_key
}

resource "statuscake_test" "google" {
  test_type = "HTTP"
  website_name = "DimFlow"
  website_url = google_cloud_run_service.pgr301-exam.status[0].url
  check_rate = 300
  contact_group = ["195453"]
}
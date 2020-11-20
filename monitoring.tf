provider "statuscake" {
  username = var.fake_secret
  apikey = var.fake_secret
}

resource "statuscake_test" "google" {
  test_type = "HTTP"
  website_name = "DimFlow"
  website_url = google_cloud_run_service.pgr301-exam.status[0].url
  check_rate = 300
}
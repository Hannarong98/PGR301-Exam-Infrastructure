resource "google_cloud_run_service" "hello" {
  name = "helloworld-service"
  location = "us-central1"
  project = var.project_id

  template {
    spec {
      containers {
        image = "gcr.io/terraform-292215/helloworld@sha256:0ee92532317e87faadbe0231986e827605d1d97cbf9acd9c44557f49a416867d"
        env {
          name = "LOGZ_TOKEN"
          value = var.logz_token
        }
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.hello.location
  project = google_cloud_run_service.hello.project
  service = google_cloud_run_service.hello.name
  policy_data = data.google_iam_policy.noauth.policy_data
}
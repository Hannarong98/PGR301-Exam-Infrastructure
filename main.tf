resource "google_cloud_run_service" "pgr301-exam" {
  name = "cloud-run-srv-296202"
  location = "us-central1"
  project = "pgr301-exam-hannarong-296202"

  template {
    spec {
      containers {
        image = "gcr.io/pgr301-exam-hannarong-296202/examapp:89b67fa97224ed5341b02194456a77a50617dc9e"
        env {
          name = "LOGZ_TOKEN"
          value = var.logz_token
        }
        env {
          name = "LOGZ_URL"
          value = var.logz_url
        }
        resources {
          limits = {
            memory = "512Mi"
          }
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
  location = google_cloud_run_service.pgr301-exam.location
  project = google_cloud_run_service.pgr301-exam.project
  service = google_cloud_run_service.pgr301-exam.name
  policy_data = data.google_iam_policy.noauth.policy_data
}
resource "google_cloud_run_service" "pgr301-exam" {
  name = "cloud-run-srv"
  location = "us-central1"
  project = "pgr301-exam-hannarong"

  template {
    spec {
      containers {
        image = "gcr.io/pgr301-exam-hannarong/examapp@sha256:6b12b8f341798e76c0f8c0575ebd848d4327c924a3b0b563c86c0e011d6282fb"
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
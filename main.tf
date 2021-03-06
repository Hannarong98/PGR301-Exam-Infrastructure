resource "google_cloud_run_service" "pgr301-exam" {
  name = var.service_runner
  location = var.deploy_region
  project = var.project_id

  template {
    spec {
      containers {
        image = "gcr.io/pgr301-exam-hannarong-296202/examapp@sha256:20b1fd713856d294be40ca714921291aa72cd4860f4179d6500e88fdb565d64b"
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

output "url" {
  value = google_cloud_run_service.pgr301-exam.status[0].url
}